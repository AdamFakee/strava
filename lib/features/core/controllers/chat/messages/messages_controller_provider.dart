import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/core/controllers/chat/messages/messages_controller_abstract.dart';
import 'package:strava/features/core/controllers/chat/messages/messages_controller_state.dart';

// ignore: non_constant_identifier_names
final SMessagesControllerProvider = NotifierProvider<SMessagesControllerState, SMessagesControllerStateType>(SMessagesControllerState.new);

