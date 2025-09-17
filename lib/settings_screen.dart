import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
    this.totalPoints = 0,
    this.bestStreak = 0,
    this.completedQuizzes = 0,
    this.accuracy = 0.0,
    this.keepLearning = const <String>[],
  });

  final int totalPoints;
  final int bestStreak;
  final int completedQuizzes;
  final double accuracy; // 0.0 → 100.0
  final List<String> keepLearning;

  @override
  Widget build(BuildContext context) {
    final bullets = keepLearning.isNotEmpty
        ? keepLearning
        : const [
            'Avoid links in emails',
            'Verify caller identity',
            'Use official apps or websites'
          ];

    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF39003D), Color(0xFF4B0059)],
              ),
            ),
          ),

          // Decorative blobs (optional)
          const _Blob(top: 80, right: 14, size: 70),
          const _Blob(top: 220, left: -10, size: 90),
          const _Blob(bottom: 120, right: 40, size: 72),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      'Well Done!',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                      child: Text('😊', style: TextStyle(fontSize: 76))),
                  const SizedBox(height: 24),

                  // Stats
                  Wrap(
                    spacing: 14,
                    runSpacing: 14,
                    children: [
                      _StatCard(
                          icon: Icons.emoji_events_outlined,
                          label: 'Total Points',
                          value: '$totalPoints'),
                      _StatCard(
                          icon: Icons.bolt_outlined,
                          label: 'best Streak',
                          value: '$bestStreak'),
                      _StatCard(
                          icon: Icons.pie_chart_outline_outlined,
                          label: 'Completed Quizes',
                          value: '$completedQuizzes'),
                      _StatCard(
                          icon: Icons.error_outline,
                          label: 'Accuracy',
                          value: accuracy.toStringAsFixed(0),
                          suffix: '%'),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // Keep Learning
                  Material(
                    color: Colors.white,
                    elevation: 8,
                    shadowColor: Colors.black.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(16),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.track_changes, size: 18),
                              const SizedBox(width: 8),
                              Text('Keep Learning',
                                  style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          for (final tip in bullets) ...[
                            Text('• $tip',
                                style: GoogleFonts.inter(fontSize: 14)),
                            const SizedBox(height: 6),
                          ],
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 22),

                  // Home button -> go to HomeScreen (clears stack)
                  SizedBox(
                    height: 46,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2F2F2F),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/home', // 👈 named route to HomeScreen
                          (route) => false, // clear entire stack
                        );
                      },
                      child: const Text('Home'),
                    ),
                  ),

                  const SizedBox(height: 10),
                  const Center(
                    child: Opacity(
                      opacity: 0.7,
                      child: Text(
                        '@powered  by ScamSlayers',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    this.suffix,
  });

  final IconData icon;
  final String label;
  final String value;
  final String? suffix;

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width - 18 * 2 - 14) / 2;
    return SizedBox(
      width: width,
      child: Material(
        color: Colors.white,
        elevation: 8,
        shadowColor: Colors.black.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 22),
              const SizedBox(height: 8),
              Text(
                value + (suffix ?? ''),
                style: GoogleFonts.playfairDisplay(
                    fontSize: 22, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 4),
              Text(label, style: GoogleFonts.inter(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}

class _Blob extends StatelessWidget {
  const _Blob(
      {this.top, this.left, this.right, this.bottom, required this.size});
  final double? top, left, right, bottom;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [Color(0xFF8A2BE2), Color(0xFF4B0059), Color(0x00000000)],
            stops: [0.2, 0.65, 1.0],
            center: Alignment(-0.2, -0.2),
            radius: 0.9,
          ),
        ),
      ),
    );
  }
}
