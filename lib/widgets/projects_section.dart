import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/project.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      Project(
        title: 'LimeCar App',
        description: 'Car rental platform for Goa offering easy vehicle booking, flexible plans, and seamless ride management.',
        playStoreLink: 'https://play.google.com/store/apps/details?id=in.limecar.android_app&hl=en_IN',
        appStoreLink: 'https://apps.apple.com/in/app/limecar-self-drive-car-rental/id6470351468'
      ),
      Project(
        title: 'LimeCar Partner',
        description: 'LimeCar Partner helps rental partners manage bookings, vehicles, customer coordination, and daily fleet rental operations efficiently.',
        playStoreLink: 'https://play.google.com/store/apps/details?id=in.limecar.partner_app&hl=en_IN'
      ),
      Project(
        title: 'Salcete Pharma',
        description: 'Pharmacy app for medicine orders via search or prescription, featuring doctor search and medical storage.',
        playStoreLink: 'https://play.google.com/store/apps/details?id=com.salcete.pharmacy_android&hl=en_IN'
      ),
      Project(
        title: 'CookieRush Customer',
        description: 'CookieRush helps customers discover nearby restaurants, earn rewards, level up, make payments, and enjoy social dining.',
        playStoreLink: 'https://play.google.com/store/apps/details?id=com.cookierush.androidapp&hl=en_IN'
      ),
      Project(
        title: 'CookieRush Partner',
        description: 'CookieRush Partner helps restaurants manage menus, promotions, bills, posts, ambiance, and overall business operations efficiently',
        playStoreLink: 'https://play.google.com/store/apps/details?id=in.cookierush.partnerApp&hl=en_IN'
      ),
      Project(
        title: 'SportIt',
        description: 'SportIt empowers sports coaches with structured training programs, skill development, progress tracking, and interactive learning experiences.',
        playStoreLink: 'https://play.google.com/store/apps/details?id=academy.sportit&hl=en_IN'
      ),
      Project(
        title: 'Nudge App',
        description: 'Lead management platform featuring real-time tracking, integrated chat, and automated follow-up reminders.',
        playStoreLink: 'https://play.google.com/store/apps/details?id=in.dreamlogic.nudge&hl=en_IN'
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1200;
        final isWeb = constraints.maxWidth >= 1200;

        // Calculate card width based on screen size
        final horizontalPadding = isMobile ? 30.0 : 50.0;

        final innerPadding = !isMobile && !isTablet
            ? constraints.maxWidth * 0.15
            : 0;
        final availableWidth = constraints.maxWidth - (horizontalPadding * 2) - (innerPadding * 2);

        final cardWidth = isMobile
            ? availableWidth          // 1 card per row
            : (availableWidth / 2) - 10; // 2 cards per row (10 = half of spacing)

        return Container(
          padding: EdgeInsets.all(isMobile ? 30 : 50),
          color: Color(0xFF101827),
          child: Column(
            children: [
              Text(
                'My Projects',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: isMobile ? 28 : null,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isWeb ? constraints.maxWidth * 0.15 : 0,
                ),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,    // horizontal gap between cards
                  runSpacing: 20, // vertical gap between cards
                  children: List.generate(projects.length, (i) {
                    final project = projects[i];
                    return SizedBox(
                      width: cardWidth,
                      child: Card(
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
                                      color: Colors.white,
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
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  GestureDetector(
                                    onTap: () => _showProjectOptions(context, project),
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
                      ).animate().fadeIn(duration: Duration(seconds: 1)),
                    );
                  }),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _showProjectOptions(BuildContext context, Project project) {
    final isWeb = MediaQuery.of(context).size.width > 600;

    showDialog(
      context: context,
      barrierColor: Colors.black54,
      builder: (_) {
        return Dialog(
          backgroundColor: const Color(0xFF374151),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Container(
            width: isWeb ? 420 : double.infinity,
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Open Project',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 24),

                /// Show this view only when play store link is provided - Android
                if(project.playStoreLink != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        Navigator.pop(context);
                        _launch(project.playStoreLink!);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.android,
                              color: Colors.green,
                              size: 32,
                            ),

                            const SizedBox(width: 16),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Android App',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  Text(
                                    'Open in Play Store',
                                    style: TextStyle(
                                      color: Colors.white.withValues(alpha: 0.7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                /// Show this view only when app store link is provided - iOS
                if(project.appStoreLink != null)
                  InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      Navigator.pop(context);
                      _launch(project.appStoreLink!);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.apple,
                            color: Colors.white,
                            size: 32,
                          ),

                          const SizedBox(width: 16),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'iOS App',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                Text(
                                  'Open in App Store',
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }
}