import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class PHLevelHistoryWidget extends StatelessWidget {
  const PHLevelHistoryWidget({super.key});

  static String routeName = 'pHLevelHistory';
  static String routePath = '/pHLevelHistory';

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> readings = [
      {'time': '25/8 09:30 AM', 'val': 7.20},
      {'time': '25/8 09:00 AM', 'val': 7.22},
      {'time': '25/8 08:30 AM', 'val': 7.25},
      {'time': '25/8 08:00 AM', 'val': 7.30},
      {'time': '25/8 07:30 AM', 'val': 7.32},
      {'time': '25/8 07:00 AM', 'val': 7.35},
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
          'pH History',
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
            // Circular Current pH Metric
            Center(
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF0D06CA),
                    width: 8,
                  ),
                ),
                child: Center(
                  child: Text(
                    '7.20',
                    style: GoogleFonts.inter(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0D06CA),
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
                    'pH Trend',
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
                        minY: 6.8,
                        maxY: 7.8,
                        lineBarsData: [
                          LineChartBarData(
                            spots: const [
                              FlSpot(0, 7.35),
                              FlSpot(1, 7.32),
                              FlSpot(2, 7.30),
                              FlSpot(3, 7.25),
                              FlSpot(4, 7.22),
                              FlSpot(5, 7.20),
                            ],
                            isCurved: true,
                            color: const Color(0xFF7029CC),
                            barWidth: 4,
                            belowBarData: BarAreaData(
                              show: true,
                              color: const Color(0xFF7029CC).withOpacity(0.2),
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
                    r['val'].toStringAsFixed(2),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: const Color(0xFF7029CC),
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
