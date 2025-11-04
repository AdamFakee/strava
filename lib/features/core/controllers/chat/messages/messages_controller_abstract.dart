import 'package:strava/features/core/models/message_model.dart';

class SMessagesControllerStateType {
  final List<SMessageModel> messages;
  final bool isAiThinking; // chờ AI phản hồi

  SMessagesControllerStateType({
    required this.messages,
    this.isAiThinking = false,
  });

  SMessagesControllerStateType copyWith({
    List<SMessageModel>? messages,
    bool? isAiThinking,
  }) {
    return SMessagesControllerStateType(
      messages: messages ?? this.messages,
      isAiThinking: isAiThinking ?? this.isAiThinking,
    );
  }
}

abstract class MessagesControllerAbstract {
  /// `user` asking `AI`
  void ask(String text);

  /// `AI` starting thinking to response
  void startResponse();

  /// update response by `streaming response`
  void updateResponse(String text);

  void finishResponse();
  
}
