// ignore_for_file: non_constant_identifier_names

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:strava/utils/exceptions/firebase_exceptions.dart';
import 'package:strava/utils/exceptions/format_exception.dart';
import 'package:strava/utils/exceptions/platform_exceptions.dart';
import 'package:strava/utils/exceptions/sqflite_database_exeption.dart';

/// wrap [action] to handle [exception] if exist
/// 
/// using when call api to firebase
Future<T> SHandleFirebaseException<T>(Future<T> Function() action) async {
  try {
    return await action();
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw TFormatException().message;
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } on DatabaseException catch (e) {
    throw SSqfliteDatabaseExeption.error(e).message;
  } catch (e) {
    throw e is String ? e.toString() : "Something went wrong. Please try again";
  }
}
