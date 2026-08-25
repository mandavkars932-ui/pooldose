import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class ORPLevelHistoryWidget extends StatelessWidget {
  const ORPLevelHistoryWidget({super.key});

  static String routeName = 'ORPLevelHistory';
  static String routePath = '/oRPLevelHistory';

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> readings = [
      {'time': '25/8 09:30 AM', 'val': 720.0},
      {'time': '25/8 09:00 AM', 'val': 718.0},
      {'time': '25/8 08:30 AM', 'val': 715.0},
      {'time': '25/8 08:00 AM', 'val': 710.0},
      {'time': '25/8 07:30 AM', 'val': 705.0},
      {'time': '25/8 07:00 AM', 'val': 698.0},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF1F4F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'ORP History',
          style: GoogleFonts.inter(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Circular Current Metric
            Center(
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF0513CC),
                    width: 8,
                  ),
                ),
                child: Center(
                  child: Text(
                    '720 mV',
                    style: GoogleFonts.inter(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0513CC),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Trend Chart Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    'ORP Trend (mV)',
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: LineChart(
                      LineChartData(
                        gridData: const FlGridData(show: true),
                        titlesData: const FlTitlesData(
                          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        ),
                        borderData: FlBorderData(show: true),
                        minY: 650,
                        maxY: 750,
                        lineBarsData: [
                          LineChartBarData(
                            spots: const [
                              FlSpot(0, 698),
                              FlSpot(1, 705),
                              FlSpot(2, 710),
                              FlSpot(3, 715),
                              FlSpot(4, 718),
                              FlSpot(5, 720),
                            ],
                            isCurved: true,
                            color: const Color(0xFF05A23F),
                            barWidth: 4,
                            belowBarData: BarAreaData(
                              show: true,
                              color: const Color(0xFF05A23F).withOpacity(0.2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // History List
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: readings.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final r = readings[index];
                return ListTile(
                  title: Text(r['time'], style: GoogleFonts.inter(fontWeight: FontWeight.w500)),
                  trailing: Text(
                    '${r['val'].toInt()} mV',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: const Color(0xFF0513CC),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
