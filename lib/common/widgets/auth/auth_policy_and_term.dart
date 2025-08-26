import 'package:flutter/material.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/const/text_strings.dart';

class SAuthPolicyAndTerm extends StatelessWidget {
  const SAuthPolicyAndTerm({
    super.key,
    required this.onChangedCheckBox
  });

  final void Function(bool? value) onChangedCheckBox;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: false, onChanged: onChangedCheckBox),
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