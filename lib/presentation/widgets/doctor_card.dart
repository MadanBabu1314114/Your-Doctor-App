import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yourdoctor/models/doctor_item.dart';

class DoctorCard extends StatelessWidget {
  final DoctorItem item;
  const DoctorCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final primaryBlue = const Color(0xFF2979FF);
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            item.imageUrl,
            width: 56,
            height: 56,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          item.name,
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.specialty,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 12,
                  color: Colors.grey,
                ),
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    item.location,
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.star, size: 12, color: Colors.amber),
                const SizedBox(width: 4),
                Text(
                  '${item.rating}',
                  style: GoogleFonts.poppins(fontSize: 11),
                ),
                const SizedBox(width: 4),
                Text(
                  '(${item.reviews} Reviews)',
                  style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: IconButton(
                icon: Icon(
                  item.favorited ? Icons.favorite : Icons.favorite_border,
                  color: item.favorited ? Colors.red : Colors.grey,
                ),
                onPressed: () {},
              ),
            ),
            Expanded(
              child: Text(
                item.fee,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: primaryBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
