import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.score,
    required this.total,
    required this.category,
    required this.reviews,
  });

  final int score;
  final int total;
  final String category;
  // Sent from QuizScreen: List<Map<String, dynamic>>
  final List<Map<String, dynamic>> reviews;

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
                colors: [Color(0xFF2C0038), Color(0xFF4B0F67)],
              ),
            ),
          ),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header with category + circular score
                Container(
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 18),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFB46BF2), Color(0xFF4B0F67)],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Expanded(
                        child: Text(
                          '$category Challenge',
                          style: GoogleFonts.playfairDisplay(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        width: 86,
                        height: 86,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withValues(alpha: 0.25),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.5),
                            width: 6,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '$score/$total',
                          style: GoogleFonts.playfairDisplay(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Breakdown list
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                    itemCount: reviews.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 14),
                    itemBuilder: (context, i) {
                      final r = reviews[i];
                      final bool isCorrect = r['isCorrect'] as bool;
                      final List options = r['options'] as List;
                      final String chosen =
                          options[r['pickedIndex'] as int] as String;
                      final String correct =
                          options[r['correctIndex'] as int] as String;
                      final String explanation = r['explanation'] as String;

                      return _AnswerCard(
                        number: i + 1,
                        isCorrect: isCorrect,
                        chosen: chosen,
                        correct: correct,
                        explanation: explanation,
                      );
                    },
                  ),
                ),

                // Bottom buttons
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                  child: Row(
                    children: [
                      // HOME — go straight to Home screen (clear stack)
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF2C0038),
                            minimumSize: const Size.fromHeight(44),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/home',
                              (route) => false,
                            );
                          },
                          child: const Text('Home'),
                        ),
                      ),
                    ],
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Center(
                    child: Opacity(
                      opacity: 0.7,
                      child: Text(
                        '@powered  by ScamSlayers',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
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
}

class _AnswerCard extends StatelessWidget {
  const _AnswerCard({
    required this.number,
    required this.isCorrect,
    required this.chosen,
    required this.correct,
    required this.explanation,
  });

  final int number;
  final bool isCorrect;
  final String chosen;
  final String correct;
  final String explanation;

  @override
  Widget build(BuildContext context) {
    final Color markColor =
        isCorrect ? const Color(0xFF1B5E20) : const Color(0xFFB71C1C);
    final IconData markIcon = isCorrect ? Icons.check_circle : Icons.cancel;

    return Material(
      color: Colors.white.withValues(alpha: 0.10),
      elevation: 0,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(markIcon, color: markColor, size: 18),
              const SizedBox(width: 8),
              Text(
                'Question ${number.toString().padLeft(2, '0')}: '
                '${isCorrect ? 'Answer Correct' : 'Incorrect Answer'}',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ]),
            const SizedBox(height: 6),
            Text('Your Answer: $chosen',
                style: GoogleFonts.inter(color: Colors.white)),
            const SizedBox(height: 6),
            Text('Correct Answer: $correct',
                style: GoogleFonts.inter(color: Colors.white)),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.menu_book, color: Colors.white, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Explanation: $explanation',
                    style: GoogleFonts.inter(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
