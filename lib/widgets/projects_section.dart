import 'package:flutter/material.dart';
import '../models/project.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      Project(
        title: 'Salcete Pharma',
        description: 'A pharmacy app for ordering medicines online via search or prescription upload, with doctor locator, reminders, and secure medical report storage.',
        imageUrl: 'https://play-lh.googleusercontent.com/U2wl6UCEjNrpEsGF_nflLDxSnzIHT0mmVI0amNPm6mN3Q96IFYz7e3PN72aBgAfULjo=s96',
      ),
      Project(
        title: 'Nudge App',
        description: 'A lead management app for tracking, managing, and closing leads, with reminders, chat, and calling features.',
        imageUrl: 'https://play-lh.googleusercontent.com/5bkiUPOplb__QOg4OndLC79vEBwUtBoqOQ8m8WBUxj9NmfXbzywKYCTUM0Xv8Kn5VJo=w480-h960',
      ),
      // Add more projects as needed
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1200;

        return Container(
          padding: EdgeInsets.all(isMobile ? 30 : 50), // Less padding on mobile
          color: Colors.grey[100],
          child: Column(
            children: [
              Text(
                'My Projects',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 28 : null, // Smaller on mobile
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // Prevent nested scrolling
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: isMobile ? 350 : (isTablet ? 250 : 300), // Responsive column width
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: isMobile ? 1.35 : isTablet ? 0.65 : 0.85, // Adjust for card height
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  final project = projects[index];
                  return Card(
                    surfaceTintColor: Colors.white,
                    color: Colors.white,
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 10),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: 60,
                                width: 60,
                                child: Image.network(project.imageUrl, fit: BoxFit.cover)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  project.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: isMobile ? 16 : 18, // Smaller on mobile
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  project.description,
                                  style: TextStyle(fontSize: isMobile ? 13 : 15), // Smaller on mobile
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}