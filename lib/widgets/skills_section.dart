import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      {'name': 'Flutter', 'icon': Icons.flutter_dash},
      {'name': 'Dart', 'icon': Icons.code},
      {'name': 'Clean Architecture', 'icon': Icons.architecture},
      {'name': 'Firebase', 'icon': Icons.cloud},
      {'name': 'REST APIs', 'icon': Icons.api},
      {'name': 'UI/UX Design', 'icon': Icons.design_services},
      {'name': 'Bloc State Management', 'icon': Icons.design_services},
      // Add more skills with icons as needed
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final crossAxisCount = isMobile ? 2 : 3;

        return Container(
          padding: EdgeInsets.all(isMobile ? 30 : 50),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[50]!, Colors.purple[50]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              Text(
                'Skills',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 28 : null,
                  color: Colors.blue[800],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 15, // Reduced from 20
                  mainAxisSpacing: 15, // Reduced from 20
                  childAspectRatio: 2.6, // Reduced from 1.2 for shorter boxes
                ),
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  final skill = skills[index];
                  return _SkillChip(
                    name: skill['name'] as String,
                    icon: skill['icon'] as IconData,
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
  final IconData icon;
  final bool isMobile;

  const _SkillChip({
    required this.name,
    required this.icon,
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
            gradient: const LinearGradient(
              colors: [Colors.blueAccent, Colors.purpleAccent],
            ),
            borderRadius: BorderRadius.circular(widget.isMobile ? 15 : 20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: widget.isMobile ? 25 : 40, // Reduced from 40/50
                color: Colors.white,
              ),
              const SizedBox(height: 8), // Reduced from 10
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