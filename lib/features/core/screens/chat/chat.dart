import 'package:flutter/material.dart';
import 'package:strava/common/widgets/appBars/app_bar.dart';
import 'package:strava/features/core/screens/chat/widgets/chat_input.dart';
import 'package:strava/features/core/screens/chat/widgets/chat_message.dart';

class SChatScreen extends StatelessWidget {
  const SChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SAppBar(
        showBackButton: true,
        title: 'AI Assistant',
      ),
      body: ChatMessage(),
      bottomNavigationBar: const ChatInput(),
    );
  }
}