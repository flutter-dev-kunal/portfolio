import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../widgets/header.dart';
import '../widgets/about_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/footer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(), // No animation for header, or add one if desired
            // _AnimatedOnScrollWidget(
            //   key: const Key('about'),
            //   animationType: AnimationType.fadeIn,
            //   child: const AboutSection(),
            // ),
            _AnimatedOnScrollWidget(
              key: const Key('skills'),
              animationType: AnimationType.fadeIn,
              child: const SkillsSection(),
            ),
            _AnimatedOnScrollWidget(
              key: const Key('projects'),
              animationType: AnimationType.slideFromLeft,
              child: const ProjectsSection(),
            ),

            _AnimatedOnScrollWidget(
              key: const Key('footer'),
              animationType: AnimationType.fadeIn,
              child: const Footer(),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widget for scroll-triggered animations
enum AnimationType { fadeIn, slideFromLeft, scale }

class _AnimatedOnScrollWidget extends StatefulWidget {
  final Widget child;
  final AnimationType animationType;

  const _AnimatedOnScrollWidget({
    required Key key,
    required this.child,
    required this.animationType,
  }) : super(key: key);

  @override
  State<_AnimatedOnScrollWidget> createState() => _AnimatedOnScrollWidgetState();
}

class _AnimatedOnScrollWidgetState extends State<_AnimatedOnScrollWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    switch (widget.animationType) {
      case AnimationType.fadeIn:
        _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeIn),
        );
        break;
      case AnimationType.slideFromLeft:
        _animation = Tween<double>(begin: -0.1, end: 0.0).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOut),
        );
        break;
      case AnimationType.scale:
        _animation = Tween<double>(begin: 0.8, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
        );
        break;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction > 0.1 && !_isVisible) { // Trigger when 10% visible
      setState(() {
        _isVisible = true;
      });
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: widget.key!,
      onVisibilityChanged: _onVisibilityChanged,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          switch (widget.animationType) {
            case AnimationType.fadeIn:
              return Opacity(
                opacity: _isVisible ? _animation.value : 0.0,
                child: widget.child,
              );
            case AnimationType.slideFromLeft:
              return Transform.translate(
                offset: Offset(_isVisible ? _animation.value * MediaQuery.of(context).size.width : -MediaQuery.of(context).size.width * 0.1, 0),
                child: widget.child,
              );
            case AnimationType.scale:
              return Transform.scale(
                scale: _isVisible ? _animation.value : 0.8,
                child: widget.child,
              );
          }
        },
      ),
    );
  }
}