import 'package:flutter/material.dart';

/// tin nhắn xuất phát từ user hay model
enum SMessageRole { user, model }

class SMessageModel {
  final String id; // định danh duy nhất (UUID)
  final bool isUser; // true nếu là user, false nếu là AI
  final String message; // nội dung
  final DateTime timestamp; // thời gian gửi
  final bool isStreaming; // true nếu đang stream dần (AI đang trả lời)
  final bool isError; // true nếu có lỗi khi gửi / gọi API
  final SMessageRole role;
  final bool isMarkdown; // có cần render Markdown không?

  SMessageModel({
    required this.id,
    required this.isUser,
    required this.message,
    required this.timestamp,
    this.isStreaming = false,
    this.isError = false,
    required this.role,
    this.isMarkdown = true,
  });

  factory SMessageModel.user(String text) => SMessageModel(
    id: UniqueKey().toString(),
    isUser: true,
    message: text,
    timestamp: DateTime.now(),
    role: SMessageRole.user
  );

  factory SMessageModel.ai({
    required String text,
    bool isStreaming = true,
    bool isError = false,
  }) => SMessageModel(
    id: UniqueKey().toString(),
    isUser: false,
    message: text,
    timestamp: DateTime.now(),
    isStreaming: isStreaming,
    isError: isError,
    role: SMessageRole.model
  );

  SMessageModel copyWith({
    String? id,
    bool? isUser,
    String? message,
    DateTime? timestamp,
    bool? isStreaming,
    bool? isError,
    SMessageRole? role,
    bool? isMarkdown,
  }) {
    return SMessageModel(
      id: id ?? this.id,
      isUser: isUser ?? this.isUser,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
      isStreaming: isStreaming ?? this.isStreaming,
      isError: isError ?? this.isError,
      role: role ?? this.role,
      isMarkdown: isMarkdown ?? this.isMarkdown,
    );
  }
}
