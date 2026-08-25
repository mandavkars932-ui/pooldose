import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'theme/flutter_flow_theme.dart';
import 'pages/login_for_o_r_p_widget.dart';
import 'pages/select_orp_pool_widget.dart';
import 'pages/add_o_r_p_controller_widget.dart';
import 'pages/o_r_p_dashboard_widget.dart';
import 'pages/o_r_p_level_history_widget.dart';
import 'pages/p_h_level_history_widget.dart';
import 'models/app_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    debugPrint("Firebase init note: ${e.toString()}");
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FFAppState()),
      ],
      child: const PoolDoseApp(),
    ),
  );
}

final GoRouter _router = GoRouter(
  initialLocation: '/loginForORP',
  routes: [
    GoRoute(
      path: '/loginForORP',
      name: 'LoginForORP',
      builder: (context, state) => const LoginForORPWidget(),
    ),
    GoRoute(
      path: '/selectPool',
      name: 'SelectORPPool',
      builder: (context, state) => const SelectORPPoolWidget(),
    ),
    GoRoute(
      path: '/addORPController',
      name: 'AddORPController',
      builder: (context, state) {
        final params = state.extra as Map<String, dynamic>?;
        return AddORPControllerWidget(
          passedControllerID: params?['passedControllerID'] ?? '',
          passedPoolName: params?['passedPoolName'] ?? '',
        );
      },
    ),
    GoRoute(
      path: '/ORPDashboard',
      name: 'ORPDashboard',
      builder: (context, state) {
        final poolRef = state.extra as String? ?? 'pools/demo_pool_1';
        return ORPDashboardWidget(poolRef: poolRef);
      },
    ),
    GoRoute(
      path: '/oRPLevelHistory',
      name: 'ORPLevelHistory',
      builder: (context, state) => const ORPLevelHistoryWidget(),
    ),
    GoRoute(
      path: '/pHLevelHistory',
      name: 'pHLevelHistory',
      builder: (context, state) => const PHLevelHistoryWidget(),
    ),
  ],
);

class PoolDoseApp extends StatelessWidget {
  const PoolDoseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'PoolDose - NOVA-M ORP Controller',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFF4B39EF),
        scaffoldBackgroundColor: const Color(0xFFF1F4F8),
        textTheme: GoogleFonts.interTextTheme(),
      ),
      routerConfig: _router,
    );
  }
}
