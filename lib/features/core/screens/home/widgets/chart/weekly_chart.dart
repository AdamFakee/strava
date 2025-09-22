import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:strava/common/widgets/loading_indicators/circular/circular_loading_indicator.dart';
import 'package:strava/features/core/controllers/home/chart/chart_home_controller.dart';
import 'package:strava/features/core/screens/home/widgets/banner/home_bar_summaries_heading_title.dart';
import 'package:strava/l10n/app_localizations.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/sizes.dart';

class SWeeklyChart extends StatelessWidget {
  const SWeeklyChart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SChartHomeController();
    return Container(
      height: 300,
      padding: EdgeInsets.symmetric(
        horizontal: SSizes.md / 2,
        vertical: SSizes.defaultSpace
      ),
      child: Column(
        spacing: SSizes.md,
        children: [
          // heading title
          Padding(
            padding: const EdgeInsets.only(
              left: SSizes.md / 2
            ),
            child: SHomeBarSummarySectionTitle(
              title: SAppLanguages.of(context)!.weeklyDistanceChart, 
              buttonTitlte: SAppLanguages.of(context)!.seeDetail, 
              onPressed: () {}
            ),
          ),

          // chart
          Expanded(
            child: FutureBuilder(
              future: controller.getActivitiesByGivenWeek(), 
              builder:(context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SCircularLoadingIndicator();
                }
            
                final data = snapshot.data;
                
                return LineChart(
                  LineChartData(
                    borderData: FlBorderData(
                      show: true,
                      border: Border(
                        left: BorderSide(
                          color: SAppColors.black
                        )
                      )
                    ),
                    gridData: FlGridData(
                      show: false,
                    ),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                      )),
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 32,
                          interval: 1,
                          getTitlesWidget: (value, meta) {
                            switch (value.toInt()) {
                              case 0:
                                return const Text("T2");
                              case 1:
                                return const Text("T3");
                              case 2:
                                return const Text("T4");
                              case 3:
                                return const Text("T5");
                              case 4:
                                return const Text("T6");
                              case 5:
                                return const Text("T7");
                              case 6:
                                return const Text("CN");
                            }
                            return const Text("");
                          },
                        ),
                      ),
                    ),
            
                    // dữ liệu line chart
                    lineBarsData: [
                      LineChartBarData(
                        spots: List.generate(7, (idx) {
                          if(data == null || idx >= data.length || data.isEmpty) return FlSpot(idx * 1.0, 0);
                          return FlSpot(idx * 1.0, double.parse(data[idx].distance));
                        } ),
                        isCurved: true,
                        color: SAppColors.primary,
                        barWidth: 3,
                        isStrokeCapRound: true,
                        belowBarData: BarAreaData(show: true),
                        dotData: const FlDotData(show: true),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      )
    );
  }
}
