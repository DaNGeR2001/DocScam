import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const double outerPadding = 14;
  static const double tileMinHeight = 88;
  static const double tileRadius = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF6B2CA4), Color(0xFFB46BF2)],
              ),
            ),
          ),

          // Blobs
          const _Blob(top: 110, left: -18, size: 90),
          const _Blob(bottom: 100, right: 36, size: 72),
          const _Blob(bottom: 20, left: 90, size: 56),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header (tappable)
                GestureDetector(
                  child: Container(
                    height: 110,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF2C0038), Color(0xFF4B0F67)],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.white24,
                          child:
                              Icon(Icons.person_outline, color: Colors.white),
                        ),
                        const SizedBox(width: 14),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi Guest!',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Ready for your Challenge?',
                              style: GoogleFonts.inter(
                                color: Colors.white.withValues(alpha: 0.85),
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // Section title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: outerPadding),
                  child: Row(
                    children: [
                      const Icon(Icons.mood_outlined,
                          color: Colors.white, size: 22),
                      const SizedBox(width: 8),
                      Text(
                        'Choose A Challenge.',
                        style: GoogleFonts.playfairDisplay(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),

                // Tiles
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: outerPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _ChallengeTile(
                        icon: Icons.card_giftcard,
                        label: 'Seasons',
                        minHeight: tileMinHeight,
                        radius: tileRadius,
                        onTap: () => _openQuiz(context, 'Seasons'),
                      ),
                      const SizedBox(height: 16),
                      _ChallengeTile(
                        icon: Icons.inventory_2_outlined,
                        label: 'Delivery',
                        minHeight: tileMinHeight,
                        radius: tileRadius,
                        onTap: () => _openQuiz(context, 'Delivery'),
                      ),
                      const SizedBox(height: 16),
                      _ChallengeTile(
                        icon: Icons.work_outline,
                        label: 'Job Offers',
                        minHeight: tileMinHeight,
                        radius: tileRadius,
                        onTap: () => _openQuiz(context, 'Job Offers'),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Footer
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Center(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---- Navigation helpers ----
  void _openQuiz(BuildContext context, String category) {
    Navigator.pushNamed(context, '/quiz', arguments: category);
  }
}

class _ChallengeTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final double minHeight;
  final double radius;

  const _ChallengeTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.minHeight = 88,
    this.radius = 18,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: minHeight),
      child: Material(
        color: Colors.white,
        elevation: 8,
        shadowColor: Colors.black.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(radius),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: Row(
              children: [
                Icon(icon, size: 28, color: Colors.black87),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    label,
                    style: GoogleFonts.inter(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.black54),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Blob extends StatelessWidget {
  final double? top, left, right, bottom;
  final double size;

  const _Blob(
      {this.top, this.left, this.right, this.bottom, required this.size});

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
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              const Color(0xFF8A2BE2).withValues(alpha: 0.95),
              const Color(0xFF4B0059).withValues(alpha: 0.6),
              const Color(0x00000000),
            ],
            stops: const [0.2, 0.65, 1],
            center: const Alignment(-0.2, -0.2),
            radius: 0.9,
          ),
        ),
      ),
    );
  }
}
