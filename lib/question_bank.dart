import 'package:flutter/foundation.dart';

@immutable
class Q {
  final String prompt;

  /// 2 (Yes/No) or 4 options.
  final List<String> options;

  /// 0-based index into [options].
  final int correctIndex;

  /// Optional explanation to show on the result/review page.
  final String? explanation;

  /// Provide either an asset path (preferred) or a network URL.
  final String? assetImage;
  final String? imageUrl;

  const Q({
    required this.prompt,
    required this.options,
    required this.correctIndex,
    this.explanation,
    this.assetImage,
    this.imageUrl,
  });
}

/// ---------------------------------------------------------------------------
/// Add your full 50 questions per category below. These are *examples* that
/// match your requirements (mix of Yes/No + MCQ, some with images at top).
///
/// IMPORTANT: If you use assets, declare them in pubspec.yaml, e.g.:
///   flutter:
///     assets:
///       - assets/questions/
/// Then run: flutter pub get
/// ---------------------------------------------------------------------------

final Map<String, List<Q>> questionBank = {
  'Seasons': [
    // MCQ with asset image
    const Q(
      prompt: 'Which season is shown in this photo?',
      options: ['Spring', 'Summer', 'Autumn', 'Winter'],
      correctIndex: 2,
      explanation: 'Orange/brown leaves and falling foliage indicate autumn.',
      assetImage: 'assets/questions/autumn_leaves.jpg',
    ),
    // Yes/No with network image
    const Q(
      prompt:
          'This “holiday prize” DM asks for your bank login. Is it legitimate?',
      options: ['Yes', 'No'],
      correctIndex: 1,
      explanation: 'Legitimate raffles never ask for banking logins.',
      imageUrl:
          'https://raw.githubusercontent.com/fluix-dev/sample-assets/main/scam/holiday_prize.png',
    ),
    // MCQ text-only
    const Q(
      prompt:
          'Caller: “We need a Christmas re-delivery fee. Pay \$5 now.” What should you do?',
      options: [
        'Pay by card over the phone',
        'Use the official courier app/site yourself',
        'Read card number without CVC',
        'Send a photo of your ID'
      ],
      correctIndex: 1,
      explanation: 'Start from official channels you initiate.',
    ),
    // Yes/No text-only
    const Q(
      prompt: 'Is it safe to scan random QR codes on flyers to “claim gifts”?',
      options: ['Yes', 'No'],
      correctIndex: 1,
      explanation: 'Unknown QR codes can lead to phishing pages.',
    ),
  ],
  'Delivery': [
    // Yes/No with asset image (fake SMS)
    /*const Q(
      prompt:
          'SMS: You get a text message that it is an official FedEx. It reads: Your package is awaiting customs clearance. Pay AUD 2.99 now with the help of the following link to prevent delays: http://fedex-clearance.top/parcel.\n'
          'What should you do?',
      options: [
        'Pay the small fee quickly, so your delivery isn’t delayed',
        'Ignore and delete the message without clicking the link',
        'Copy the link into a browser to confirm if it is real',
        'Reply asking the sender for proof of the delivery',
      ],
      correctIndex: 1,
      explanation:
          'This is a scam. Delivery companies do not charge little random fees via text with suspicious access. The connection will send you to a phishing site to steal your payment information. The least harmful option is to disregard the message and delete it.',
      assetImage: 'assets/questions/fake_fedex_sms.png',
    ),*/
    // MCQ with network image (fake tracking page)
    /*const Q(
      prompt:
          'SMS: A text message is received: "Amazon Delivery: Your order could not be delivered because of a wrong billing address. Check your information now at amazon-parcelverify. shop. or else your order is cancelled in 12 hours." What should you do?',
      options: [
        'Enter your billing details on the link to stop your order from being cancelled',
        'Ignore and delete the message, then check your order status in your Amazon account ',
        'Reply to the text asking for your order number ',
        'Forward the link to a friend to test it safely'
      ],
      correctIndex: 2,
      explanation:
          'It is a phishing scam in the image of Amazon. Fraudulent links steal credit and bank account information. The safest way to do it is to delete the message and check only the orders with the help of the official Amazon one.',
      imageUrl:
          'https://raw.githubusercontent.com/fluix-dev/sample-assets/main/scam/fake_amazon_tracking.png',
    ),*/
    // MCQ text-only
    const Q(
      prompt:
          'Late at night, you get an SMS that sends a message to you: Amazon Logistics: Your delivery will be withheld because of inaccurate billing information. You need to verify your card information now at: http://amazon-billingfix.net to complete the order. Failing to do this within 6 hours will cancel your parcel.\n'
          'How should you respond?',
      options: [
        'Enter your card details to ensure your Amazon parcel arrives',
        'Ignore and delete the SMS, and check your Amazon account directly for updates ',
        'Copy and paste the link into a different browser to double-check',
        'Reply to the message asking for confirmation of your order number'
      ],
      correctIndex: 2,
      explanation:
          'It is a phishing attack that aims to steal credit card details by creating a sense of urgency. Amazon does not request clients to update their billing using random texts. The right action is to delete the message and confirm the orders only on the official Amazon site or application',
    ),
    const Q(
      prompt:
          'You get an SMS, which says: “DHL Delivery Attempt Failed. Your package has not been received because the handling fees ( AUD 4.99) have not been paid. To rebook delivery, one should pay with the help of the secure link: http://dhl-parcelupdate.com.. Unless something is done within 24 hours, the package will be returned. \n'
          'What is the safest action?',
      options: [
        'Pay the AUD 4.99 fee immediately to secure delivery',
        'Check the link on your computer instead of your phone ',
        'Delete the message and verify delivery status directly on DHL’s official website ',
        'Reply to the sender asking for the tracking number'
      ],
      correctIndex: 3,
      explanation:
          'It is a scam that is aimed at deceiving you with a sense of urgency and a small fee that seems innocent. The counterfeit URL results in a phishing site that robs financial information. The most secure course of action is turn a blind eye to the connection and visit the official website/app of the courier to verify the information.',
    ),
    const Q(
      prompt:
          'If you clicked a scam link accidentally, what should you shouldn’t do next?',
      options: [
        'Ignore the whole incident',
        'Act quickly and change passwords',
        'Monitor accounts (Bank, emails)',
        'Report the incident to the proper authorities.'
      ],
      correctIndex: 1,
      explanation:
          'Never ignore it if you clicked a scam link. That only gives scammers a move time. Instead, change your passwords right away, monitor your bank account, monitor your email account, and report the incident to the proper authorities.',
    ),
    const Q(
      prompt:
          'When you get an email or message regarding a delivery issue. What is not the safest step that you should follow?',
      options: [
        'Contact the official number of the delivery service.',
        'Delete and report the incident',
        'Reply, follow the instructions, or call the number',
        'Add an extra layer of security to your accounts(2FA)'
      ],
      correctIndex: 3,
      explanation:
          'If you get an email or message regarding a delivery issue, never reply, call, or follow the instructions directly. Instead, delete it, report it, or contact the delivery service through their official number and confirm if this message or email is real or fake.',
    ),
    const Q(
      prompt:
          'On the day you receive this SMS in the late evening at an unknown number, it is as follows: RoyalMail Delivery: we have tried to deliver your parcel, but it could not be delivered because of the wrong address. To prevent being redispatched again, make sure to confirm your information and pay a little redelivery charge of 2.50 at the secure site below within 8 hours:http://royalmail-redeliv.xyz. Reply ‘Y’ to activate the link.” The message does not have a tracking number, contacts are not saved in your address book, and the domain of the links does not look familiar.\n'
          'What should you do?',
      options: [
        'Reply ‘Y’ to activate the link, then open it and pay the £2.50 so your parcel isn’t returned',
        'Copy the link into your desktop browser to check the site’s certificate and then proceed if it looks safe',
        'Delete the message, block the number, and check your Royal Mail account or the official Royal Mail website/app for any delivery notices ',
        'Reply asking for the parcel’s tracking number and sender details, then follow their instructions if they provide them'
      ],
      correctIndex: 3,
      explanation:
          'It is a phishing fraud that applies urgency and a small fee to lure you into a counterfeit website, which robs you of your information. Do not open SMS links that you are not familiar with; only confirm the deliveries through the official site or application of the courier.',
    ),

    // Yes/No text-only
     const Q(
      prompt:
          'Do you want to reschedule this package?',
      options: ['Yes', 'No'],
      correctIndex: 1,
      explanation: 'Scammers send fake delivery texts asking you to pay small fees through strange links. Always check deliveries through the official courier website or app, not links in random messages.',
      assetImage:
          '../assets/Delivery/image123.png',
    ),
     const Q(
      prompt:
          'Is this a scam message?',
      options: ['Yes', 'No'],
      correctIndex: 0,
      explanation: "This is a scam because the link is not the official USPS website and asks for personal details to confirm delivery. Real postal services don't ask for your information this way.",
      assetImage:
          '../assets/Delivery/image125.png',
    ),
     const Q(
      prompt:
          'This SMS claims you have a package waiting and provides a tracking code with a shortened link. Is this safe?',
      options: ['Yes', 'No'],
      correctIndex: 1,
      explanation: 'Scammers use random tracking codes that look real but don’t match any official format. The shortened link hides the true destination, which is a classic phishing trick. Clicking could lead to a fake site designed to steal login or payment details.',
      assetImage:
          '../assets/Delivery/image137.png',
    ),
     const Q(
      prompt:
          "You get the above email mentioning that your shipment is scheduled for delivery. There is a “Sign in” button to sign in and reconfirm the delivery address. When you click that button, they are asking for your email address and password to sign in to your FedEx account. But when you enter your password, the web page says the password is incorrect."
          "Which statement is true?",
      options: ['Yes', 'No'],
      correctIndex: 0,
      explanation: 'This is a phishing scam. The web page is deliberately designed to trick you into giving away your email credentials under the disguise of a delivery confirmation.',
      assetImage:
          '../assets/Delivery/image126.png',
    ),
     const Q(
      prompt:
          'Courier calls from an unknown number asking for your card details. Is this OK?',
      options: ['A scam', 'A legitimate'],
      correctIndex: 0,
      explanation: "This is a scam because the sender's email address is fake, and it asks you to click a link to reschedule delivery. Real USPS messages only come from their official site.",
      assetImage:
          '../assets/Delivery/image128.png',
    ),
     const Q(
      prompt:
          'This SMS says your package could not be delivered and gives a link to check status. Is this safe?',
      options: ['Yes', 'No'],
      correctIndex: 1,
      explanation: 'Delivery companies never send generic links asking you to “check status.” The suspicious domain is unrelated to any real courier service. Clicking could install malware or trick you into entering personal details like your address, date of birth, or credit card number.',
      assetImage:
          '../assets/Delivery/image135.png',
    ),
  ],
  'Job Offers': [
    // MCQ text-only
    const Q(
      prompt:
          '“This is HR from SEEK. Pay a \$100 processing fee to proceed.” What do you do?',
      options: [
        'Pay to secure the job',
        'Hang up and report',
        'Ask for invoice',
        'Negotiate fee'
      ],
      correctIndex: 1,
      explanation: 'Legitimate employers don’t charge candidates.',
    ),
    // Yes/No with asset image (too good to be true)
    const Q(
      prompt:
          'Email: “Work-from-home \$2,000/day. No interview. Send passport now.” Safe?',
      options: ['Yes', 'No'],
      correctIndex: 1,
      explanation: 'Too-good-to-be-true + urgent ID request = classic scam.',
      assetImage: 'assets/questions/too_good_to_be_true.png',
    ),
    // MCQ with network image (upfront fee page)
    const Q(
      prompt:
          'This “instant hire” page asks for an upfront fee. What should you do?',
      options: [
        'Pay to skip the queue',
        'Report and close',
        'Send partial ID',
        'Join the Telegram group'
      ],
      correctIndex: 1,
      explanation: 'Upfront fees for jobs are a red flag.',
      imageUrl:
          'https://raw.githubusercontent.com/fluix-dev/sample-assets/main/scam/instant_hire.png',
    ),
    // Yes/No text-only
    const Q(
      prompt:
          'Is it OK to share your TFN/passport over email before any interview?',
      options: ['Yes', 'No'],
      correctIndex: 1,
      explanation: 'Never share sensitive ID before verified onboarding.',
    ),
  ],
};
