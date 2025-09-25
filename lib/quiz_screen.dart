import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'question_bank.dart';

/// A quiz screen that presents up to 10 random questions for the chosen
/// category.  After the user selects an option, the selection is
/// highlighted in blue and the next button becomes active, but the
/// correctness of the choice is not revealed until the result screen.
class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.category});
  final String category;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late final List<Q> _selected;
  int _index = 0;
  int _score = 0;
  int? _picked;
  bool _locked = false;

  // For results: simple maps to avoid cross‑file types
  final List<Map<String, dynamic>> _reviews = [];

  @override
  void initState() {
    super.initState();
    // Shuffle a copy of the question bank and take up to 10 questions.
    final bank = questionBank[widget.category] ?? const <Q>[];
    final toTake = min(10, bank.length);
    final list = [...bank]..shuffle(Random());
    _selected = list.take(toTake).toList();
  }

  @override
  Widget build(BuildContext context) {
    final q = _selected[_index];
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background.
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF6B2CA4), Color(0xFF2C0038)],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.fromLTRB(12, 10, 12, 16),
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
                        child: Center(
                          child: Text(
                            'Quiz',
                            style: GoogleFonts.playfairDisplay(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.white24,
                        child: Icon(Icons.emoji_people, color: Colors.white),
                      ),
                    ],
                  ),
                ),

                // Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'You get a phone call:',
                          style: GoogleFonts.playfairDisplay(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          q.prompt,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'What do you do?',
                          style: GoogleFonts.playfairDisplay(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 12),
                        for (int i = 0; i < q.options.length; i++) ...[
                          _OptionTile(
                            label: q.options[i],
                            indexLabel: String.fromCharCode(97 + i), // a,b,c,d
                            state: _stateFor(i),
                            onTap: _locked ? null : () => _onPick(i, q),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ],
                    ),
                  ),
                ),

                // Next / Finish
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2F2F2F),
                      foregroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(46),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: _locked ? _next : null,
                    child: Text(
                        _index == _selected.length - 1 ? 'Finish' : 'Next'),
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

  void _onPick(int picked, Q q) {
    setState(() {
      _picked = picked;
      _locked = true;
      final isCorrect = picked == q.correctIndex;
      if (isCorrect) _score++;
      _reviews.add({
        'question': q.prompt,
        'options': q.options,
        'pickedIndex': picked,
        'correctIndex': q.correctIndex,
        'explanation': q.explanation,
        'isCorrect': isCorrect,
      });
    });
  }

  // Determine the display state for each option.  When locked, only
  // highlight the selected option; do not reveal correctness until
  // the results screen.
  _TileState _stateFor(int i) {
    if (!_locked) return _TileState.idle;
    return i == _picked ? _TileState.selected : _TileState.disabled;
  }

  void _next() {
    if (_index < _selected.length - 1) {
      setState(() {
        _index++;
        _picked = null;
        _locked = false;
      });
    } else {
      Navigator.pushNamed(
        context,
        '/result',
        arguments: {
          'score': _score,
          'total': _selected.length,
          'category': widget.category,
          'reviews': _reviews,
        },
      );
    }
  }
}

/// Represents the state of an option tile.  `selected` indicates that the
/// user picked this option; `disabled` is used for unselected options
/// after answering; and `idle` is for all options before a choice is made.
enum _TileState { idle, selected, disabled }

/// A widget that displays a single answer option.  It adapts its
/// colours based on the tile state: idle (white), selected (blue) and
/// disabled (grey).  Icons are intentionally omitted so that the
/// correctness is not revealed on the quiz screen.
class _OptionTile extends StatelessWidget {
  const _OptionTile({
    required this.label,
    required this.indexLabel,
    required this.state,
    this.onTap,
  });

  final String label;
  final String indexLabel;
  final _TileState state;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final Color bg;
    final Color fg;
    switch (state) {
      case _TileState.idle:
        bg = Colors.white;
        fg = Colors.black87;
        break;
      case _TileState.selected:
        bg = const Color(0xFF303F9F); // blue highlight for selected
        fg = Colors.white;
        break;
      case _TileState.disabled:
        bg = Colors.white;
        fg = Colors.black54;
        break;
    }

    return Material(
      color: bg,
      elevation: 6,
      // ignore: deprecated_member_use
      shadowColor: Colors.black.withOpacity(0.18),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: fg.withOpacity(state == _TileState.idle ? 0.08 : 0.20),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text('$indexLabel)',
                    style: TextStyle(color: fg, fontWeight: FontWeight.w700)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                      color: fg, fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}