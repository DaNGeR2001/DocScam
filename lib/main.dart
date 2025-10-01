import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';
import 'quiz_screen.dart';
import 'result_screen.dart';

void main() => runApp(const DocScamApp());

class DocScamApp extends StatelessWidget {
  const DocScamApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: const Color(0xFF7A00A6),
      textTheme: GoogleFonts.playfairDisplayTextTheme(),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const MainScreen(),
      routes: {
        '/main': (_) => const MainScreen(),
        '/home': (_) => const HomeScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/quiz') {
          final category = settings.arguments as String;
          return MaterialPageRoute(
              builder: (_) => QuizScreen(category: category));
        }
        if (settings.name == '/result') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (_) => ResultScreen(
              score: args['score'] as int,
              total: args['total'] as int,
              category: args['category'] as String,
              reviews: args['reviews'] as List<Map<String, dynamic>>,
            ),
          );
        }
        return null;
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
                colors: [
                  Color(0xFF2A0030),
                  Color(0xFF4B0059),
                  Color(0xFF6C00A3)
                ],
              ),
            ),
          ),
          const _Vignette(),

          // Soft blobs (subtle, not interfering with alignment)
          const PositionedBlob(top: 36, left: -40, size: 230, intensity: 0.95),
          const PositionedBlob(top: 70, right: 24, size: 140, intensity: 0.85),
          const PositionedBlob(
              bottom: 132, left: 22, size: 130, intensity: 0.80),
          const PositionedBlob(
              bottom: 100, right: 22, size: 170, intensity: 0.90),

          // Content with sticky footer, overflow-safe and centered
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Center column with max width to align all items vertically
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 480),
                              child: const _HeroContent(),
                            ),
                          ),
                        ),

                        // Footer pinned at the bottom due to minHeight trick above
                        const Padding(
                          padding: EdgeInsets.only(top: 18, bottom: 10),
                          child: Center(
                            child: Opacity(
                              opacity: 0.80,
                              child: Text(
                                '@powered  by ScamSlayers',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroContent extends StatelessWidget {
  const _HeroContent();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;

    // Responsive spacings to keep balance on different phones
    final double topSpace = h * 0.06;
    final double betweenTitleLogo = h * 0.02;
    final double betweenLogoTagline = h * 0.05;
    const double betweenTaglineButton = 16;

    // Image scales with width but clamped for consistency
    final double logoDiameter = size.width.clamp(280.0, 520.0) * 0.70;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          CrossAxisAlignment.center, // ⬅ ensure center alignment
      children: [
        SizedBox(height: topSpace),

        // Title (centered)
        Text(
          'DocScam',
          textAlign: TextAlign.center,
          style: GoogleFonts.playfairDisplay(
            fontSize: 44,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            height: 1.05,
            letterSpacing: 0.2,
          ),
        ),

        SizedBox(height: betweenTitleLogo),

        // Logo perfectly centered with glow
        Align(
          alignment: Alignment.center,
          child: _LogoWithGlow(diameter: logoDiameter),
        ),

        SizedBox(height: betweenLogoTagline),

        // Tagline block (centered)
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Level Up Your Scam sense!\nLet\'s play.',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 12),
            // Symmetric divider (centered)
            const SizedBox(
              width: 260,
              height: 2,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white54, Colors.white, Colors.white54],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: betweenTaglineButton),

        // CTA button (gradient + glow), centered
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 200,
            height: 56,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFF4A38).withValues(alpha: 0.46),
                    blurRadius: 26,
                    spreadRadius: 1,
                    offset: const Offset(0, 6),
                  ),
                ],
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFFF5A46), Color(0xFFFF3B2E)],
                ),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () => Navigator.pushNamed(context, '/home'),
                child: const Text(
                  'Play',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.3,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LogoWithGlow extends StatelessWidget {
  const _LogoWithGlow({required this.diameter});
  final double diameter;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Outer halo
        Container(
          width: diameter * 1.08,
          height: diameter * 1.08,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF9B5CFF).withValues(alpha: 0.35),
                blurRadius: 90,
                spreadRadius: 10,
              ),
              BoxShadow(
                color: const Color(0xFF6C00A3).withValues(alpha: 0.55),
                blurRadius: 46,
                spreadRadius: -8,
              ),
            ],
            gradient: const RadialGradient(
              colors: [Color(0xFF6E00D4), Color(0xFF4B007D)],
              stops: [0.25, 1.0],
            ),
          ),
        ),
        // White disc (slight glass)
        Container(
          width: diameter,
          height: diameter,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withValues(alpha: 0.95),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.22),
                blurRadius: 24,
                offset: const Offset(0, 12),
              ),
            ],
          ),
        ),
        // The logo image (centered)
        Padding(
          padding: EdgeInsets.all(diameter * 0.1),
          child: Image.asset(
            'assets/log.png', 
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}

class _Vignette extends StatelessWidget {
  const _Vignette();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.transparent, Colors.black.withValues(alpha: 0.28)],
            stops: const [0.72, 1.0],
            center: const Alignment(0, -0.10),
            radius: 1.0,
          ),
        ),
      ),
    );
  }
}

class PositionedBlob extends StatelessWidget {
  final double? top, left, right, bottom;
  final double size;
  final double intensity;

  const PositionedBlob({
    super.key,
    this.top,
    this.left,
    this.right,
    this.bottom,
    required this.size,
    this.intensity = 1.0,
  });

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
              const Color(0xFF8A2BE2).withValues(alpha: 0.95 * intensity),
              const Color(0xFF4B0059).withValues(alpha: 0.60 * intensity),
              const Color(0x00000000),
            ],
            stops: const [0.2, 0.65, 1.0],
            center: const Alignment(-0.2, -0.2),
            radius: 0.9,
          ),
        ),
      ),
    );
  }
}
