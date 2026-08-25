import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../theme/flutter_flow_theme.dart';
import '../theme/flutter_flow_widgets.dart';

class LoginForORPWidget extends StatefulWidget {
  const LoginForORPWidget({super.key});

  static String routeName = 'LoginForORP';
  static String routePath = '/loginForORP';

  @override
  State<LoginForORPWidget> createState() => _LoginForORPWidgetState();
}

class _LoginForORPWidgetState extends State<LoginForORPWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisibility = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 280,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF4B39EF),
                    Color(0xFFFF5963),
                    Color(0xFFEE8B60)
                  ],
                  stops: [0, 0.5, 1],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.white],
                    stops: [0, 1],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WELCOME',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF0D17ED),
                        letterSpacing: 1.5,
                      ),
                    ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.3, end: 0),
                    const SizedBox(height: 8),
                    Text(
                      'NOVA-M ORP Pro Controller',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF0D17ED),
                      ),
                    ).animate().fadeIn(duration: 400.ms, delay: 100.ms).slideY(begin: 0.3, end: 0),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'admin@waterpark.com',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_passwordVisibility,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisibility
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisibility = !_passwordVisibility;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  FFButtonWidget(
                    text: 'Sign In',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 52,
                      color: const Color(0xFF4B39EF),
                      textStyle: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    onPressed: () {
                      context.pushNamed('SelectORPPool');
                    },
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Password reset link sent!')),
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.inter(color: const Color(0xFF57636C)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
