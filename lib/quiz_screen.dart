import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'question_bank.dart';

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

  // For results: simple maps to avoid cross-file types
  final List<Map<String, dynamic>> _reviews = [];

  @override
  void initState() {
    super.initState();
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
                            state: _stateFor(i, q.correctIndex),
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

  _TileState _stateFor(int i, int correctIndex) {
    if (!_locked) return _TileState.idle;
    if (i == correctIndex) return _TileState.correct; // green on correct
    if (_picked == i) return _TileState.wrong; // red on wrong picked
    return _TileState.disabled;
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

enum _TileState { idle, correct, wrong, disabled }

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
    IconData? icon;

    switch (state) {
      case _TileState.idle:
        bg = Colors.white;
        fg = Colors.black87;
        icon = null;
        break;
      case _TileState.correct:
        bg = const Color(0xFF1B5E20);
        fg = Colors.white;
        icon = Icons.check_circle;
        break;
      case _TileState.wrong:
        bg = const Color(0xFFB71C1C);
        fg = Colors.white;
        icon = Icons.cancel;
        break;
      case _TileState.disabled:
        bg = Colors.white;
        fg = Colors.black54;
        icon = null;
        break;
    }

    return Material(
      color: bg,
      elevation: 6,
      shadowColor: Colors.black.withValues(alpha: 0.18),
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
                  color: fg.withValues(
                      alpha: state == _TileState.idle ? 0.08 : 0.20),
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
              if (icon != null) Icon(icon, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
