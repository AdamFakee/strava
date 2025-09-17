import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:strava/utils/extensions/context_extensions.dart';

class SHomeScreen extends ConsumerWidget {
  const SHomeScreen({super.key});

  Future<File> cropMiddlePart(File file, {int top = 400, int bottom = 400}) async {
    // Đọc ảnh gốc
    final bytes = await file.readAsBytes();
    final original = img.decodeImage(bytes);

    if (original == null) {
      throw Exception("Không đọc được ảnh");
    }

    // Tính toán phần giữa
    final newHeight = original.height - top - bottom;
    if (newHeight <= 0) {
      throw Exception("Ảnh quá nhỏ để cắt với top=$top và bottom=$bottom");
    }

    final cropped = img.copyCrop(
      original,
      x: 100,
      y: top,
      width: original.width,
      height: newHeight,
    );

    // Encode lại thành PNG
    final croppedBytes = Uint8List.fromList(img.encodePng(cropped));

    // Ghi ra file mới
    final newFile = File(
      "${file.parent.path}/cropped_${DateTime.now().millisecondsSinceEpoch}.png",
    );
    await newFile.writeAsBytes(croppedBytes);

    return newFile;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alterFile = File(
      '/data/user/0/com.example.strava/cache/1758094172566.png',
    );

    return Scaffold(
      body: FutureBuilder<File>(
        future: cropMiddlePart(alterFile),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Lỗi: ${snapshot.error}"));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text("Không có ảnh"));
          }

          return SizedBox(
            height: 600,
            width: context.screenWidht(),
            child: Image.file(alterFile, fit: BoxFit.cover,),
          );
        },
      ),
    );
  }
}
