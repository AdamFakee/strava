import 'package:flutter/material.dart';
import 'package:strava/common/widgets/modal_bottom_sheets/model_bottom_sheet.dart';
import 'package:strava/features/core/screens/map/widgets/activity_stats.dart';
import 'package:strava/features/core/screens/map/widgets/google_map.dart';
import 'package:strava/features/core/screens/map/widgets/map_control_bottom_sheet.dart';
import 'package:strava/utils/extensions/context_extensions.dart';

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
          shouldCloseOnMinExtent: false,
        );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          SGoogleMap(),
          Positioned(
            left: 0,
            right: 0,
            bottom: context.screenHeight() * 0.21,
            child: SActivityStats()
          )
        ],
      ),
    );
  }
}



