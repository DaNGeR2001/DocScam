// ignore_for_file: deprecated_member_use

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'question_bank.dart';

/// QuizScreen presents up to 5 random questions for a given category.
/// It lets the user select multiple answers but limits the selections
/// to exactly the number of correct options (`correctIndices.length`).
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
  Set<int> _pickedIndices = {};

  // For the results screen.
  final List<Map<String, dynamic>> _reviews = [];

  @override
  void initState() {
    super.initState();
    final bank = questionBank[widget.category] ?? const <Q>[];
    final list = [...bank]..shuffle(Random());
    // Take at most 5 questions instead of 10.
    _selected = list.take(min(5, list.length)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final q = _selected[_index];
    final int maxSelections = q.correctIndices.length;

    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
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
                _buildHeader(q),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildImageIfAny(q),
                        _buildPrompt(q),
                        const SizedBox(height: 12),
                        // Always show a generic prompt instead of showing
                        // the number of answers to select.
                        Text(
                          'Please select correct answer',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Build each option tile.
                        for (int i = 0; i < q.options.length; i++) ...[
                          _OptionTile(
                            label: q.options[i],
                            indexLabel: String.fromCharCode(97 + i),
                            state: _tileState(i, maxSelections),
                            onTap: () => _handleTap(i, maxSelections),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2F2F2F),
                      foregroundColor: Colors.white,
                      minimumSize: const Size.fromHeight(46),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    // Only enable the button when the user has selected the
                    // required number of answers.
                    onPressed: _pickedIndices.length == maxSelections
                        ? _nextQuestion
                        : null,
                    child: Text(
                      _index == _selected.length - 1 ? 'Finish' : 'Next',
                    ),
                  ),
                ),
                _buildFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Build the top bar with back button and question counter.
  Widget _buildHeader(Q q) {
    return Container(
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
          Text(
            'Q${_index + 1}/${_selected.length}',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          // Removed the trailing emoji person icon.
        ],
      ),
    );
  }

  // Display image if any (asset or network).
  Widget _buildImageIfAny(Q q) {
    if (q.assetImage != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          q.assetImage!,
          fit: BoxFit.cover,
        ),
      );
    } else if (q.imageUrl != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          q.imageUrl!,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  // Display the question prompt.
  Widget _buildPrompt(Q q) {
    return Text(
      q.prompt,
      style: GoogleFonts.playfairDisplay(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  // Determine the state of each tile: selected, idle or disabled.
  _TileState _tileState(int index, int maxSelections) {
    // If the index is in the picked set, mark it selected; otherwise idle.
    // We no longer disable unselected options when the limit is reached so
    // users can change their answers before moving to the next question.
    return _pickedIndices.contains(index)
        ? _TileState.selected
        : _TileState.idle;
  }

  // Handle tapping a tile.  Enforce the selection limit.
  void _handleTap(int index, int maxSelections) {
    setState(() {
      if (_pickedIndices.contains(index)) {
        // Deselect if already selected.
        _pickedIndices.remove(index);
      } else {
        if (maxSelections == 1) {
          // For single-answer questions, selecting a new option replaces the previous one.
          _pickedIndices = {index};
        } else {
          // For multiple-answer questions, if the limit has been reached, remove
          // one of the previously selected answers before adding the new one.
          if (_pickedIndices.length >= maxSelections) {
            // Remove an arbitrary previously selected answer (the first in the set).
            final int toRemove = _pickedIndices.first;
            _pickedIndices.remove(toRemove);
          }
          _pickedIndices.add(index);
        }
      }
    });
  }

  // Proceed to the next question or go to results.
  void _nextQuestion() {
    final Q q = _selected[_index];
    final Set<int> correctSet = Set<int>.from(q.correctIndices);
    final bool isCorrect = _pickedIndices.length == correctSet.length &&
        _pickedIndices.containsAll(correctSet);
    if (isCorrect) _score++;

    _reviews.add({
      'question': q.prompt,
      'options': q.options,
      'pickedIndices': _pickedIndices.toList(),
      'correctIndices': q.correctIndices,
      'explanation': q.explanation,
      'isCorrect': isCorrect,
    });

    if (_index < _selected.length - 1) {
      setState(() {
        _index++;
        _pickedIndices = {};
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

  // Footer text
  Widget _buildFooter() {
    return const Padding(
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
    );
  }
}

/// States for the option tile.
enum _TileState { idle, selected, disabled }

/// A widget representing a single answer option.
/// It changes colours based on its state.
class _OptionTile extends StatelessWidget {
  const _OptionTile({
    required this.label,
    required this.indexLabel,
    required this.state,
    required this.onTap,
  });

  final String label;
  final String indexLabel;
  final _TileState state;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bool selected = state == _TileState.selected;
    final bool disabled = state == _TileState.disabled;
    final Color bg = selected ? const Color(0xFF303F9F) : Colors.white;
    final Color fg = selected ? Colors.white : Colors.black87;
    final Color border = disabled ? Colors.black26 : fg.withOpacity(0.2);

    return Material(
      color: bg,
      elevation: 6,
      shadowColor: Colors.black.withOpacity(0.18),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: disabled ? null : onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: fg.withOpacity(selected ? 0.20 : 0.08),
                  border: Border.all(color: border, width: 1.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text(
                  '$indexLabel)',
                  style: TextStyle(
                    color: fg,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    color: fg,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
