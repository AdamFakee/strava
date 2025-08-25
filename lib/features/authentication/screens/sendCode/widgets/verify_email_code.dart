import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/common/widgets/deviders/devider_with_text_center.dart';
import 'package:strava/features/authentication/controllers/sendCode/write_verification_code_provider.dart';
import 'package:strava/utils/const/global.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/const/text_strings.dart';

class VerifyEmailCode extends ConsumerStatefulWidget {
  const VerifyEmailCode({super.key});

  @override
  ConsumerState<VerifyEmailCode> createState() => _VerifyEmailCodeState();
}

class _VerifyEmailCodeState extends ConsumerState<VerifyEmailCode> {
  late final List<TextEditingController> textControllers;
  late final List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    textControllers = List.generate(SGlobals.numOfInputsVerifyCode, (_) => TextEditingController());
    focusNodes = List.generate(SGlobals.numOfInputsVerifyCode, (_) => FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    final inputState = ref.watch(sWriteVerificationCodeProvider);
    final inputProvider = ref.read(sWriteVerificationCodeProvider.notifier);

    return Column(
      spacing: SSizes.md,
      children: [
        // - inputs
        Row(
          spacing: SSizes.md,
          children: List.generate(inputState.length, (idx) {
            if (inputState[idx]) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (!focusNodes[idx].hasFocus) {
                  FocusScope.of(context).requestFocus(focusNodes[idx]);
                }
              });
            }
            return Expanded(
              child: TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                controller: textControllers[idx],
                maxLength: 1,
                focusNode: focusNodes[idx],
                enabled: inputState[idx],
                onChanged: (value) => value.isNotEmpty ? inputProvider.next(idx) : "",
                decoration: const InputDecoration(counterText: "",),
                textAlign: TextAlign.center,
              ),
            );
          }),
        ),

        // - buttons
        Column(
          spacing: SSizes.sm / 2,
          children: [
            // get new code
            OutlinedButton(
              onPressed: () {},
              child: Text(
                STextStrings.getNewCode,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),

            SDeviderWithTextCenter(text: STextStrings.or),

            // reset written code
            ElevatedButton(
              onPressed: () {
                for (var c in textControllers) {
                  c.clear();
                }
                inputProvider.reset();
              },
              child: Text(
                STextStrings.resetWrittenCode,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        )
      ],
    );
  }
}
