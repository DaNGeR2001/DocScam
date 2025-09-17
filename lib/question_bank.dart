import 'package:flutter/foundation.dart';

@immutable
class Q {
  final String prompt;
  final List<String> options; // 4 options
  final int correctIndex; // 0..3
  final String explanation;

  const Q({
    required this.prompt,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}

/// Replace samples with your full 50 per category.
/// Use \$
final Map<String, List<Q>> questionBank = {
  'Seasons': [
    const Q(
      prompt:
          'SMS: “Holiday raffle winner! Claim your prize by entering your bank login.”',
      options: [
        'Enter login quickly',
        'Ask for a paper cheque',
        'Report and delete',
        'Give only last 4 digits'
      ],
      correctIndex: 2,
      explanation:
          'Legitimate raffles never ask for banking logins. Report and delete.',
    ),
    const Q(
      prompt:
          'Caller: “We need a small Christmas re-delivery fee, pay \$5 by phone now.”',
      options: [
        'Pay by card over the phone',
        'Use the official courier app/site yourself',
        'Read card number without CVC',
        'Send a photo of your ID'
      ],
      correctIndex: 1,
      explanation:
          'Always start from official channels you initiate. Don’t pay inbound callers.',
    ),
    // ...add up to 50
  ],
  'Delivery': [
    const Q(
      prompt:
          'SMS: “Your parcel is held at customs. Pay \$3.80 via short.ly/abc.”',
      options: [
        'Open link & pay',
        'Call the courier via official website number',
        'Reply STOP',
        'Send driver’s licence'
      ],
      correctIndex: 1,
      explanation:
          'Short links + fee = red flags. Use official numbers you look up.',
    ),
    const Q(
      prompt: 'Email asks you to “re-verify your shipping address” via a link.',
      options: [
        'Click the email link',
        'Open official app/site yourself and check',
        'Forward to friends',
        'Send TFN/passport'
      ],
      correctIndex: 1,
      explanation: 'Type the site/app yourself. Never click surprise links.',
    ),
    // ...add up to 50
  ],
  'Job Offers': [
    const Q(
      prompt:
          'Caller: “This is HR from SEEK. You’re shortlisted. Pay a \$100 processing fee.”',
      options: [
        'Pay to secure job',
        'Hang up and report',
        'Ask for invoice',
        'Negotiate fee'
      ],
      correctIndex: 1,
      explanation:
          'Legit employers don’t charge candidates. Hang up and report.',
    ),
    const Q(
      prompt:
          'Email: “Work-from-home \$2,000/day. No interview. Send passport now.”',
      options: [
        'Send passport only',
        'Ask to pay later',
        'Report as scam and delete',
        'Join Telegram group first'
      ],
      correctIndex: 2,
      explanation: 'Too-good-to-be-true + urgent ID request = scam.',
    ),
    // ...add up to 50
  ],
};
