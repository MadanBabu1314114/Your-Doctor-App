class DoctorItem {
  final String imageUrl, name, specialty, location, fee;
  final double rating;
  final int reviews;
  final bool favorited;
  DoctorItem({
    required this.imageUrl,
    required this.name,
    required this.specialty,
    required this.location,
    required this.rating,
    required this.reviews,
    required this.fee,
    this.favorited = false,
  });
}
