import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class SCalanderDialog {
  static void show(BuildContext context) {
    final now = DateTime.now();
    
    showDialog(
      context: context, 
      builder:(context) {
        return Dialog(
          child: TableCalendar(
            focusedDay: now, 
            firstDay: now, 
            lastDay: now,
            daysOfWeekVisible: true, // hiển thị thứ 2, 3, 4..
            headerStyle: HeaderStyle(
              formatButtonVisible: false, // ẩn button chọn tuần trong tháng
              titleCentered: true
            ),
          ),
        );
      },
    );
  }
}