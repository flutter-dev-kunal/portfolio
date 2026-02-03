import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;

    return Container(
      height: MediaQuery.of(context).size.height * (isMobile || isTablet ? 0.65 : 0.75), // Shorter on mobile
      decoration: const BoxDecoration(
        color: Color(0xFF101827),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 50), // Less padding on mobile
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: isMobile ? 110 : 150,
                    height: isMobile ? 110 : 150,
                    decoration: BoxDecoration(
                      color: Color(0xFF738da1),
                      shape: BoxShape.circle
                    )
                  ),
                  CircleAvatar(
                    radius: isMobile ? 50 : 70, // Smaller avatar on mobile
                    backgroundImage: const AssetImage('assets/my_pic.jpeg'), // Replace with your photo
                  )
                ],
              ),
              SizedBox(height: isMobile ? 20 : 30),
              Text(
                'Kunal Dhopavkar',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 25 : 30, // Smaller font on mobile
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: isMobile ? 15 : 25),
              Text(
                'Flutter Developer (2.5+ years)',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white70,
                  fontSize: isMobile ? 16 : 22, // Smaller font on mobile
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: isMobile ? 25 : 30),
              const Text(
                "I love creating beautiful, performant UI's and solving complex problems.",
                style: TextStyle(fontSize: 16,color: Color(0xFF838996)), // Smaller font
                textAlign: TextAlign.center,
              ),
              // SizedBox(height: isMobile ? 20 : 30),
              // ElevatedButton(
              //   onPressed: () {},
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.white,
              //     foregroundColor: Colors.blue,
              //     padding: EdgeInsets.symmetric(
              //       horizontal: isMobile ? 20 : 30,
              //       vertical: isMobile ? 12 : 15,
              //     ), // Smaller padding on mobile
              //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              //   ),
              //   child: Text(
              //     'View My Work',
              //     style: TextStyle(fontSize: isMobile ? 14 : 16), // Smaller text on mobile
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}