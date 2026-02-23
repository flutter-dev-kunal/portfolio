import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:universal_html/html.dart' as html;

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
                icon: FaIcon(
                  Icons.email,
                  color: Colors.white,
                  size: isMobile ? 34 : 38, // Smaller on mobile
                ),
                onPressed: () => launchUrl(Uri.parse('mailto:kunaldhopavkarwork@gmail.com')),
              ),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.linkedin,
                  color: Colors.white,
                  size: isMobile ? 28 : 32,
                ),
                onPressed: () => launchUrl(Uri.parse('https://in.linkedin.com/in/kunal-dhopavkar-b520b8253')),
              ),
            ],
          ),
          const SizedBox(height: 5),
          ElevatedButton.icon(
            onPressed: () => _downloadResume(context),
            icon: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Icon(Icons.download, color: Colors.black),
            ),
            label: Text('Download Resume', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 24,
                vertical: isMobile ? 10 : 14,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _downloadResume(BuildContext context) async {
    try {
      if (kIsWeb) {
        // dart:html approach
        html.AnchorElement(href: 'assets/resume.pdf')
          ..setAttribute('download', 'kunalsResume.pdf')
          ..click();
      } else {
        // mobile - open with url_launcher
        await launchUrl(
            Uri.parse('assets/resume.pdf'),
            mode: LaunchMode.externalApplication
        );
      }
    } catch(e) {
      if(!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Unable to download the resume, Please try again later", style: GoogleFonts.poppins()))
      );
    }
  }
}
