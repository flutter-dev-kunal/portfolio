import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/project.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      Project(
        title: 'Salcete Pharma',
        description: 'Pharmacy app for medicine orders via search or prescription, featuring doctor search and medical storage.',
      ),
      Project(
        title: 'Nudge App',
        description: 'Lead management platform featuring real-time tracking, integrated chat, and automated follow-up reminders.',
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1200;

        return Container(
          padding: EdgeInsets.all(isMobile ? 30 : 50), // Less padding on mobile
          color: Color(0xFF101827),
          child: Column(
            children: [
              Text(
                'My Projects',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: isMobile ? 28 : null, // Smaller on mobile
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: !isMobile && !isTablet ? MediaQuery.of(context).size.width * 0.15 : 10,
                ),
                child: GridView.builder(
                  shrinkWrap: true, // Allows GridView to work inside a ScrollView
                  physics: const NeverScrollableScrollPhysics(), // Let the parent handle scrolling
                  itemCount: projects.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isMobile ? 1 : 2, // 1 for mobile, 2 for desktop/tablet
                    crossAxisSpacing: 20, // Horizontal space between cards
                    mainAxisSpacing: 20,  // Vertical space between cards
                    mainAxisExtent: isMobile ? 350 : 430,  // Fixed height for cards to prevent overflow
                  ),
                  itemBuilder: (context, i) {
                    final project = projects[i];
                    return Card(
                      surfaceTintColor: Colors.white,
                      color: const Color(0xFF1f2937),
                      elevation: 5,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: isMobile ? 180 : 250,
                              width: double.infinity,
                              child: Image.asset('assets/placeholder.png', fit: BoxFit.cover),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              spacing: 10,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  project.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: isMobile ? 16 : 18,
                                    color: Colors.white, // Ensure visibility on dark card
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  project.description,
                                  style: TextStyle(
                                    fontSize: isMobile ? 13 : 15,
                                    color: Colors.white70,
                                  ),
                                  textAlign: TextAlign.left,
                                  maxLines: 3, // Prevents text from pushing card bounds
                                  overflow: TextOverflow.ellipsis,
                                ),
                                GestureDetector(
                                  onTap: () => _onTapViewProject(i),
                                  behavior: HitTestBehavior.opaque,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "View Project",
                                        style: TextStyle(
                                          fontSize: isMobile ? 13 : 15,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF60a5fa),
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      const SizedBox(width: 10),
                                      Icon(Icons.arrow_forward, color: Color(0xFF60a5fa), size: 20)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _onTapViewProject(int i) {
    switch(i) {
      case 0: launchUrl(Uri.parse('https://play.google.com/store/apps/details?id=com.salcete.pharmacy_android&hl=en_IN'));
              break;
      case 1: launchUrl(Uri.parse('https://play.google.com/store/apps/details?id=in.dreamlogic.nudge&hl=en_IN'));
              break;
      default: break;
    }
  }
}