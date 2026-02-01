import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 30), // Less padding on mobile
      color: Colors.black,
      child: Column(
        children: [
          Text(
            'Get In Touch',
            style: TextStyle(
              color: Colors.white,
              fontSize: isMobile ? 20 : 24, // Smaller on mobile
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.email,
                  color: Colors.white,
                  size: isMobile ? 28 : 32, // Smaller on mobile
                ),
                onPressed: () => launchUrl(Uri.parse('mailto:your.kunaldhopavkarwork@gmail.com')),
              ),
              IconButton(
                icon: Icon(
                  Icons.link,
                  color: Colors.white,
                  size: isMobile ? 28 : 32, // Smaller on mobile
                ),
                onPressed: () => launchUrl(Uri.parse('https://in.linkedin.com/in/kunal-dhopavkar-b520b8253')),
              ),
            ],
          ),
          // const SizedBox(height: 10),
          // Text(
          //   '© 2026 Kunal. All rights reserved.',
          //   style: TextStyle(
          //     color: Colors.white70,
          //     fontSize: isMobile ? 12 : 14, // Smaller on mobile
          //   ),
          //   textAlign: TextAlign.center,
          // ),
        ],
      ),
    );
  }
}