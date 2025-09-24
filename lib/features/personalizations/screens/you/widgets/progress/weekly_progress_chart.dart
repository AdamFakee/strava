import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/common/widgets/loading_indicators/circular/circular_loading_indicator.dart';
import 'package:strava/features/core/controllers/home/chart/chart_home_controller.dart';
import 'package:strava/features/personalizations/controllers/you/specific_date/specific_date_controller_provider.dart';
import 'package:strava/utils/extensions/date_time_extensions.dart';

class SWeeklyProgressChart extends ConsumerWidget {
  const SWeeklyProgressChart({super.key});


  @override
  Widget build(BuildContext context, ref) {
    final now = DateTime.now();
    final week = now.weekNumber(now);
    final controller = SChartHomeController();

    final provider = ref.read(SSpecificDateControllerProvider.notifier);

    return SizedBox(
      height: 250,
      child: PageView.builder(
        onPageChanged: (value) {
          provider.changeNumWeek(value);
        },
        itemBuilder: (context, index) {
          return FutureBuilder(
            future: controller.getActivitiesByGivenWeek(givenWeek: week - index), 
            builder:(context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SCircularLoadingIndicator();
              }
          
              final data = snapshot.data!;
              
              return BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 10,
                  barTouchData: BarTouchData(enabled: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false), // ẩn trục trái
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false), // ẩn trục trên
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false), // ẩn trục phải
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const style = TextStyle(color: Colors.white, fontSize: 12);
                          switch (value.toInt()) {
                            case 0:
                              return Text('Mon', style: style);
                            case 1:
                              return Text('Tue', style: style);
                            case 2:
                              return Text('Wed', style: style);
                            case 3:
                              return Text('Thu', style: style);
                            case 4:
                              return Text('Fri', style: style);
                            case 5:
                              return Text('Sat', style: style);
                            case 6:
                              return Text('Sun', style: style);
                            default:
                              return const SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false, // chỉ kẻ ngang
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey.withOpacity(0.3),
                        strokeWidth: 1,
                        // dashArray: [6, 4], // kẻ ngang bằng nét đứt
                      );
                    },
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: List.generate(data.length, (idx) {
                    final value = double.parse(data[idx].distance);

                    return BarChartGroupData(
                      x: idx,
                      barRods: [
                        BarChartRodData(
                          toY: value == 0 ? 0.1 : value,
                          color: Colors.orange,
                          width: 14,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ],
                    );
                  }),

                  // barGroups: weeklyData.asMap().entries.map((e) {
                  //   final index = e.key;
                  //   final value = e.value;
              
                  //   return BarChartGroupData(
                  //     x: index,
                  //     barRods: [
                  //       BarChartRodData(
                  //         toY: value == 0 ? 0.1 : value, // min height nếu = 0
                  //         color: Colors.orange,
                  //         width: 14,
                  //         borderRadius: BorderRadius.circular(4),
                  //       ),
                  //     ],
                  //   );
                  // }).toList(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
