import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../theme/flutter_flow_theme.dart';
import '../theme/flutter_flow_widgets.dart';

class AddORPControllerWidget extends StatefulWidget {
  const AddORPControllerWidget({
    super.key,
    this.passedControllerID,
    this.passedPoolName,
  });

  final String? passedControllerID;
  final String? passedPoolName;

  static String routeName = 'AddORPController';
  static String routePath = '/addORPController';

  @override
  State<AddORPControllerWidget> createState() => _AddORPControllerWidgetState();
}

class _AddORPControllerWidgetState extends State<AddORPControllerWidget> {
  final TextEditingController _serialController = TextEditingController();
  final TextEditingController _deviceNameController = TextEditingController();
  String _scannedCode = '';

  @override
  void initState() {
    super.initState();
    if (widget.passedControllerID != null && widget.passedControllerID!.isNotEmpty) {
      _serialController.text = widget.passedControllerID!;
    }
    if (widget.passedPoolName != null && widget.passedPoolName!.isNotEmpty) {
      _deviceNameController.text = widget.passedPoolName!;
    }
  }

  Future<void> _scanBarcode() async {
    try {
      String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#C62828',
        'Cancel',
        true,
        ScanMode.QR,
      );
      if (barcodeScanRes != '-1') {
        setState(() {
          _scannedCode = barcodeScanRes;
          _serialController.text = barcodeScanRes;
        });
      }
    } catch (e) {
      debugPrint('Barcode scanner error: $e');
    }
  }

  @override
  void dispose() {
    _serialController.dispose();
    _deviceNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F4F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Add New Controller',
          style: GoogleFonts.inter(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            InkWell(
              onTap: _scanBarcode,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFF4B39EF),
                    width: 4,
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.qr_code_scanner,
                      color: Color(0xFF4B39EF),
                      size: 54,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'TAP TO SCAN',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: const Color(0xFF57636C),
              ),
            ),
            Text(
              'Scan The Controller QR Code',
              style: GoogleFonts.inter(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _serialController,
              decoration: InputDecoration(
                hintText: 'SERIAL NUMBER',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _deviceNameController,
              decoration: InputDecoration(
                hintText: 'DEVICE NAME / POOL NAME',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 30),
            FFButtonWidget(
              text: 'Continue & Save',
              options: FFButtonOptions(
                width: 250,
                height: 48,
                color: const Color(0xFF181A4A),
                textStyle: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              onPressed: () {
                context.pushNamed('SelectORPPool');
              },
            ),
          ],
        ),
      ),
    );
  }
}
