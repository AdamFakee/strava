import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/core/controllers/chat/messages/messages_controller_provider.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/extensions/context_extensions.dart';

class ChatInput extends ConsumerStatefulWidget {
  const ChatInput({
    super.key,
  });

  @override
  ConsumerState<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends ConsumerState<ChatInput> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context,) {
    final ask = ref.read(SMessagesControllerProvider.notifier).ask;

    return Container(
      color: Colors.black,
      padding: EdgeInsets.all(SSizes.sm),
      margin: EdgeInsets.only(
        bottom: context.keyboardHeight
      ),
      child: Row(
        spacing: SSizes.md,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Nhập câu hỏi của bạn...',
                hintStyle: TextStyle(color: Colors.grey[500]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[100],
                
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16, vertical: 12
                ),
              ),
              style: TextStyle(color: Colors.black),
            )
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white10,
              border: Border.all(),
              borderRadius: BorderRadius.circular(SSizes.all)
            ),
            child: IconButton(
              onPressed: () {
                if(controller.text.isNotEmpty) {
                  ask(controller.text);
                  controller.clear();
                }
              }, 
              icon: Transform.rotate(
                angle: -pi/4,
                child: Icon(Icons.send)
              )
            ),
          )
        ],
      ),
    );
  }
}