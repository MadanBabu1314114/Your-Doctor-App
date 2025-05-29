import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yourdoctor/models/service_item.dart';

class ServiceCard extends StatelessWidget {
  final ServiceItem item;
  const ServiceCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(right: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(item.icon, size: 32, color: Colors.blue),
            const SizedBox(height: 8),
            Text(item.label, style: GoogleFonts.poppins(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
