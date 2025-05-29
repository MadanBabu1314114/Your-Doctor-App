import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:yourdoctor/models/category_item.dart';
import 'package:yourdoctor/models/doctor_item.dart';
import 'package:yourdoctor/models/service_item.dart';
import 'package:yourdoctor/presentation/widgets/category_card.dart';
import 'package:yourdoctor/presentation/widgets/doctor_card.dart';
import 'package:yourdoctor/presentation/widgets/offer_card.dart';
import 'package:yourdoctor/presentation/widgets/service_card.dart';
import '../../providers/auth_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final _services = [
    ServiceItem(
      icon: Icons.local_hospital_outlined,
      label: 'Clinic appointment',
    ),
    ServiceItem(icon: Icons.videocam_outlined, label: 'Online appointment'),
  ];

  final _categories = [
    CategoryItem(icon: Icons.favorite, label: 'Cardiology'),
    CategoryItem(icon: Icons.psychology, label: 'Neurology'),
    CategoryItem(icon: Icons.clear_all, label: 'Dermatology'),
    CategoryItem(icon: Icons.air, label: 'Pulmonology'),
    CategoryItem(icon: Icons.healing, label: 'Surgery'),
    CategoryItem(icon: Icons.water, label: 'Nephrology'),
  ];

  final _doctors = [
    DoctorItem(
      imageUrl:
          'https://media.istockphoto.com/id/1468678624/photo/nurse-hospital-employee-and-portrait-of-black-man-in-a-healthcare-wellness-and-clinic-feeling.jpg?s=612x612&w=0&k=20&c=AGQPyeEitUPVm3ud_h5_yVX4NKY9mVyXbFf50ZIEtQI=', // Dr. Samira
      name: 'Dr. Samira Ali',
      specialty: 'Dermatologist',
      location: 'Zamalek - Mohandessin',
      rating: 4.8,
      reviews: 1987,
      fee: '600 EGP',
      favorited: true,
    ),
    DoctorItem(
      imageUrl:
          'https://static.vecteezy.com/system/resources/thumbnails/026/375/249/small_2x/ai-generative-portrait-of-confident-male-doctor-in-white-coat-and-stethoscope-standing-with-arms-crossed-and-looking-at-camera-photo.jpg', // Dr. Hassan
      name: 'Dr. Hassan Mahmoud',
      specialty: 'Orthopedic Surgeon',
      location: 'New Cairo - Nasr City',
      rating: 4.7,
      reviews: 1756,
      fee: '450 EGP',
    ),
    DoctorItem(
      imageUrl:
          'https://t4.ftcdn.net/jpg/01/36/18/77/360_F_136187711_qeBMOwkPdTg1dCN8e5TR1AmduXDz60Xn.jpg', // Dr. Ahmed
      name: 'Dr. Ahmed Khan',
      specialty: 'Cardiologist',
      location: 'Giza - Dokki - Maadi',
      rating: 4.9,
      reviews: 2435,
      fee: '400 EGP',
    ),
    DoctorItem(
      imageUrl:
          'https://static.vecteezy.com/system/resources/thumbnails/049/696/510/small_2x/smiling-doctor-in-a-white-lab-coat-with-a-stethoscope-posing-confidently-indoors-free-photo.jpeg', // Dr. Omar
      name: 'Dr. Omar Khalefa',
      specialty: 'Pediatrician',
      location: '6th of October City',
      rating: 4.9,
      reviews: 2160,
      fee: '380 EGP',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final primaryBlue = const Color(0xFF2979FF);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header: avatar, greeting, notif
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                        'https://docsapp-doctor.s3.us-west-2.amazonaws.com/profile_images/35201.png', // user avatar
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, ${auth.username ?? 'Doctor'}',
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'How are you today?',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications_outlined),
                      onPressed: () {},
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                // Search bar
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search for 'Doctor'",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 24),
                // Our Services
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Our Services',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'See All',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: primaryBlue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children:
                      _services
                          .map((s) => Expanded(child: ServiceCard(item: s)))
                          .toList(),
                ),

                const SizedBox(height: 24),
                // Offers (single card, could be a horizontal list)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Offers',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'See All',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: primaryBlue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 140,
                  child: PageView(
                    padEnds: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      OfferCard(
                        title: 'Hello Doctor!',
                        subtitle:
                            'Offer 50% off for your first video call\nwith your doctor.',
                        buttonText: 'Get offer',
                        imageUrl:
                            'https://media.istockphoto.com/id/922112320/photo/person-video-conferencing-with-doctor-on-smartphone.jpg?s=612x612&w=0&k=20&c=WOzyhsCJt01Q4I40voD8C7oDzfQnsm9EBPJSTN1i5Qo=', // offer graphic
                        primaryColor: primaryBlue,
                      ),
                      OfferCard(
                        title: 'Hello Doctor!',
                        subtitle:
                            'Offer 50% off for your first video call\nwith your doctor.',
                        buttonText: 'Get offer',
                        imageUrl:
                            'https://media.istockphoto.com/id/922112320/photo/person-video-conferencing-with-doctor-on-smartphone.jpg?s=612x612&w=0&k=20&c=WOzyhsCJt01Q4I40voD8C7oDzfQnsm9EBPJSTN1i5Qo=', // offer graphic
                        primaryColor: primaryBlue,
                      ),
                      // add more offers if you like...
                    ],
                  ),
                ),

                const SizedBox(height: 24),
                // Categories
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'See All',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: primaryBlue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.8,
                  children:
                      _categories.map((c) => CategoryCard(item: c)).toList(),
                ),

                const SizedBox(height: 24),
                // Top Doctors
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Doctors',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'See All',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: primaryBlue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Column(
                  children: _doctors.map((d) => DoctorCard(item: d)).toList(),
                ),

                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        selectedItemColor: primaryBlue,
        unselectedItemColor: Colors.grey.shade600,
        type: BottomNavigationBarType.fixed,
        onTap: (i) {

          // setState(() => _currentIndex = i);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// Data models
 

  

// Widgets
 
 