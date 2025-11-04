import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_streaming_text_markdown/flutter_streaming_text_markdown.dart';
import 'package:strava/features/core/controllers/chat/messages/messages_controller_provider.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/extensions/context_extensions.dart';

class SMessageCard extends ConsumerWidget {
  final int idx;
  final bool isLastMessage;
  
  const SMessageCard({super.key, required this.idx, required this.isLastMessage, });

  @override
  Widget build(BuildContext context, ref) {
    final message = ref.watch(SMessagesControllerProvider.select((state) {
      final messagesLength = state.messages.length;
      return state.messages[messagesLength - 1 - idx];
    }));

    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: context.screenWidht()
        ),
        margin: EdgeInsets.symmetric(
          vertical: SSizes.sm,
          horizontal: message.isUser ? SSizes.md : 0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: message.isUser ? SSizes.sm * 1.5 : 0,
          vertical: SSizes.sm,
        ),
        decoration: BoxDecoration(
          color: message.isUser ? SAppColors.dark.white : null,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SSizes.md),
            topRight: Radius.circular(SSizes.md),
            bottomLeft: Radius.circular(message.isUser ? SSizes.md : 0),
            bottomRight: Radius.circular(message.isUser ? 0 : SSizes.md), 
          )
        ),
        child: message.isUser ? Text(
          message.message, 
          style: TextStyle(
            color: message.isUser ? SAppColors.black : SAppColors.dark.white,
            fontSize: 15,
            fontWeight: FontWeight.w500
          ),
        ) : isLastMessage ? StreamingTextMarkdown.claude(
            text: message.message,
          ) : StreamingTextMarkdown.instant(
            text: message.message,
          ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_streaming_text_markdown/flutter_streaming_text_markdown.dart';
// import 'package:strava/features/core/controllers/chat/messages/messages_controller_provider.dart';
// import 'package:strava/utils/const/colors.dart';
// import 'package:strava/utils/const/sizes.dart';
// import 'package:strava/utils/extensions/context_extensions.dart';

// class SMessageCard extends ConsumerWidget {
//   final int idx;
//   final bool isLastMessage;
  
//   const SMessageCard({super.key, required this.idx, required this.isLastMessage, });

//   @override
//   Widget build(BuildContext context, ref) {
//     final message = ref.watch(SMessagesControllerProvider.select((state) {
//       final messagesLength = state.messages.length;
//       return state.messages[messagesLength - 1 - idx];
//     }));

//     return Align(
//       alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         constraints: BoxConstraints(
//           maxWidth: context.screenWidht() * 0.6
//         ),
//         margin: EdgeInsets.symmetric(
//           vertical: SSizes.sm
//         ),
//         padding: EdgeInsets.symmetric(
//           horizontal: SSizes.sm * 1.5,
//           vertical: SSizes.sm,
//         ),
//         decoration: BoxDecoration(
//           color: message.isUser ? SAppColors.dark.white : SAppColors.primary,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(SSizes.md),
//             topRight: Radius.circular(SSizes.md),
//             bottomLeft: Radius.circular(message.isUser ? SSizes.md : 0),
//             bottomRight: Radius.circular(message.isUser ? 0 : SSizes.md), 
//           )
//         ),
//         child: message.isUser ? Text(
//           message.message, 
//           style: TextStyle(
//             color: message.isUser ? SAppColors.black : SAppColors.dark.white,
//             fontSize: 15,
//             fontWeight: FontWeight.w500
//           ),
//         ) : isLastMessage ? StreamingTextMarkdown.claude(
//             text: message.message,
//           ) : StreamingTextMarkdown.instant(
//             text: message.message,
//           ),
//       ),
//     );
//   }
// }