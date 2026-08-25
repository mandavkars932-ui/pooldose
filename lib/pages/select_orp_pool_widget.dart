import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../theme/flutter_flow_theme.dart';

class SelectORPPoolWidget extends StatelessWidget {
  const SelectORPPoolWidget({super.key});

  static String routeName = 'SelectORPPool';
  static String routePath = '/selectPool';

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> pools = [
      {
        'id': 'pool_1',
        'name': 'Demo Water Park - Main Pool',
        'serial': 'NOVA-ORP-89211',
        'orp': 720,
        'ph': 7.2,
        'status': 'Online',
        'isHealthy': true,
      },
      {
        'id': 'pool_2',
        'name': 'Resort Lagoon Pool',
        'serial': 'NOVA-ORP-44019',
        'orp': 685,
        'ph': 7.4,
        'status': 'Online',
        'isHealthy': true,
      },
      {
        'id': 'pool_3',
        'name': 'Olympic Lap Pool',
        'serial': 'NOVA-ORP-91022',
        'orp': 740,
        'ph': 7.3,
        'status': 'Dosing Acid',
        'isHealthy': true,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF1F4F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF181A4A),
        title: Text(
          'My Pool Controllers',
          style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () => context.pushNamed('AddORPController'),
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: pools.length,
        itemBuilder: (context, index) {
          final pool = pools[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 2,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                context.pushNamed(
                  'ORPDashboard',
                  extra: pool['id'],
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            pool['name'],
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF101213),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8F5E9),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            pool['status'],
                            style: GoogleFonts.inter(
                              color: const Color(0xFF2E7D32),
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'S/N: ${pool['serial']}',
                      style: GoogleFonts.inter(color: const Color(0xFF57636C), fontSize: 13),
                    ),
                    const Divider(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text('ORP Level', style: GoogleFonts.inter(color: Colors.grey[600], fontSize: 13)),
                            const SizedBox(height: 4),
                            Text('${pool['orp']} mV', style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 18, color: const Color(0xFF0D17ED))),
                          ],
                        ),
                        Container(width: 1, height: 30, color: Colors.grey[300]),
                        Column(
                          children: [
                            Text('pH Level', style: GoogleFonts.inter(color: Colors.grey[600], fontSize: 13)),
                            const SizedBox(height: 4),
                            Text('${pool['ph']}', style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 18, color: const Color(0xFF7029CC))),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF181A4A),
        icon: const Icon(Icons.qr_code_scanner, color: Colors.white),
        label: Text('Add Controller', style: GoogleFonts.inter(color: Colors.white)),
        onPressed: () => context.pushNamed('AddORPController'),
      ),
    );
  }
}
