import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yourdoctor/models/category_item.dart';

class CategoryCard extends StatelessWidget {
  final CategoryItem item;
  const CategoryCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 1,
              child: Icon(item.icon, size: 20, color: Colors.blue),
            ),
            const SizedBox(width: 6),
            Expanded(
              flex: 2,
              child: Text(
                item.label,
                style: GoogleFonts.poppins(fontSize: 12),
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
