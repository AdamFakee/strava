import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/const/text_strings.dart';
import 'package:strava/utils/routers/app_router_names.dart';

class SLoginForm extends StatelessWidget {
  const SLoginForm({super.key});

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
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
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
          ),
        ],
      ),
    );
  }
}
