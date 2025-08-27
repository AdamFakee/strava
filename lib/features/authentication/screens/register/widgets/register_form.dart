import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strava/common/widgets/auth/auth_policy_and_term.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/const/text_strings.dart';
import 'package:strava/utils/routers/app_router_names.dart';

class SRegisterForm extends StatelessWidget {
  const SRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        spacing: SSizes.md,
        children: [
          // email
          TextFormField(
            decoration: InputDecoration(hintText: STextStrings.email),
          ),

          // submit button
          ElevatedButton(onPressed: () {
            context.push(SAppRouterNames.alterSendCodeToEmail);
          }, child: Text(STextStrings.register)),

          // read policy & term
          SAuthPolicyAndTerm(),
        ],
      ),
    );
  }
}
