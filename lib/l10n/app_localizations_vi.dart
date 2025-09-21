// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class SAppLanguagesVi extends SAppLanguages {
  SAppLanguagesVi([String locale = 'vi']) : super(locale);

  @override
  String get home => 'Trang chủ';

  @override
  String get map => 'Bản đồ';

  @override
  String get you => 'Cá nhân';

  @override
  String get yourWeekly => 'Tổng quan tuần của bạn';

  @override
  String get activities => 'Hoạt động';

  @override
  String get time => 'Thời gian (Giây)';

  @override
  String get distance => 'Quãng đường (Km)';

  @override
  String get seeMore => 'Xem thêm';
}
