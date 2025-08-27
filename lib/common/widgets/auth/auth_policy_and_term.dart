import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/authentication/controllers/term_and_condition.dart/term_and_condition_provider.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/const/text_strings.dart';

class SAuthPolicyAndTerm extends ConsumerWidget {
  const SAuthPolicyAndTerm({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(STermAndConditionProvider.notifier);
    final state = ref.watch(STermAndConditionProvider);

    return Row(
      children: [
        Checkbox(
          value: state, 
          onChanged: (value) => provider.toggle(),
          activeColor: SAppColors.primary,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: STextStrings.byCountinuing),
    
                WidgetSpan(child: SizedBox(width: SSizes.sm / 2)),
    
                TextSpan(
                  text: STextStrings.termAndServices,
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
    
                WidgetSpan(child: SizedBox(width: SSizes.sm / 2)),
                TextSpan(text: STextStrings.and),
    
                WidgetSpan(child: SizedBox(width: SSizes.sm / 2)),
                TextSpan(
                  text: STextStrings.privacyPoliCy,
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}