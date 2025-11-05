import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:go_router/go_router.dart';
import 'package:strava/common/widgets/loading_indicators/circular/circular_loading_indicator.dart';
import 'package:strava/features/core/controllers/home/chart/chart_home_controller.dart';
import 'package:strava/features/core/screens/home/widgets/banner/home_bar_summaries_heading_title.dart';
import 'package:strava/l10n/app_localizations.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/routers/app_router_names.dart';

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
              onPressed: () {
                context.push(SAppRouterNames.youTab);
              }
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
                    lineTouchData: LineTouchData(
                    // Bật/tắt tính năng tương tác chạm
                    enabled: true,

                    touchTooltipData: LineTouchTooltipData(
                      tooltipRoundedRadius: 8,
                      getTooltipItems: (List<LineBarSpot> touchedSpots) {
                        return touchedSpots.map((LineBarSpot touchedSpot) {
                          final text = '${touchedSpot.y.toStringAsFixed(2)} km';
                          return LineTooltipItem(
                            text,
                            const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }).toList();
                      },
                    ),

                    // === TÙY CHỈNH CÁC CHỈ BÁO TRỰC QUAN KHI CHẠM ===
                    // Hàm này quyết định giao diện của các đường kẻ và chấm tròn khi chạm
                    getTouchedSpotIndicator: (LineChartBarData barData, List<int> spotIndexes) {
                      // spotIndexes chứa chỉ số của các điểm đang được chạm
                      // Chúng ta trả về một danh sách các TouchedSpotIndicatorData
                      return spotIndexes.map((int index) {
                        return TouchedSpotIndicatorData(
                          // Đường kẻ dọc từ trên xuống
                          FlLine(
                            color: SAppColors.primary,
                            strokeWidth: 2,
                            dashArray: [4, 4], // Nét đứt
                          ),

                          // Chấm tròn tại điểm được chạm trên đường kẻ
                          FlDotData(
                            show: true,
                            getDotPainter: (spot, percent, barData, index) {
                              // Tùy chỉnh hình dạng và màu sắc của chấm tròn
                              return FlDotCirclePainter(
                                radius: 8,
                                color: Colors.white,
                                strokeWidth: 3,
                                strokeColor: SAppColors.primary,
                              );
                            },
                          ),
                        );
                      }).toList();
                    },

                    // === XỬ LÝ SỰ KIỆN CHẠM (NÂNG CAO) ===
                    // Sử dụng callback này để cập nhật state, ví dụ như làm nổi bật điểm được chọn
                    touchCallback: (FlTouchEvent event, LineTouchResponse? touchResponse) {
                      // Bạn có thể dùng `setState` ở đây nếu bạn đang dùng StatefulWidget
                      // Ví dụ:
                      // if (event is FlLongPressEnd || event is FlTapUpEvent) {
                      //   // người dùng nhấc tay ra
                      // } else if (touchResponse?.lineBarSpots != null) {
                      //   // người dùng đang chạm vào một điểm
                      // }
                    },
                  ),
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
