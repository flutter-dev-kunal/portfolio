import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      'Flutter','Dart', 'Clean Architecture',
      'Firebase','REST APIs', 'UI/UX Design','Bloc State Management',
      'Swift UI', 'Kotlin'
      // Add more skills with icons as needed
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 1200;
        final crossAxisCount = isMobile ? 2 : 3;

        return Container(
          padding: EdgeInsets.all(isMobile ? 30 : 50),
          decoration: BoxDecoration(
            color: Color(0xFF1f2937),
          ),
          child: Column(
            children: [
              Text(
                'Skills',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 28 : null,
                  color: Colors.white
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal:
                  !isMobile && !isTablet ? MediaQuery.of(context).size.width * 0.15 : 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 15, // Reduced from 20
                  mainAxisSpacing: 15, // Reduced from 20
                  childAspectRatio: 3.3, // Reduced from 1.2 for shorter boxes
                ),
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  final skill = skills[index];
                  return _SkillChip(
                    name: skill,
                    isMobile: isMobile,
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

class _SkillChip extends StatefulWidget {
  final String name;
  final bool isMobile;

  const _SkillChip({
    required this.name,
    required this.isMobile,
  });

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (isHovering) {
        setState(() {
          _scale = isHovering ? 1.02 : 1.0;
        });
      },
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 200),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF374151),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.isMobile ? 10 : 14, // Slightly smaller text
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}