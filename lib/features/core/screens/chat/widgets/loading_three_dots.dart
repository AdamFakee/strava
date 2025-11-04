import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/core/controllers/chat/messages/messages_controller_provider.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/sizes.dart';

class SChatThinkingIndicator extends ConsumerStatefulWidget {
  const SChatThinkingIndicator({super.key});

  @override
  ConsumerState<SChatThinkingIndicator> createState() => _SChatThinkingIndicatorState();
}

class _SChatThinkingIndicatorState extends ConsumerState<SChatThinkingIndicator> with TickerProviderStateMixin {
  final duration = Duration(milliseconds: 500);

  late final AnimationController firstController;
  late final AnimationController secondController;
  late final AnimationController thirdController;

  late final Animation<double> firstAnimation;
  late final Animation<double> secondAnimation;
  late final Animation<double> thirdAnimation;

  @override
  void initState() {
    super.initState();

    firstController = AnimationController(
      vsync: this,
      duration: duration,
    );

    secondController = AnimationController(
      vsync: this,
      duration: duration,
    );

    thirdController = AnimationController(
      vsync: this,
      duration: duration,
    );

    firstAnimation = Tween<double>(begin: 0, end: 1).animate(firstController);
    secondAnimation = Tween<double>(begin: 0, end: 1).animate(secondController);
    thirdAnimation = Tween<double>(begin: 0, end: 1).animate(thirdController);

    // listener 
    firstController.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        firstController.reverse();
        secondController..reset()..forward();
      }
    });
    secondController.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        secondController.reverse();
        thirdController..reset()..forward();
      }
    });
    thirdController.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        thirdController.reverse();
        firstController..reset()..forward();
      }
    });

    // start animation
    firstController..reset()..forward();
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isThinking = ref.watch(
      SMessagesControllerProvider.select((s) => s.isAiThinking),
    );

    if (isThinking == false) return const SizedBox.shrink();

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: SSizes.md,
          vertical: SSizes.sm,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: SSizes.sm * 1.5,
          vertical: SSizes.sm,
        ),
        decoration: BoxDecoration(
          color: SAppColors.primary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(SSizes.md),
            topRight: Radius.circular(SSizes.md),
            bottomRight: Radius.circular(SSizes.md),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: SSizes.xs,
          children: [
            AnimatedBuilder(
              animation: firstController, 
              builder:(context, child) {
                return FadeTransition(
                  opacity: firstAnimation,
                  child: child,
                );
              },
              child: dotIndicator(),
            ),
            AnimatedBuilder(
              animation: secondController, 
              builder:(context, child) {
                return FadeTransition(
                  opacity: secondAnimation,
                  child: child,
                );
              },
              child: dotIndicator(),
            ),
            AnimatedBuilder(
              animation: thirdController, 
              builder:(context, child) {
                return FadeTransition(
                  opacity: thirdAnimation,
                  child: child,
                );
              },
              child: dotIndicator(),
            )
          ]
        ),
      ),
    );
  }

  Widget dotIndicator() {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(SSizes.all),
      ),
    );
  }
}
