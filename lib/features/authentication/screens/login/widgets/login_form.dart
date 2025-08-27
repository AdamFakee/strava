import 'package:flutter/material.dart';
import 'package:strava/common/widgets/auth/auth_policy_and_term.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/const/text_strings.dart';


class SLoginForm extends StatelessWidget {
  const SLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        spacing: SSizes.sm,
        children: [
          // email
          TextFormField(
            decoration: InputDecoration(
              hintText: STextStrings.email
            ),
          ),
    
          // submit button
          ElevatedButton(
            onPressed: () {},
            child: Text(STextStrings.continueText),
          ),
    
          // term and policy
          SAuthPolicyAndTerm()
        ],
      ),
    );
  }
}