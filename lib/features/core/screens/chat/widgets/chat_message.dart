
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/core/controllers/chat/messages/messages_controller_provider.dart';
import 'package:strava/features/core/screens/chat/widgets/loading_three_dots.dart';
import 'package:strava/features/core/screens/chat/widgets/message_card.dart';

class ChatMessage extends ConsumerWidget {
  const ChatMessage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final messageCount = ref.watch(SMessagesControllerProvider.select((s) => s.messages.length));
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            reverse: true,
            itemCount: messageCount,
            itemBuilder: (context, index) {
              return SMessageCard(
                key: ValueKey(index),
                idx: index,
                isLastMessage: messageCount - 1 == index,
              );
            },
          ),
        ),
        const SChatThinkingIndicator()
      ],
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_streaming_text_markdown/flutter_streaming_text_markdown.dart';
// import 'package:strava/features/core/controllers/chat/messages/messages_controller_provider.dart';
// import 'package:strava/features/core/screens/chat/widgets/loading_three_dots.dart';
// import 'package:strava/utils/const/colors.dart';
// import 'package:strava/utils/const/sizes.dart';
// import 'package:strava/utils/extensions/context_extensions.dart';

// class ChatMessage extends ConsumerWidget {
//   const ChatMessage({super.key});

//   @override
//   Widget build(BuildContext context, ref) {
//     final messages = ref.watch(SMessagesControllerProvider).messages;
//     // final length = messages.length;
//     return Column(
//       children: [
//         Expanded(
//           child: ListView.builder(
//             reverse: true,
//             padding: EdgeInsets.all(SSizes.md),
//             itemCount: messages.length,
//             itemBuilder: (context, index) {
//               return Consumer(
//                 builder: (context, ref, child) {
//                   // final messagesLength = ref.read(SMessagesControllerProvider).messages.length;
//                   final message = ref.watch(SMessagesControllerProvider.select((state) => state.messages[index]));
          
//                   return Align(
//                     alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
//                     child: Container(
//                       constraints: BoxConstraints(
//                         maxWidth: context.screenWidht() * 0.6
//                       ),
//                       margin: EdgeInsets.symmetric(
//                         vertical: SSizes.sm
//                       ),
//                       padding: EdgeInsets.symmetric(
//                         horizontal: SSizes.sm * 1.5,
//                         vertical: SSizes.sm,
//                       ),
//                       decoration: BoxDecoration(
//                         color: message.isUser ? SAppColors.dark.white : SAppColors.primary,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(SSizes.md),
//                           topRight: Radius.circular(SSizes.md),
//                           bottomLeft: Radius.circular(message.isUser ? SSizes.md : 0),
//                           bottomRight: Radius.circular(message.isUser ? 0 : SSizes.md), 
//                         )
//                       ),
//                       child: message.isUser ? Text(
//                         message.message, 
//                         style: TextStyle(
//                           color: message.isUser ? SAppColors.black : SAppColors.dark.white,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w500
//                         ),
//                       ) : StreamingTextMarkdown.claude(text: message.message,),
//                     ),
//                   );
//                 },
//               );
//             },
//           ),
//         ),
//         const SChatThinkingIndicator()
//       ],
//     );
//   }
// }