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
        '/main': (_) => const MainScreen(), // 👈 add this
        '/home': (_) => const HomeScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/quiz') {
          final category = settings.arguments as String;
          return MaterialPageRoute(
            builder: (_) => QuizScreen(category: category),
          );
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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF39003D),
                  Color(0xFF4B0059),
                  Color(0xFF60007A)
                ],
              ),
            ),
          ),
          const PositionedBlob(top: 24, left: -20, size: 120),
          const PositionedBlob(top: 32, right: 18, size: 70, intensity: 0.8),
          const PositionedBlob(bottom: 120, left: 26, size: 64, intensity: 0.7),
          const PositionedBlob(bottom: 48, right: 32, size: 80),
          const PositionedBlob(
              bottom: 220, right: 18, size: 56, intensity: 0.85),
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'DocScam',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 42,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: size.width * 0.55,
                      height: size.width * 0.55,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.25),
                            blurRadius: 24,
                            offset: const Offset(0, 12),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Image.asset('../assets/ecu-logo.png', fit: BoxFit.contain),
                      ),
                    ),
                    const SizedBox(height: 36),
                    Column(
                      children: [
                        Text(
                          'Level Up Your Scam sense!\nLet\'s play.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Opacity(
                          opacity: 0.55,
                          child: SizedBox(
                            height: 1,
                            width: 220,
                            child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: 140,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF3B2E),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 6,
                          shadowColor: Colors.black.withValues(alpha: 0.25),
                        ),
                        onPressed: () => Navigator.pushNamed(context, '/home'),
                        child: const Text('Play',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700)),
                      ),
                    ),
                    const SizedBox(height: 28),
                    const Opacity(
                      opacity: 0.7,
                      child: Text(
                        '@powered  by ScamSlayers',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
