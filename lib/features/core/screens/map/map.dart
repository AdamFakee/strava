import 'package:flutter/material.dart';
import 'package:strava/common/widgets/modal_bottom_sheets/model_bottom_sheet.dart';
import 'package:strava/features/core/screens/map/widgets/map_control_bottom_sheet.dart';

class SMapScreen extends StatefulWidget {
  const SMapScreen({super.key});

  @override
  State<SMapScreen> createState() => _SMapScreenState();
}

class _SMapScreenState extends State<SMapScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scaffoldKey.currentState != null) {
        SModelBottomSheet().show(
          state: _scaffoldKey.currentState!,
          child: const SMapControlBottomSheet(),
          initialChildSize: 0.2,
          snapSizes: [0.2, 0.4],
          shouldCloseOnMinExtent: false
        );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // gắn key để lấy ra state
      body: Stack(
        children: [
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // bạn vẫn có thể gọi thủ công nếu muốn
                  _scaffoldKey.currentState?.showBottomSheet(
                    (context) => const SMapControlBottomSheet(),
                  );
                },
                child: const Text("test"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

