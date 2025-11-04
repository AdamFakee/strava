// ignore_for_file: unnecessary_this

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/core/controllers/chat/messages/messages_controller_abstract.dart';
import 'package:strava/features/core/models/message_model.dart';
import 'package:strava/main/app_env.dart';

class SMessagesControllerState extends Notifier<SMessagesControllerStateType> implements MessagesControllerAbstract {
  @override
  SMessagesControllerStateType build() {
    return SMessagesControllerStateType(messages: []);
  }
  
  @override
  void ask(String text) {
    if(text.isEmpty) return;

    final newMessages = SMessageModel.user(text);

    state = state.copyWith(
      messages: [...state.messages, newMessages]
    );

    this.startResponse();
  }
  
  @override
  void startResponse() async {
    final lastUserMessage = state.messages.last;
    if(lastUserMessage.isUser == false) return;

    // AI start thinking
    state = state.copyWith(isAiThinking: true);

    // create promt
    final promt = _convertMessageToPrompt(lastUserMessage);

    await _callGeminiStream(promt);
  }
  
  @override
  void updateResponse(String text) {
    if (text.isEmpty) return;

    final messages = [...state.messages];
    if (messages.isEmpty) return;

    // end AI Thinking
    state = state.copyWith(isAiThinking: false);

    final lastIndex = messages.length - 1;
    final lastMessage = messages[lastIndex];

    if (lastMessage.isUser) {
      // Lần đầu: thêm tin nhắn AI mới
      messages.add(SMessageModel.ai(text: text));
    } else {
      // Cập nhật tin nhắn AI cuối cùng
      messages[lastIndex] =
          lastMessage.copyWith(message: lastMessage.message + text);
    }

    state = state.copyWith(messages: messages);
  }


  @override
  void finishResponse() {
    final messages = [...state.messages];
    if (messages.isEmpty) return;

    final lastMessage = messages.last;

    messages.last = lastMessage.copyWith(isStreaming: false);

    state = state.copyWith(messages: messages);
  }

  Object _convertMessageToPrompt(SMessageModel message) {
    final prompt = {
      "contents": [
        {
          "parts": [
            {
              "text": message.message
            }
          ]
        }
      ]
    };

    return prompt;
  }


  Future<void> _callGeminiStream(Object promt ) async {
    final apiKey = SAppEnv.openAiApiKey;
    final dio = Dio();

    final url = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:streamGenerateContent?alt=sse';

    try {
      final response = await dio.post<ResponseBody>(
        url,
        data: promt,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'x-goog-api-key': apiKey,
          },
          responseType: ResponseType.stream,
        ),
      );

      utf8.decoder.bind(response.data!.stream)
          .transform(const LineSplitter())
          .listen((line) {
          if (line.startsWith('data: ')) {
            final payload = line.substring(6).trim();
            if (payload == '[DONE]') {
              return;
            }

            try {
              final jsonObj = jsonDecode(payload);
              final text =
                  jsonObj['candidates']?[0]?['content']?['parts']?[0]?['text'];
              if (text != null) {
                this.updateResponse(text);
              }
            } catch (e) {
              print('Error: $e');
            }
            
          }
          
        },
        onDone: () {
          this.finishResponse();
        },
      );

    } catch (e) {
      print('Error: $e');
    }
  }
  
}

