import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        return Container(
          padding: EdgeInsets.all(isMobile ? 30 : 50), // Less padding on mobile
          child: isMobile
              ? Column( // Stack vertically on mobile
            children: [
              Text(
                'About Me',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 28, // Smaller on mobile
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                "Passionate Flutter developer with 2.5+ years of experience building cross-platform apps. I love creating beautiful, performant UI's and solving complex problems.",
                style: TextStyle(fontSize: 16), // Smaller font
                textAlign: TextAlign.center,
              ),
              // const SizedBox(height: 20),
              // const Icon(Icons.code, size: 80, color: Colors.blue), // Smaller icon
            ],
          )
              : Row( // Row on larger screens
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Me',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Passionate Flutter developer with 2.5+ years of experience building cross-platform apps. I love creating beautiful, performant UI's and solving complex problems.",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              // const SizedBox(width: 50),
              // const Icon(Icons.code, size: 100, color: Colors.blue),
            ],
          ),
        );
      },
    );
  }
}