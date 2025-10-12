import 'package:flutter/foundation.dart';

@immutable
class Q {
  final String prompt;

  /// All possible answer options.
  final List<String> options;

  /// 0-based indices into [options].
  final List<int> correctIndices;

  /// Optional explanation to show on the result/review page.
  final String? explanation;

  /// Provide either an asset path (preferred) or a network URL.
  final String? assetImage;
  final String? imageUrl;

  const Q({
    required this.prompt,
    required this.options,
    required this.correctIndices,
    this.explanation,
    this.assetImage,
    this.imageUrl,
  });
}

/// ---------------------------------------------------------------------------
/// questionBank
/// ---------------------------------------------------------------------------

final Map<String, List<Q>> questionBank = {
  'Seasons': [
    /// Questions about seasonal scams.
    const Q(
      prompt:
          'Email: - “You are due money of \$750, click here and add bank details.”?',
      options: [
        'Click the link and enter info.',
        'Delete and report as phishing.',
        'Reply with questions.',
      ],
      correctIndices: [1],
      explanation:
          'Banking information is never requested by email by the tax office.',
    ),

    const Q(
      prompt:
          '“To receive a refund, they say you must pay 50 processing fees”.',
      options: [
        'Pay as soon as to get a refund earlier.',
        'Refunds in person- no fee is charged for a genuine refund.',
        'Negotiate smaller fee.'
      ],
      correctIndices: [1],
      explanation:
          'Refund no charge, there is no honest agency that charges fees.',
    ),

    const Q(
      prompt:
          '“Final notice: - Your refund will be canceled. Update via this link.”',
      options: [
        'Clink link.',
        'Check and delete official portal personally.',
        'Reply “STOP” to unsubscribe.'
      ],
      correctIndices: [1],
      explanation:
          'Red flags are urgent and threats. Never leave the official portal unchecked.',
    ),

    const Q(
      prompt:
          'You have an internet site that seems like the tax office, but the URL is “ato-refunds.net”. Do you think that works?',
      options: [
        'Log in to check your refunds.',
        'The official gov.au tax site only.',
        'Add the link to the list of bookmarks.'
      ],
      correctIndices: [1],
      explanation: 'Fake sites. Check gov.au or gov domains (always). ',
    ),

    const Q(
        prompt:
            'You are presented with the text displayed (receiving an ATO tax refund featuring link). What would be your actions?',
        options: [
          'Forward this message to your friends to warn them.',
          'Reply “STOP” to avoid these messages.',
          'Enter TFN and bank details to check if this is real.',
          'Report/ block the sender.'
        ],
        correctIndices: [3],
        explanation:
            'The government departments will not demand that you seek refunds through text links. Do not interfere with the message, only check with the official channels and report/ block \n'
            'to minimize the damage',
        assetImage: './assets/Seasons/image29.png'),

    const Q(
        prompt:
            'You get an email that seems to be official, but it does not have your name, but it has a label, which is Dear customer. ',
        options: [
          'Be warnings – generic greetings are a red flag.',
          'You can trust it as its professional looking.',
          'Respond with the reason as to why they did not use your name.'
        ],
        correctIndices: [0],
        explanation:
            'When you are communicating with the tax office, it is always necessary to use your full legal name. The sign of a scam is generic greetings.',
        assetImage: './assets/Seasons/image30.png'),

    const Q(
      prompt:
          'You get a phone call in which the officer in charge of tax is threatening to arrest you on the spot unless \n'
          'you pay pending taxes on the phone. Is this a scam? ',
      options: ['Yes', 'No'],
      correctIndices: [0],
      explanation:
          'No government tax office will accept a payment via phone or arrest anyone.',
    ),

    const Q(
        prompt:
            'This SMS says HMRC owes you a tax rebate and includes a link. Is this real? ',
        options: ['Yes', 'No'],
        correctIndices: [0],
        explanation:
            'HMRC never sends rebate notices by SMS links. Fake links steal your details. ',
        assetImage: "./assets/Seasons/image32.png"),

    const Q(
        prompt: 'What is the safest action here?',
        options: [
          'Call back immediately to settle your debt.',
          'Save the number and wait for more calls.',
          'Ignore and report the voicemail as a scam.',
          'Text back asking for proof.'
        ],
        correctIndices: [3],
        explanation:
            'The safest option is to ignore and report. Tax authorities communicate via official \n '
            'letters or portals, not random voicemails pressuring immediate action.',
        assetImage: "./assets/Seasons/image33.png"),

    const Q(
        prompt: 'How can you tell this is a scam?',
        options: [
          'It uses a shortened bit.ly link.',
          'It provides an exact official domain.',
          'It asks you to log in via a secure government app.',
          'It offers a support hotline.'
        ],
        correctIndices: [0],
        explanation:
            'The shortened link (bit.ly) is the red flag. Government agencies only use official.gov.au or similar domains, \n'
            'never third-party shorteners.',
        assetImage: "./assets/Seasons/image34.png"),

    const Q(
        prompt: 'What’s the red flag in this email?',
        options: [
          'IRequest to open an attached refund form.',
          'Information about processing refunds.',
          'Use of “ATO” in the subject line.',
          'Mention of a 28-day processing period'
        ],
        correctIndices: [0],
        explanation:
            'Attachments requesting financial info are a major warning sign. Scammers hide malware or phishing pages in attachments.\n'
            'ATO would direct you to log in to their secure portal.',
        assetImage: "./assets/Seasons/image35.png"),

    const Q(
        prompt: 'Which clue shows this SMS is a scam?',
        options: [
          'The message offers a bonus.'
              'Linked to natural disasters.',
          'The URL contains “verification-digital.com,” not the real myGov site.',
          'It mentions tax return details.'
        ],
        correctIndices: [1],
        explanation:
            'The domain is fake. Real myGov websites only use my.gov.au. Scammers add extra words like “verification-digital” to trick users',
        assetImage: "./assets/Seasons/image36.png"),

    const Q(
        prompt: 'What is the biggest red flag here?',
        options: [
          'The email urges immediate taxpayer verification'
              'The sender domain is unrelated to IRAS.',
          'It includes the IRAS logo.',
          'It mentions the refund process'
        ],
        correctIndices: [1],
        explanation:
            'The domain (charterschools.ae) has nothing to do with the Singapore tax authority. Official emails come from.gov.sg. \n'
            'Logos can be copied, but sender domains reveal the truth.',
        assetImage: "./assets/Seasons/image37.png"),

    const Q(
        prompt: 'What makes this email suspicious?',
        options: [
          'It mentions registering for a refund program.'
              'It offers an unrealistic 19% refund from past taxes.',
          'It includes a receipt reminder.',
          'It uses the term “Cut Off Taxes Program.”'
        ],
        correctIndices: [1],
        explanation:
            'Unrealistic refunds (19% back from old taxes) are a huge red flag. \n'
            'The ATO does not run special refund programs announced by email',
        assetImage: "./assets/Seasons/image38.png"),

    const Q(
      prompt: 'You receive a text message claiming to be from the Tax Office:\n'
          '“Your tax refund is ready. Click here to claim: http://refund-portal-tax.com/refund.”Is this SMS genuine? ',
      options: ['Yes', 'No'],
      correctIndices: [1],
      explanation:
          'Official tax authorities never send refund links by SMS. Scammers use fake websites (like refund-portal-tax.com) \n'
          'to steal personal and bank details. Always access services via the official government website.',
    ),

    const Q(
      prompt:
          'An email arrives with the subject line: ‘Immediate Action Required: Tax Account Suspension’. It says your tax account will be suspended \n'
          'within 24 hours unless you confirm your details through the provided link. \n'
          'What should you do with this email?',
      options: [
        'Click the link immediately to secure your account.',
        'Delete the email and report it as a phishing attempt.',
        'Reply with your tax file number for verification.',
        'Forward the email to friends to warn them.'
      ],
      correctIndices: [1],
      explanation:
          'The correct response is to delete and report it. Legitimate tax agencies do not threaten immediate suspension \n'
          'or demand urgent action by email. Threatening language + suspicious links = phishing scam',
    ),

    const Q(
        prompt: 'What signs show this is a scam?',
        options: [
          'Fake sender domain '
              'Urgent deadline ',
          'No personalization (“Dear Customer”) ',
          'Secure florist payment page'
        ],
        correctIndices: [0, 1, 2],
        explanation:
            'Scammers use urgency, generic greetings, and fake domains',
        assetImage: "./assets/Seasons/image39.png"),

    const Q(
        prompt: 'Is this offer legitimate?',
        options: [
          'Yes'
              'No',
        ],
        correctIndices: [0],
        explanation:
            'The domain is the official Qantas site (qantas.com), and the discount is realistic (15%), not exaggerated.',
        assetImage: "./assets/Seasons/image40.png"),

    const Q(
        prompt: 'What’s the biggest warning sign here?',
        options: [
          'Late delivery'
              'Asking for a credit card ',
          'Message on WhatsApp',
          'Flowers are seasonal'
        ],
        correctIndices: [1],
        explanation:
            'Legit florists don’t ask for card info over WhatsApp.Payment details should only be shared through official checkout pages',
        assetImage: "./assets/Seasons/image41.png"),

    const Q(
      prompt: 'Is this request safe?  Dating app chat : \n '
          '“I’d love to meet you. Can you send me \$100 for a Valentine’s train ticket?”',
      options: [
        'Yes'
            'No'
      ],
      correctIndices: [1],
      explanation: 'Romance scammers often ask for travel money.',
    ),

    const Q(
        prompt: 'What are the scam signs? ',
        options: [
          'Unrealistic discount',
          'Pressure to pay quickly',
          'Generic sender domain',
          'Linked to the official jeweler'
        ],
        correctIndices: [0, 1, 2],
        explanation: 'Unrealistic sales with urgency are scams',
        assetImage: "./assets/Seasons/image42.png"),

    const Q(
      prompt:
          'Someone sends you a message that he or she is hugely attracted to you after seeing one photo on a dating application. They soon claim \n'
          'to have powerful emotions and request to discuss on WhatsApp. They call a few days later \n'
          'and tell you that they are stuck in a foreign country and require you to send them \$400 to cover an emergency hotel bill.',
      options: [
        'Send the \$400 because it’s an emergency.',
        'Suggest a short video call first and refuse to send money.',
        'Give them your address so they can send proof.',
        'Block them immediately without checking.'
      ],
      correctIndices: [1],
      explanation:
          'Romance scams often ask for money after a fast emotional bonding. Ask for live video proof; never send money.',
    ),

    const Q(
      prompt:
          'You receive a text message: “Valentine Gift: Your flowers are subject to confirmation. Shipment in the USA costs \$5: http://val-fleurs.delivery.\n'
          'The sender states that he/she has attempted delivery but requires you to pay before delivering the bouquet.',
      options: [
        'Click the link and pay \$5 to get the flowers.',
        'Reply asking who sent the flowers.',
        'Ignore and delete the message; check with the official florist directly.',
        'Share the link with friends to ask if it’s legit.'
      ],
      correctIndices: [2],
      explanation:
          'Fake offers of small shipping charges are archetypal; check them out through the official site of the florist, and do not click.',
    ),

    const Q(
      prompt:
          'One of the social posts requests you to donate to a crisis fund on Valentine\'s Day to help aid the couples \n'
          'who have suffered in recent disasters. The donation button appears to be informal, \n'
          'and the page requests the complete card details, together with the driver\'s license number.',
      options: [
        'Donate immediately because it’s for a worthy cause.',
        'Share the fundraiser on social media.',
        'Verify the charity through an official charity regulator and donate only via trusted platforms.',
        'Send money using a friend-to-friend app without checking.'
      ],
      correctIndices: [2],
      explanation:
          'During holidays, scammers create phony causes for pets. Check donations through official giving registries.',
    ),

    const Q(
      prompt:
          'Someone writes to say that he or she has some compromising Valentine\'s photos that you have sent and that unless he or she is paid, \n'
          'he or she will publish them. They provide a deadline that is brief and a crypto wallet address.',
      options: [
        'Pay immediately to stop them.',
        'Negotiate the fee down.',
        'Do not pay, preserve evidence, block, and report to police and platform.',
        'Reply asking what photos they have'
      ],
      correctIndices: [2],
      explanation:
          'Money is hardly enough to keep the scammers at bay. Secure evidence and report; seek professional assistance',
    ),

    const Q(
      prompt:
          'You come across a small Valentine’s concert on the Internet with VIP seats and a low price. \n'
          'The site displays a counter and requests that you make a payment to the bank to gain access to tickets.',
      options: [
        'Pay by bank transfer, it’s cheaper than card fees.',
        'Use a secure platform (card/PayPal) and verify the event on the venue’s official site.',
        'Message the seller your ID to speed things up.',
        'Buy multiple tickets and resell to friends.'
      ],
      correctIndices: [1],
      explanation:
          'Bank operations are finalized; validate eventualities through official means and apply buyer protection payments.',
    ),

    const Q(
      prompt:
          'On the eve of the 2 nd day of February (a day before valentine day), you receive a text message which states: \n'
          '“You have a delivery of Valentine\'s! Test your address to get your gift. Failing to respond would result in the cancellation of the order.” \n'
          'The message requests that you send me your complete home address directly. It does not include any link, and this makes it appear safer. What is the safest response?',
      options: [
        'Reply with your home address so the delivery can arrive on time.',
        'Ignore the message completely.',
        'Contact the delivery company directly using their official website.',
        'Forward the message to a family member to check if they ordered the gift'
      ],
      correctIndices: [2],
      explanation:
          'It is a social hacking fraud. The use of fake texts of delivery robs individuals of their personal information, whereas genuine businesses update the status only on their official websites.',
    ),
    const Q(
        prompt: ' Is this a real Valentine’s greeting or a scam?',
        options: ['Real', 'Scam'],
        correctIndices: [1],
        explanation:
            'Everyone likes the idea of having a secret admire and scammers use that to trick you. If you can’t confirm the sender delete this. Never reply or click the links.',
        assetImage: './assets/Seasons/image44.png'),
    const Q(
        prompt:
            ' Your Instagram obsessed girlfriend happily shows you this Instagram message. You identify this as a scam and tell her to delete it. Out of the reasons below,which one is NOT something you would mention as proof it’s a scam?',
        options: [
          'The link looks fake and could steal your Instagram login.',
          'Instagram doesn’t usually send feature invites by random DMs.',
          'The message came late at night.',
          'The web address is not the official Instagram domain.'
        ],
        correctIndices: [2],
        explanation:
            'The real red flags are fake links random DMs and unofficial domains. Timing (getting messages at night) doesn’t prove anything because scammers can send messages at anything. ',
        assetImage: './assets/Seasons/image45.png'),
    const Q(
        prompt: ' You get this call on Valentine’s Day. What makes its scam?',
        options: [
          'Real phone providers don’t ask for SIM details over the phone.',
          'The offer of “Valentine’s bonus data” sounds unusual and fake.',
          'They create pressure by saying, ‘you must confirm right now’.',
          'The caller used polite greeting at the start.'
        ],
        correctIndices: [0, 1, 2],
        explanation:
            'Real providers don’t ask for SIM details. Being polite is very normal for scammers. Hang up and call the official customer service number instead.',
        assetImage: './assets/Seasons/image46.png'),
    const Q(
        prompt:
            ' On December 26, you get a text saying that you must pay a FasTrak Lane toll fee at once or risk late charges and legal action. The message has a link:  \n'
            'https://thetollroads.com-fu2s.cfd/us, requests you to respond with the Y that will trigger the message, and even goes ahead to wish you a happy holiday.What should you do?',
        options: [
          'Reply “Y” and follow the link to pay the fee quickly so you don’t face legal action.',
          'Report the message as spam or phishing and delete it.',
          'Open the link in a different browser just to check if it looks official.',
          'Forward the text to a family member to ask if they also received it'
        ],
        correctIndices: [2],
        explanation:
            'This is a phishing scam. The fraudulent payment option and lawsuits are used to intimidate you into making the payment. Toll agencies do not send out holiday texts on links such as these. The precautionary measure is to report and delete.',
        assetImage: './assets/Seasons/image47.png'),
    const Q(
      prompt:
          'You get a Facebook advert, it reads: “WINTER HOLIDAY SPECIAL 5 nights in Paris only 50 dollars including flights and hotel. Limited offer, book now!” The site requests you to provide your passport and card number.What should you do?',
      options: [
        'Report the ad to Facebook and avoid entering any details.',
        'Book quickly before the deal expires.',
        'Share the link with friends to see if they think it’s real.',
        'Ask the site if you can pay later after confirming the trip'
      ],
      correctIndices: [0],
      explanation:
          'Fraudsters insist on direct payments, enabling victims to lose their money. Always pay using secure booking sites.',
    ),
    const Q(
      prompt:
          'You get an email that states: Congratulations! You have won a free cruise in the Caribbean. In order to claim your tickets, send your home address and a processing fee of \$20.What should you do?',
      options: [
        'Pay the \$20 since the prize is valuable.',
        'Reply asking for proof of the prize.',
        'Delete the email immediately.',
        'Report the email as a scam using your email provider’s “Report phishing” option'
      ],
      correctIndices: [3],
      explanation:
          'Authoritative rewards do not require charges. Reporting scamming prevents other people.',
    ),
    const Q(
      prompt:
          'You get a WhatsApp message that is like: Exclusive Holiday Raffle. You are randomly selected to win a trip to Dubai with all expenses paid! \n'
          'To verify your prize, you are required to respond using your full name, date of birth, and a \$25 insurance fee using the link below. \n'
          'The responses to the winners have a time limit of 12 hours, after which the prize will be lost.What should you do?',
      options: [
        'Reply with your details and pay the fee to secure the prize.',
        'Delete the message without replying.',
        'Report the message directly on WhatsApp as spam.',
        'Forward the message to a friend to check if it’s real'
      ],
      correctIndices: [2],
      explanation:
          'True raffles do not require payment or personal information. Spam reporting prevents the scammer from attacking others.',
    ),
    const Q(
      prompt:
          'You are searching on the internet for last-minute New Year\'s Eve holiday packages. A website sells 5 5-star hotels in New York and flights for a total of 150 dollars.\n'
          'The site is professional and includes countdown timers and states that there are only 2 packages left. On the booking page, full card payment in advance is done via direct bank transfer.What should you do?',
      options: [
        'Transfer the money quickly before the offer sells out.',
        'Use only trusted travel platforms and official airline/hotel websites to book.',
        'Email the site for confirmation before paying.',
        'Save the deal and share it on social media to see if others booked it'
      ],
      correctIndices: [2],
      explanation:
          'The urgency and enormous discounts are the tricks played by the fake holiday websites to lure customers. Booking platforms should always be verified.',
    ),
    const Q(
      prompt:
          'One of the emails is purported to be that of the Holiday Rewards Program. It claims that you got a \$500 travel voucher and that you have to visit a link in order to redeem it. The email appears to be well-dressed using logos, but the sender is on hotmail.com.'
          'What should you do?',
      options: [
        'Click the link and enter your details to claim the voucher.',
        'Forward the email to your IT department or email provider’s phishing report system.',
        'Save the email in case you want to use the voucher later.',
        'Reply asking for proof of your reward before clicking anything'
      ],
      correctIndices: [1],
      explanation:
          'A true business will not use a free email address to send vouchers. Coming out and reporting it prevents further phishing.',
    ),
    const Q(
      prompt:
          'Now it is near the end of December, and you get an email, and the subject line is: Final Chance: Get Your Holiday Travel Voucher Before It’s Too Late. The email states that you have won a 1000 holiday voucher to travel and book in any hotel in the world. \n'
          'The message is professional, has logos of the airlines, and even a fake customer care number at the bottom. To redeem, one should use a link and enter their passport information and pay a fee of a little 10 dollars. \n'
          'The message in the email is a threat: this promotion is limited to 24 hours, or you will lose your voucher. What should you do?',
      options: [
        'Pay the \$10 and enter your passport details to make sure you don’t lose the voucher.',
        'Report the email to your email provider as phishing and then delete it.',
        'Call the customer service number in the email to confirm if it’s genuine.',
        'Forward the email to your friends so they can try to claim the voucher too'
      ],
      correctIndices: [1],
      explanation:
          'This is a phishing scam. Fraudsters get money and personal information by means of fake vouchers, small fees, and deadlines. Reporting and deleting is the least dangerous approach.',
    ),
    const Q(
        prompt:
            ' You get a text message which reads: Hello! We offer a Black Friday Sunday special in which we give you the largest price ever on your home in CASH. You WILL NOT regret looking.” There is a suspicious link in the message: biggestpricenow.net/9xHMNBt1. What should you do?',
        options: [
          'Click the link to see the deal before it expires.',
          'Report the message as spam and delete it.',
          'Forward the text to friends to ask if they got the same deal.',
          'Copy the link into another browser to check if the site looks legitimate'
        ],
        correctIndices: [1],
        explanation:
            'This is a phishing scam. The special offer and the suspicious link are offered as an urgency to initiate a click on it. The best course of action is to report and delete the message.',
        assetImage: './assets/Seasons/image48.png'),
    const Q(
      prompt: ' On black Friday weekend, you get a text that says: \n'
          '“Exclusive Sunday Special! Sell the best cash price on your house. Exclusive holiday package — hurry before it\'s too late! Address: biggestpricenow.net/9xHMNBt1.” \n'
          'The message asks you to do it fast and assures you will not regret it. What should you do?',
      options: [
        'Ignore the too-good-to-be-true offer and block the sender.',
        'Click the link to see the details before deciding.',
        'Share the message with friends in case they’re interested.',
        'Reply asking for more information about the offer'
      ],
      correctIndices: [0],
      explanation:
          'This is a holiday scam. Fraudsters take advantage of counterfeit Black Friday offers and panicky wording to attract victims. Clicking, sharing, or replying will only add to the risk you take. The best thing to do is to block the sender.',
    ),
    const Q(
        prompt:
            ' Your friend commented on an unpleasant incident that happened while travelling. And your friend got this reply from the Airline. What is your next move?',
        options: [
          'Tell your friend to send the WhatsApp number.',
          'Tell your friend to block, delete, and report this message to the official Airline.',
          'Tell your friend to reply to this response.',
          'Tell your friend to send this to the other people so they can also get a refund.'
        ],
        correctIndices: [2],
        explanation:
            'Fake Airline accounts may ask for WhatsApp or email. Real Airlines don\'t do that. Check for the verified account, don\'t reply or share, block and report instead.',
        assetImage: './assets/Seasons/image49.png'),
    const Q(
        prompt: ' You recognize this as?',
        options: ['Legitimate', 'Scam'],
        correctIndices: [1],
        explanation:
            'This is a scam. The message asks you to “Verify your bank card” using a strange link. Real banks or hotels never do this by text. Clicking the link lets scammers steal your card or login details, install malware on your device, or take over accounts and steal money/identity',
        assetImage: './assets/Seasons/image50.png'),
    const Q(
        prompt:
            ' You booked a hotel recently with Booking.com. Today, you received this email from an unknown email address. What is the best action?',
        options: [
          'Block, report, and delete the email.',
          'Contact them using the button.',
          'Reply to the email.',
          'Click the Booking.com link in the email.'
        ],
        correctIndices: [0],
        explanation:
            'Scammers send fake booking emails that look urgent. If the sender is unknown, block the report and delete it. Don\'t click links or reply. Always check your booking progress or booking details through the official website or app.',
        assetImage: './assets/Seasons/image51.png'),
    const Q(
        prompt:
            ' You have a property listed on Booking.com. And you have been receiving good reviews about your property and service for years, especially during holiday seasons. Today you get this email,',
        options: [
          'You panic and want to see the guest complaint, so you click the button in the email body.',
          'You replied as soon as you saw this email.',
          'You blocked the email and deleted it.',
          'Send this email to your staff to check on the complaint.'
        ],
        correctIndices: [3],
        explanation:
            'Don\'t panic if you get an email like this. Scammers try to scare you with fake “Complaints” or “Block your hotel” to make you click quickly. Stay calm. Ignore the link and always check directly in your official account for any real issues.',
        assetImage: './assets/Seasons/image52.png'),
    const Q(
        prompt:
            ' This is a legitimate email. What do you think about this statement?',
        options: ['True', 'False'],
        correctIndices: [1],
        explanation:
            'Emails offering “Free tickets” are a classic scam. Airlines don\'t give away round-trip tickets through random emails. Always check with the official website.',
        assetImage: './assets/Seasons/image53.png'),
    const Q(
        prompt: 'What is the biggest red flag in this email?',
        options: [
          'It promises TWO round-trip tickets out of nowhere.',
          'It creates urgency by giving you a deadline.',
          'The email provides a link and asks you to click the link to claim the free tickets.',
          'All of the above'
        ],
        correctIndices: [3],
        explanation:
            'Real Airlines doesn\'t give free tickets like in the email. Always delete and report this kind of email and check with the official airline website.',
        assetImage: './assets/Seasons/image54.png'),
    const Q(
        prompt:
            'One of your family members received this email. What is your opinion about this?',
        options: [
          'This is a scam.',
          'This is a great opportunity.',
          'Click the button.',
          'Ask them to share this with you, too.'
        ],
        correctIndices: [0],
        explanation:
            'Scammers often use real airline logos and images to make emails look genuine, but these can be easily copied or stolen. Do not trust the visuals. Always check the sender\'s email and link address. If the domain is not the official airline domain, the email is fake, and the images and logos are just bait to trick you.',
        assetImage: './assets/Seasons/image55.png'),
    const Q(
        prompt: 'What should be your right answer?',
        options: [
          'Thank you so much!.',
          'I didn\'t enter a contest, but thank you!.',
          'How can I pay?.',
          'No, thank you! (Hang up) and block the number.'
        ],
        correctIndices: [3],
        explanation:
            'This is a real classic scam. Real prizes never ask for a fee. Don\'t engage. Hang-up and block the number.',
        assetImage: './assets/Seasons/image56.png'),
    const Q(
        prompt: 'What will you do?',
        options: [
          'Click the link..',
          'Reply to the message.',
          'Block, Delete and report.',
          'Call the number'
        ],
        correctIndices: [2],
        explanation:
            'The link is fake and unsafe. Airlines only send boarding passes through the official app or website.',
        assetImage: './assets/Seasons/image57.png'),
    const Q(
        prompt: 'Is this the official website of Qantas Airlines?',
        options: ['Yes', 'No'],
        correctIndices: [1],
        explanation:
            'Scammers make fake airline pages using real logos and names. The official sites always use the real domain, such as qantas.com, united.com, with http:// and a padlock. Real social media pages also have a blue check mark. If the name looks strange,\n'
            'it\'s fake. Always go to the official website or use the app.',
        assetImage: './assets/Seasons/image58.png'),
    const Q(
        prompt: 'Is this email a scam or not a scam, and why? ',
        options: [
          'This is a scam - This has a link.',
          'This is not a scam - This email is from the official Qantas Airways domain, and it\'s directly addressed to you.',
          'This is a scam - Has used polite language.',
          'This is not a scam - No urgency, no fee to pay, and they don\'t ask for personal details.'
        ],
        correctIndices: [1, 3],
        explanation:
            'This is not a scam. This email comes from the official domain, including your real booking details. Uses clear, polite language. There is no urgency, no request for a payment, and no demand for personal information. Always check the sender\'s address and link address.',
        assetImage: './assets/Seasons/image59.png'),
  ],
  'Delivery': [
    /// delivery scams questions
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
      correctIndices: [2],
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
      correctIndices: [2],
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
      correctIndices: [1],
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
      correctIndices: [3],
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
      correctIndices: [3],
      explanation:
          'It is a phishing fraud that applies urgency and a small fee to lure you into a counterfeit website, which robs you of your information. Do not open SMS links that you are not familiar with; only confirm the deliveries through the official site or application of the courier.',
    ),
    const Q(
        prompt:
            'An unknown number sends you a text that your parcel will be returned unless you update your \n'
            'delivery location within 12 hours with the help of the link that it has sent: http://inlepoizl.shop. \n'
            'What should you do?',
        options: [
          'Click the link quickly to update your address and avoid losing the parcel',
          'Call the number in the text to confirm if the message is genuine',
          'Ignore and delete the message without clicking the link ',
          'Copy the link into another browser to double-check if it is safe'
        ],
        correctIndices: [2],
        explanation:
            'Official websites or apps are also utilized by legitimate delivery companies and not random SMS links. The less risky one is to leave the message untouched and delete it.',
        assetImage: './assets/Delivery/image138.png'),
    const Q(
      prompt:
          'You get a text message that it is an official FedEx. It reads: Your package is awaiting customs clearance. Pay AUD 2.99 now with the help of the following \n'
          'link to prevent delays: http://fedex-clearance.top/parcel. \n'
          'What should you do?',
      options: [
        'Pay the small fee quickly, so your delivery isn’t delayed',
        'Ignore and delete the message without clicking the link ',
        'Copy the link into a browser to confirm if it is real',
        'Reply asking the sender for proof of the delivery'
      ],
      correctIndices: [1],
      explanation:
          'This is a scam. Delivery companies do not charge little random fees via text with suspicious access. The connection will send you to \n'
          'a phishing site to steal your payment information. The least harmful option is to disregard the message and delete it.',
    ),
    const Q(
        prompt:
            'You get a text message telling you your parcel will not be delivered due to an invalid postal code. It consists of a link \n'
            '(https://auspostoiiza.shop/au) and instructions to reply with Y and reopen the message to use the link. \n'
            'This is purportedly a message by the AusPost Team, and it encourages you to do it before the next 24 hours. \n'
            'What should you do?',
        options: [
          'Click the link and enter your postal code to ensure the parcel is delivered.',
          'Reply with “Y” to see if the link activates.',
          'Ignore the message, delete it, and check your parcel status only through the official AusPost website or app .',
          'Copy the link into another browser to test if it works safely'
        ],
        correctIndices: [2],
        explanation:
            ': It is a phishing scheme where the urgency can be used to pressure you to use a counterfeit link and steal your information. ',
        assetImage: './assets/Delivery/image139.png'),
    const Q(
      prompt:
          'A text message is received: "Amazon Delivery: Your order could not be delivered because of a wrong billing address. \n'
          'Check your information now at amazon-parcelverify. shop. or else your order is cancelled in 12 hours." What should you do ?',
      options: [
        'Enter your billing details on the link to stop your order from being cancelled',
        'Ignore and delete the message, then check your order status in your Amazon account ',
        'Reply to the text asking for your order number',
        'Forward the link to a friend to test it safely'
      ],
      correctIndices: [1],
      explanation:
          ': It is a phishing scam in the image of Amazon. Fraudulent links steal credit and bank account information.\n'
          ' The safest way to do it is to delete the message and check only the orders with the help of the official Amazon one.',
    ),
    const Q(
        prompt:
            ' You get several text messages from an unknown number saying that it is CA FasTrak. The texts indicate that you have a \n'
            'small balance to pay, 3.67 to be paid immediately via the link CAtollinvoice.com, and otherwise you will be charged a late fee of 49.67.\n'
            'What should you do?',
        options: [
          'Pay the \$3.67 straight away to avoid the larger late fee',
          'Copy the link into your browser to double-check if it’s real',
          'Delete the messages and verify any toll balance only through the official CA FasTrak website or app ',
          'Reply to the text asking for more information about the toll charge'
        ],
        correctIndices: [2],
        explanation:
            ': This is a phishing scam. To seem innocent of what they are about with their requests, scammers request very little, such as \$3.67, and urge you to act immediately. \n'
            'The counterfeit site is meant to steal payments. The best solution would be to delete the message and to be careful and visit only \n'
            'the official CA FasTrak site or application to estimate whether you will owe money or not.',
        assetImage: './assets/Delivery/image140.png'),
    const Q(
        prompt:
            ' You get a text message that purports to be from USPS. It states that there is no way your parcel can be delivered because you provided an incomplete address \n'
            'and gives a tracking number to make it sound more believable. It requires you to submit your particulars  within 24 hours using a link (https://usps.uspxstp.com/ipsps),\n'
            'or your package will be returned.What should you do?',
        options: [
          'Click the link and update your address to stop the parcel from being returned',
          'Reply “Y” as instructed to activate the link and confirm delivery',
          'Delete the message and check any delivery updates only through the official USPS website or app ',
          'Copy the link into a safe browser to test if it’s real before entering details'
        ],
        correctIndices: [2],
        explanation:
            ':This is a phishing scam. The deceptive tracking number and urgent time frame are another type of trick to rob you of your details. Essentially, the only way is to delete the message and check deliveries only on the official USPS webpage or application.',
        assetImage: './assets/Delivery/image141.png'),
    const Q(
        prompt:
            'You receive a message that says it is Evri Customer Service. It tells you that the delivery of your package is not possible because of the absence of an address or the damaged address information. \n'
            'To repair it, they instruct you to use a link and even provide you with instructions to use Y in order to make the link operational.What is the safest response?',
        options: [
          'Reply “Y” and update your details through the link so the package isn’t lost',
          'Copy the link into a browser to confirm if it’s real before entering any details',
          'Delete the message and check any parcel updates only on Evri’s official website or app',
          'Forward the message to a friend to see if they’ve received something similar'
        ],
        correctIndices: [2],
        explanation:
            ':This is a phishing scam. To fool you into clicking links to steal personal or payment information, scammers exploit imaginary delivery mistakes and emergency orders. The most secure one is to disregard the message and use the official courier site or application to view deliveries.',
        assetImage: './assets/Delivery/image142.png'),
    const Q(
        prompt:
            'You are on a webpage that resembles a parcel tracking webpage. It displays a tracking number, dates, and delivery notices, such as \'We attempted to deliver your parcel today, and it is currently stocked in the warehouse.\' \n'
            'On the page, there is a red button marked with Schedule Your Delivery. The web address, though, is not the one belonging to the official courier, and there are spelling errors such as shipping and delivered. What is the safest action ?',
        options: [
          'Ignore the spelling mistakes and click “Schedule Your Delivery” to reschedule your parcel.',
          'Close the page and instead log in to the courier’s official website or app to check if you have a real delivery.',
          'Enter your personal details carefully, but avoid entering your payment information.',
          'Share the webpage with a friend to ask if they think it’s legitimate'
        ],
        correctIndices: [1],
        explanation:
            ':This is a phishing site. Fraudsters duplicate the tracking pages of parcels to lure you into clicking the bogus buttons and processing personal or payment information. The best thing to do is to abandon the page and use the official website or app of the courier only.',
        assetImage: './assets/Delivery/image143.png'),
    const Q(
        prompt:
            'You get a text message purporting to be an Australian post message. It informs that your parcel is put on hold because of an invalid postal code and suggests that you should check your address within 24 hours with the help of the link: https://aupost-todoors.top/Aupost. \n'
            'It threatens to cancel the delivery in case you do not act and even asks you to respond with Y to turn on the link.What is the safest action?',
        options: [
          'Reply “Y” and update your address through the link so the parcel isn’t cancelled',
          'Copy the link into your browser to check if the page looks official before entering details',
          'Delete the message immediately and check your delivery status only through the official Australia Post website or app ',
          'Forward the message to a friend and ask if they have received something similar'
        ],
        correctIndices: [2],
        explanation:
            ':This is a phishing scam. The deceptive website and the pressing time frame are aimed at deceiving you into sharing personal or financial information. The most secure means of action is to disregard the message and receive deliveries only through the official postal service.',
        assetImage: './assets/Delivery/image144.png'),
    const Q(
        prompt:
            'You get a message that claims to be from Australia Post. It says your parcel cannot be delivered because of an invalid postal code and gives you 24 hours to fix it. The text includes a suspicious link: https://auspost-com-a□.win/au, and asks you to reply “Y” to activate the link. What should you do?',
        options: [
          'Reply “Y” and follow the link to quickly update your postal code before the parcel is cancelled',
          'Delete the message, then report it as spam or phishing through your phone provider or Scamwatch ',
          'Copy the link into another browser to check if the page looks official',
          'Share the message with a friend to ask if they received something similar'
        ],
        correctIndices: [1],
        explanation:
            ':This is a phishing scam. The bogus address and time-sensitive nature are meant to deceive you into providing information. The safest one is to report and remove the message.',
        assetImage: './assets/Delivery/image145.png'),
    const Q(
        prompt:
            'You are getting a message that appears to be an mail from DHL Express. It claims that you have a package that is under delivery, and you are required to pay AUD 2.99 as unpaid shipping charges. \n'
            'Such links as Please complete the shipping transaction and the warning message that the parcel will be returned within 48 hours are included in the email. What should you do?',
        options: [
          'Pay the AUD \$2.99 through the link so your package won’t be returned.',
          'Report the email as phishing or spam through your email provider.',
          'Forward the email to a friend to see if they think it’s genuine.',
          'Click the link, but only enter your name and address, not payment details'
        ],
        correctIndices: [1],
        explanation:
            ':This is a phishing scam. The fraudsters take advantage of minor charges to make people fall victim to spurious payments and lose information. It is the safest as it is recommended to report the email and delete it.',
        assetImage: './assets/Delivery/image146.png'),
    const Q(
      prompt:
          'You get an email that looks like it comes from DHL Express. According to it, your package is withheld in Terminal 1 due to an outstanding shipping fee of AUD \$2.99. \n'
          'The message contains official-looking branding, the urgent use of words, and links that can be clicked, and which write the words please complete the shipping transaction and confirm the payment to deliver it.\n'
          'They are telling you that you have 48 hours to act or your parcel will be returned. What is the safest response?',
      options: [
        'Pay the AUD \$2.99 immediately through the link, so your parcel isn’t returned',
        'Report the email as phishing using your email provider’s “Report” button',
        'Click the link to check if the website looks official before deciding',
        'Forward the email to DHL’s support team, but keep the link open in case you need it later'
      ],
      correctIndices: [1],
      explanation:
          ':This is a phishing scam. The imitation DHL labelling and the low price are created to make the email appear authentic. You are revealing your information when you click the link. The most secure thing to do is to declare it phishing and get rid of it.',
    ),
    const Q(
        prompt:
            'This is a high-volume scam sent via messages and RCS. What is the objective of this message?',
        options: [
          'To complete the address and send the package.',
          'Stealing personal information and credit details.',
          'To stop the future delays.',
          'To arrange a new delivery time.'
        ],
        correctIndices: [1],
        explanation:
            ':Scammers want you to click the link and enter your private details, such as your name, address, and card details. The “delivery problem is just a bait.',
        assetImage: './assets/Delivery/image147.png'),
    const Q(
        prompt:
            'You receive this message while waiting for a parcel. What is your next move?/moves',
        options: [
          'Panic and fill the form.',
          'Read carefully and identify the red flags.',
          'Delete the message.',
          'Report the message to Apple or Google.'
        ],
        correctIndices: [1, 2, 3],
        explanation:
            ':Don\'t panic and give scammers what they want. Instead, stay calm, check for red flags, delete the message, and report it. Then you can protect others, too.',
        assetImage: './assets/Delivery/image148.png'),
    const Q(
        prompt: 'What is the right decision?',
        options: [
          'Click the link - because you do not want to pay extra.',
          'Don\'t click the link - because you can go and take it.',
          'Click the link - because you want to see the details of the parcel.',
          'Don\'t click the link, because the link looks suspicious.'
        ],
        correctIndices: [3],
        explanation:
            ':This is the safest behavior. Do not click any of the links or buttons in the message if they are suspicious and untrustworthy.',
        assetImage: './assets/Delivery/image149.png'),
    const Q(
        prompt: 'What are the red flags in this message?',
        options: [
          'The rush (within 24 hours).',
          'Unofficial link.',
          'Strange instructions.',
          'Professional language and tone',
        ],
        correctIndices: [0, 1, 2],
        explanation:
            ':Scammers often create urgency, use non-official links, and give strange instructions. Professional tone alone is not a red flag.',
        assetImage: './assets/Delivery/image150.png'),
    const Q(
      prompt:
          'Sending fake delivery messages is one of the ways of delivery scams happening. What are the other well-known ways in which delivery scams happen?',
      options: [
        'Email',
        'Calls',
        'Post',
        'Door to door',
      ],
      correctIndices: [0, 1],
      explanation:
          ':Delivery scams don\'t only come by text. They can also arrive by email or even fake phone calls. Always check with the official delivery service before acting.',
    ),
    const Q(
      prompt: 'What are some of the common red flags in a scam email?',
      options: [
        'Poor format with bad grammar.',
        'Sense of urgency.',
        'Mismatched email address.',
        'Professional design with consistent branding',
      ],
      correctIndices: [0, 1, 2],
      explanation:
          ':Poor grammar, urgent pressure, and mismatched sender addresses are classic phishing red flags. A professional, consistent design is not a red flag on its own.',
    ),
    const Q(
        prompt:
            'Your mom showed you this email that she got. What is your first move?',
        options: [
          'Delete and report.',
          'Ask her to click the link.',
          'Reply to the email.',
          'Copy and paste the link into the browser',
        ],
        correctIndices: [0],
        explanation:
            ':The Safest move is to delete and report. Never click the link, reply to it,  or copy it into the browser, as that only helps the scammer.',
        assetImage: './assets/Delivery/image151.png'),
    const Q(
        prompt: 'What is your next step?',
        options: [
          'Click the link.',
          'Delete the message.',
          'Reply to the message.',
          'Call the number.'
        ],
        correctIndices: [1],
        explanation:
            ':The safest next step is to delete the message because scam texts often include fake links and ask for your details. Don\'t click, reply, or call the number.',
        assetImage: './assets/Delivery/image152.png'),
    const Q(
        prompt: 'What are the red flags in this email?',
        options: [
          'Asking for a fee.',
          'Urgency.',
          'A trick to get the user\'s details.',
          'Have the failed delivery details.'
        ],
        correctIndices: [0, 1, 2],
        explanation:
            ':Scam delivery messages often ask for fees, create urgency,y or trick you into giving personal details. They can even make up fake delivery failed details to look real. So don\'t believe them.',
        assetImage: './assets/Delivery/image153.png'),
    const Q(
        prompt: 'What is the correct response?',
        options: [
          'Click the button to fix your inbox.',
          'Delete the email without clicking any links.',
          'Reply and ask for clarification.',
          'Forward to friends for awareness.'
        ],
        correctIndices: [1],
        explanation:
            ':The safest option is to delete without clicking. Legitimate institutions do not use fear tactics or ask you to “restore” inboxes. Clicking could lead to credential theft.',
        assetImage: './assets/Delivery/image154.png'),
    const Q(
        prompt: 'Which red flag shows this is a scam?',
        options: [
          'The message demands a small payment fee.',
          'It mentions Royal Mail by name.',
          'It talks about a package delivery.',
          'It includes a shipping charge.'
        ],
        correctIndices: [0],
        explanation:
            ':The scammer is exploiting urgency and the idea of a low-cost fee to get you to pay quickly. Official couriers never request payment, this way they will direct you to their official website or send a proper invoice.',
        assetImage: './assets/Delivery/image155.png'),
    const Q(
        prompt: 'How can you spot this scam?',
        options: [
          'It politely apologizes.'
              'It provides a suspicious reschedule link.',
          'It mentions package return.',
          'It talks about a delivery driver.'
        ],
        correctIndices: [1],
        explanation:
            ':The biggest red flag is the fake link. Real couriers will leave a card at your door or send a notice through their official app. They will not text you random URLs to reschedule deliveries.',
        assetImage: './assets/Delivery/image156.png'),
    const Q(
      prompt:
          '“We tried to deliver your parcel today but could not find your address. Please confirm your details at the link below to arrange redelivery. Use safari browser to open this link.” You get this message. What is your next step?',
      options: [
        'Click the link and enter details.',
        'Ignore or delete the message.',
        'Call the number.',
        'Ask for more details.'
      ],
      correctIndices: [2],
      explanation:
          ':Always check the official courier app or website directly or call the official courier service)',
    ),
    const Q(
        prompt: 'You get this email. What is your next move?',
        options: [
          'Click the link and pay immediately so your parcel isn’t returned,',
          'Reply to the email asking for more information.',
          'Delete the email or mark it as phishing.',
          'Forward the email to friends to check if they also got it'
        ],
        correctIndices: [3],
        explanation:
            ':The safest and recommended action is to delete or mark the email as phishing. Real courier companies will only ask you to pay fees or track parcels through their official website, never through random emails like this.',
        assetImage: './assets/Delivery/image159.png'),
    const Q(
        prompt:
            'You recently send a gift your friend, and then you receive this email. What is your next move?',
        options: [
          'Fill in the survey with your password.',
          'Delete the email and ignore it.',
          'Reply asking if the offer is real.',
          'Forward it to friends'
        ],
        correctIndices: [1],
        explanation:
            ':This is where things get catchy!! Because you did just send something you might think this email is connected and genuine. You may even wat to share this with friends so they also with free delivery. But that’s exactly how scams trick people. They use timing, fake rewards and urgent wordings.\n'
            'Real delivery companies will never ask for your email password or offer vouchers this way.',
        assetImage: './assets/Delivery/image160.png'),
    const Q(
        prompt: 'You get an email with above subject, what should you do?',
        options: [
          'Open the pdf immediately.',
          'Delete the email without opening the file.',
          'Reply asking for a tracking number.',
          'Save the file to check later.'
        ],
        correctIndices: [2],
        explanation:
            ':Malicious files often disguise themselves as safe looking PDFs. Opening them can install malware on your device. Real couriers will give you a tracking link on their official website not send random attachments.',
        assetImage: './assets/Delivery/image161.png'),
    const Q(
        prompt: 'What is the safest thing to do?',
        options: [
          'Reply to activate the link,'
              'Ignore and delete the message.',
          'Copy the link into your browser to check.'
        ],
        correctIndices: [2],
        explanation:
            ':Scammers combine fake links, deadline and odd instructions to trick you into giving away personal details.',
        assetImage: './assets/Delivery/image162.png'),
    const Q(
        prompt:
            'Your friend get this email and as a “Dot Scammer” user you say to him/she to delete it but he/she wants know why? ',
        options: [
          'Delete the email or mark it as phishing: because deleting it will automatically reschedule your delivery.'
              'Delete the email or mark it as phishing: because the correct my address button is likely a phishing link.',
          'Delete the email or mark it as phishing: because the message uses a generic greeting (“Dear User”) instead of your real name.',
          'Delete the email or mark it as phishing: because real couriers provide valid tracking information, not fake or unavailable numbers. '
        ],
        correctIndices: [1, 2, 3],
        assetImage: './assets/Delivery/image163.png'),
    const Q(
      prompt:
          '“This is DHL. Your package is on hold at customs. Please provide your date of birth and credit card details to release it” This is a SCAM, but why? Choose the correct red flag pair.',
      options: [
        'The caller says they are from DHL AND speaks politely.'
            'Parcel being held AND genuine DHL contact.',
        'Asking for credit card details AND asking for date of birth.',
        'Urgency to pay fee AND polite language.'
      ],
      correctIndices: [2],
      explanation:
          ':The scam is obvious because it asks for credit card details and your date of birth, information no legitimate courier would request this way.',
    ),
    const Q(
      prompt:
          '“You have been added to AusPost VIP Group. Verify your membership by clicking here: http://auspost-vip-check.net” \n'
          'One of your family members gets this WhatsApp message. As a user of “Dot Scammer” you identify this as a scam. And you advise them to block and delete this chat. But they ask why? ',
      options: [
        'WhatsApp groups are not used by AusPost.'
            'Link is not the official AusPost domain.'
            'Creates fake VIP status to trick users.'
            'Group invite proves it’s real'
      ],
      correctIndices: [0, 1, 2],
      explanation: ':Anyone can create WhatsApp groups-even scammers.',
    ),
    const Q(
        prompt: 'Why this email is legitimate?',
        options: [
          'Sent from official domain.',
          'Uses your real name.',
          'Provides a valid tracking ID that works on AusPost website.',
          'Asks for payment link'
        ],
        correctIndices: [0, 1, 2],
        explanation:
            ':Official sender + your name + a verifiable tracking ID. Asking for payment would be a red flag, so D is not correct.',
        assetImage: './assets/Delivery/image164.png'),

    const Q(
      prompt: 'Do you want to reschedule this package?',
      options: ['Yes', 'No'],
      correctIndices: [1],
      explanation:
          'Scammers send fake delivery texts asking you to pay small fees through strange links. Always check deliveries through the official courier website or app, not links in random messages.',
      assetImage: './assets/Delivery/image123.png',
    ),
    const Q(
      prompt: 'Is this a scam message?',
      options: ['Yes', 'No'],
      correctIndices: [0],
      explanation:
          "This is a scam because the link is not the official USPS website and asks for personal details to confirm delivery. Real postal services don't ask for your information this way.",
      assetImage: './assets/Delivery/image125.png',
    ),
    const Q(
      prompt:
          'This SMS claims you have a package waiting and provides a tracking code with a shortened link. Is this safe?',
      options: ['Yes', 'No'],
      correctIndices: [1],
      explanation:
          'Scammers use random tracking codes that look real but don’t match any official format. The shortened link hides the true destination, which is a classic phishing trick. Clicking could lead to a fake site designed to steal login or payment details.',
      assetImage: './assets/Delivery/image137.png',
    ),
    const Q(
      prompt:
          "You get the above email mentioning that your shipment is scheduled for delivery. There is a “Sign in” button to sign in and reconfirm the delivery address. When you click that button, they are asking for your email address and password to sign in to your FedEx account. But when you enter your password, the web page says the password is incorrect."
          "Which statement is true?",
      options: ['Yes', 'No'],
      correctIndices: [0],
      explanation:
          'This is a phishing scam. The web page is deliberately designed to trick you into giving away your email credentials under the disguise of a delivery confirmation.',
      assetImage: './assets/Delivery/image126.png',
    ),
    const Q(
      prompt:
          'Courier calls from an unknown number asking for your card details. Is this OK?',
      options: ['A scam', 'A legitimate'],
      correctIndices: [0],
      explanation:
          "This is a scam because the sender's email address is fake, and it asks you to click a link to reschedule delivery. Real USPS messages only come from their official site.",
      assetImage: './assets/Delivery/image128.png',
    ),
    const Q(
      prompt:
          'This SMS says your package could not be delivered and gives a link to check status. Is this safe?',
      options: ['Yes', 'No'],
      correctIndices: [1],
      explanation:
          'Delivery companies never send generic links asking you to “check status.” The suspicious domain is unrelated to any real courier service. Clicking could install malware or trick you into entering personal details like your address, date of birth, or credit card number.',
      assetImage: './assets/Delivery/image135.png',
    ),
    const Q(
      prompt:
          'This message says your delivery is delayed and urges you to click urgently to update preferences. Is it safe?',
      options: ['Yes', 'No'],
      correctIndices: [1],
      explanation:
          "The use of urgent language (“URGENT!!” and “reschedule immediately”) is designed to scare you into acting without thinking. Real companies don’t threaten you or demand instant action. The suspicious link is another clear warning sign.",
      assetImage: './assets/Delivery/image157.png',
    ),
    const Q(
      prompt:
          'This email claims to be from DHL asking you to pay \$1.99 to release your package. Is this safe?',
      options: ['Yes', 'No'],
      correctIndices: [1],
      explanation:
          "Fake courier emails often use a very small “release fee” to trick you. Real DHL shipments are managed through official invoices and secure portals, not random emails. The suspicious sender address and low fee are clear scam signs.",
      assetImage: './assets/Delivery/image158.png',
    ),
    const Q(
      prompt:
          'Customs hold:  Your package is delayed at the boarder. Pay \$15 immediatly using the link below or your item will be returned. (http://customs-clearance-fee.org) \n'
          'Is this message is a scam?',
      options: ['Yes', 'No'],
      correctIndices: [0],
      explanation:
          "Scammers create fake urgency by asking for quick payments through links. Real customs or couriers will never demand money by random emails or texts.",
    ),
    const Q(
      prompt:
          'Congratulations! As a loyal customer you have won free express delivery for 6 months. Claim your reward here. (http://fasttrack-freepromo.co ) \n'
          'Is this message is a scam?',
      options: ['Yes', 'No'],
      correctIndices: [0],
      explanation:
          "Scammers use fake rewards and prizes to trick you into clicking links. Real delivery companies don’t give loyalty gifts by random emails or texts.",
    ),
  ],

  /// Job Offers Scams questions
  'Job Offers': [
    const Q(
        prompt:
            'You are seeking a job; you’ll get a job message with a high-rate payment, like below. What will you send back? Please select your answer.',
        options: [
          'YES',
          'NO',
          'Ignore/ report the message',
        ],
        correctIndices: [2],
        explanation:
            'If the salary sounds too good to be true, it usually is. Always research before replying.',
        assetImage: "./assets/Jobs/image01.png"),
    const Q(
      prompt:
          '“This is your manager. Please purchase immediately 500 gift cards with a value of \$500 and e-mail me the code.” What are the best actions?',
      options: [
        'Purchase the cards face or lose your job',
        'Response by requesting that gift card',
        'Dial your manager on his/her official number',
        'Share this message with your colleagues'
      ],
      correctIndices: [2],
      explanation:
          'Scammers impersonate bosses to put pressure on them. Never use unofficial   numbers and always confirm using official numbers.',
    ),
    const Q(
      prompt:
          '“Congratulations! You won 1000 vouchers as a reward for your hard work! Click here to claim.” What should you do?',
      options: [
        'Click the link to view the prize',
        'Report or block the number',
        'Insert your information to check whether it is real or not',
      ],
      correctIndices: [1],
      explanation:
          'In the real world, companies do not provide prizes at random. Such a link can be used to get phished or malware.',
    ),
    const Q(
      prompt:
          'You find a site that offers sneakers at 80% off, bank transfer is the sole method of payment',
      options: [
        'Make purchases before it is finished selling',
        'Request customer care about PayPal.',
        'Review and payment safety in check and then make decision.',
        'Believe the offer since it is on social media'
      ],
      correctIndices: [2],
      explanation:
          'The absence of safe payment systems such as PayPal or credit cards is also a good warning.',
    ),
    const Q(
      prompt: 'Which answer would you prefer?'
          "Facebook post: Two times money today, hit your two times money today, in case you invest",
      options: [
        'Transfer small test amount',
        'Request their licensed/ registration number',
        'Introduce friends who are interested in crypto',
        'Ignore the post and move'
      ],
      correctIndices: [1],
      explanation:
          'Crypto currency scams are also characterized by promises of high returns, guaranteed.',
    ),
    const Q(
      prompt:
          'On LinkedIn someone writes to you “Google is in urgent need of employees. No interview required. All you need to do is to send in your ID and bank details and get on boarded.”',
      options: [
        'Send the ID to prove your identity',
        'Ask for an official job posting link',
        'Ignore it because it’s too much effort',
        'Give partial bank details to test them'
      ],
      correctIndices: [1],
      explanation:
          'Why is this suspicious? Always interviews are necessary in big companies, Recruiters do not request bank information or use personal email first',
    ),
    const Q(
      prompt:
          'You are offered a remote assistant job. “We’ll send you a cheque for \$2000. Make a deposit, collect your salary and send the rest to our supplier.”',
      options: [
        'Deposit the cheque and follow instructions',
        'Refuse the offer and block communication',
        'Ask for smaller payment to rest',
        'Send the money and then do a follow-up with the bank'
      ],
      correctIndices: [1],
      explanation:
          'Fake cheque scams get you liable to bounced funds. Never send money back.',
    ),
    const Q(
      prompt:
          'A company gives you a cheque of \$3000 prior to you even beginning to work and requests you to remit a portion of its back to the company. Do you believe that this is safe? ',
      options: ['Yes', 'No'],
      correctIndices: [1],
      explanation: 'This is a scam of overpayment/ take cheque',
    ),
    const Q(
      prompt:
          'A recruiter you that you are chosen to work on a paid internship, however, you must purchase software license first, which costs \$250. Is this normal? ',
      options: ['Yes', 'No'],
      correctIndices: [1],
      explanation:
          'Real internships offer needed equipment, and do not expect purchasers to do so.',
    ),
    const Q(
      prompt:
          'Fill in the blanks. You got an e-mail concerning a new job opportunity. They request initial charges to train. It is a textbook scam of a type. Choices: ................',
      options: ['Job offers scam', 'Advance fee scam'],
      correctIndices: [1],
      explanation:
          'Any adviser type scheme will first demand funds and then offer employment to you',
    ),
    const Q(
        prompt: 'Is this email genuine?',
        options: ['Yes', 'No'],
        correctIndices: [1],
        explanation:
            'Google only uses@google.com emails. Fake domain and request for bank 	details are red flags.',
        assetImage: "./assets/Jobs/image02.png"),
    const Q(
      prompt:
          'What is the biggest red flag here?“You’ve been selected for a part-time job. To start, pay a \$50 training fee.”',
      options: [
        'The offer came via social media',
        'Asking for a training fee',
        'The job is part-time',
        'The message is friendly'
      ],
      correctIndices: [1],
      explanation: 'Real jobs never ask you to pay upfront.',
    ),
    const Q(
        prompt: 'What are the red flags?',
        options: [
          'Requesting ID copy',
          'Requesting credit card photo',
          'Offering job immediately without interview ',
          'Contacting on WhatsApp'
        ],
        correctIndices: [0, 1, 2],
        explanation:
            'No real employer needs personal ID or card details via messaging apps',
        assetImage: "./assets/Jobs/image03.png"),
    const Q(
        prompt: 'Is this email genuine?',
        options: ['Yes', 'No'],
        correctIndices: [0],
        explanation:
            'The email is from the official@google.com domain, and it directs you to 	the company’s verified careers portal',
        assetImage: "./assets/Jobs/image04.png"),
    const Q(
        prompt: 'Is this a legitimate Unilever domain? ',
        options: ['Yes', 'No'],
        correctIndices: [0],
        explanation:
            'Unilever uses@unilever.com. Fake domains with extra words are scams',
        assetImage: "./assets/Jobs/image05.png"),
    const Q(
        prompt: 'What signs show this is a genuine recruiter?',
        options: [
          'Verified LinkedIn recruiter badge',
          'Provides official company careers page ',
          'Requests for personal bank info ',
          'Pressures you to act immediately'
        ],
        correctIndices: [0, 1],
        explanation:
            'Verified recruiters always link to official company portals and never ask for sensitive info directly.',
        assetImage: "./assets/Jobs/image06.png"),
    const Q(
        prompt: 'Which parts are suspicious?',
        options: [
          'Asking for credit card ',
          'High weekly salary',
          'Mystery shopper jobs are real',
          'No interview or screening'
        ],
        correctIndices: [0, 1, 3],
        explanation: 'Real companies pay via secure payroll, not credit card',
        assetImage: "./assets/Jobs/image07.png"),
    const Q(
        prompt: 'What’s the most dangerous red flag?',
        options: [
          'Hired without interview ',
          'Contacting on LinkedIn',
          'Microsoft is a big company',
          'Message looks professional'
        ],
        correctIndices: [0],
        explanation:
            'No major company hires without interviews or background checks.',
        assetImage: "./assets/Jobs/image08.png"),
    const Q(
      prompt:
          'What makes this a legitimate job offer? Job ad: “Data Analyst – Entry Level. \$55,000/year. Benefits included. Apply directly via SEEK.”',
      options: [
        'Listed on a trusted job board',
        'Extremely high pay',
        'No interview required',
        'Requests for money upfront'
      ],
      correctIndices: [0],
      explanation:
          'Being posted on a well-known job board (SEEK, indeed, LinkedIn) and offering realistic pay/benefits is typical for genuine roles',
    ),
    const Q(
        prompt:
            'A text message is sent by a random number saying that he/she is indeed. \n '
            'The sender states that your resume was referred by internet agencies and provides you with online remote employment that pays 70-300 a day,\n'
            'but requires you to work only 60-90 minutes, and the payment is made immediately. \n'
            'They request you to respond either with yes or no if you are interested.What should you do?',
        options: [
          'Reply “yes” to learn more about the job',
          'Reply “no” to decline politely',
          'Ignore and delete the message',
          'Forward the message to friends who may be interested'
        ],
        correctIndices: [2],
        explanation:
            'This is a fake job email. In the real world, there is no high wage and little work, or a yes/no response. \n'
            'In response, it will only confirm that your number is being used and increase the chances of fraud. The best thing to do is to block the sender.',
        assetImage: "./assets/Jobs/image09.png"),
    const Q(
        prompt:
            'You get a text message from an unfamiliar number saying that it was sent by SEEK. \n'
            'The advertisement claims they are looking to recruit for a “flexible, distant role”, which simply demands 60-90 minutes of work daily and offers AUD 150-300 a day. It also grants you paid annual leave after 6 months and requests that you submit your application by simply responding Yes. \n'
            'What should you do?',
        options: [
          'Reply “Yes” to secure the job immediately',
          'Reply “No” to decline politely',
          'Ignore, delete the message, and block the sender ',
          'Share the opportunity with your friends'
        ],
        correctIndices: [2],
        explanation:
            'The scheme is a fake since the compensation is too high with minimal effort required, \n and genuine organizations would not use random text messages to hire employees. \n '
            'The best move is to disregard it and get rid of it.',
        assetImage: "./assets/Jobs/image10.png"),
    const Q(
      prompt:
          'On LinkedIn, an individual who pretends to be a recruiter in a reputable IT firm sends you a direct message.\n'
          'They tell them they need remote workers and pay \$3,000 per week to do the data entry. The recruiter demands immediate action and attaches a PDF file, which is called the Job Contract. \n '
          'Upon opening the document, it requests that you provide your full name, address, bank details, and a copy of your driver\'s license.',
      options: [
        'Fill out the form and send it back immediately',
        'Reply and ask for an official company email address',
        'Do not open or share personal details, and block the recruiter',
        'Share the job contract with your classmates to check if it’s genuine'
      ],
      correctIndices: [2],
      explanation:
          'Simple tasks should be baited with high pay. Asking for sensitive information such as IDs and bank accounts is identity theft.\n'
          'Legit recruiters do not use unsafe DMs on social media with harmful attachments.',
    ),
    const Q(
        prompt:
            'You get a text message that is sent by an unknown number. This email purports to be sent by a person named Nina, who is referred to as a person of Jora, \n'
            'and that your resume was referred to by various recruitment agencies. The message is of remote employment with a salary of \$150-300 an hour for just 60-90 minutes of labor with same-day.\n'
            'What should you do?',
        options: [
          'Reply “YES” to apply quickly before the job is gone',
          'Reply “NO” to let them know you are not interested',
          'Ignore, delete the message, and block the number',
          'Forward the message to your friends in case they want to apply'
        ],
        correctIndices: [2],
        explanation:
            'It is a scam since it offers a person a lot of money at minimal effort from an unfamiliar sender. It is not the real companies that recruit through random texts with requests like: Yes/No. \n'
            'The most prudent thing to do is to disregard and delete the message.',
        assetImage: "./assets/Jobs/image11.png"),
    const Q(
      prompt:
          'You got a phone call from somebody who claims to be in the HR department of a well-known airline. They claim that you have been pre-selected to work \n'
          'as cabin crew in a foreign country. The caller says that prior to official training, you must book your flight tickets on your own through their partner agency \n'
          'and send a copy of your passport. They even threaten you that unless you do it now, the people will allow the other person.',
      options: [
        'Provide the passport copy and book the flight immediately',
        'Ask for written confirmation via email before paying',
        'End the call and report the incident',
        'Save the details and think about it later'
      ],
      correctIndices: [2],
      explanation:
          'Urgency and fear of missing out are some of the tactics employed by scammers to pressure their victims. Practical employers take the travel organization \n'
          'seriously and do not require personal papers or flight tickets from unfamiliar agencies',
    ),
    const Q(
        prompt:
            'You get a text message from an unknown number saying that it is Camille of Hotjar. It is an online remote job that gives the message that your qualifications have been suggested by online recruitment agencies.\n'
            'It offers a remuneration of \$70-300 per hour at a minimum of 60-90 minutes’ working, and immediate payment. To apply, you are instructed to write yes or no.\n'
            'What should you do?',
        options: [
          'Reply “yes” to take advantage of the job opportunity',
          'Reply “no” to decline politely',
          'Ignore the message, delete it, and block the sender',
          'Share the message with friends in case they are interested'
        ],
        correctIndices: [2],
        explanation:
            'It is a scam email with false promises of unrealistic, high-paying jobs with minimum work effort and urging quick responses. Hotjar is not seeking legit employees by chance. \n'
            'The safest option is to delete and block the number.',
        assetImage: "./assets/Jobs/image12.png"),
    const Q(
      prompt:
          'You get the email with the following statement: "We are in dire need of remote assistants. None of the required skills and experience. \n'
          'Earn \$2,000 per week, paid in cash. First, please provide us with your full name, address, and a picture of your ID.',
      options: [
        'Send the details quickly to secure the job',
        'Ask if the company can pay by bank transfer',
        'Ignore and delete the email',
        'Forward the email to friends in case they are interested'
      ],
      correctIndices: [2],
      explanation:
          'It is a scam as no employer, even in reality, promises enormous compensation, with zero skills, and no requirements regarding personal ID are requested by email.',
    ),
    const Q(
      prompt:
          'You get an email notification of a position at a reputable bank from a recruiter. The proposal is sincere, and the email is dispatched \n'
          'using "bankjobs2024@gmail.com." rather than a formal organizational domain. \n'
          'They request that you send your CV and bank statement.',
      options: [
        'Send your CV and details right away',
        'Reply asking for more information',
        'Delete the email and do not respond',
        'Visit the Gmail account to check if it’s real'
      ],
      correctIndices: [2],
      explanation:
          'Fraudsters usually use counterfeit applications to steal data or install viruses. The actual employer would not need to have an unknown app downloaded to start working.',
    ),
    const Q(
      prompt:
          'You receive a text message from an unknown number saying he is Emily of Indeed. The advertisement is a 60-90-minute online remote job with a pay of \$100-500/day.\n'
          'It requests you to respond in the form of yes or no in case you are interested.\n '
          'What is the safest action?',
      options: [
        'Delete the message immediately without replying',
        'Reply “no” to let them know you are not interested',
        'Ask for more details before deciding',
        'Share the message with a friend who is job hunting'
      ],
      correctIndices: [0],
      explanation:
          ' It is a scam that offers unrealistic remuneration by an anonymous party masquerading as Indeed. Legitimate recruiters will never \n'
          'send you random yes or no text messages \n'
          'and even responding will make you active. The best thing to do is to delete it. ',
    ),
    const Q(
      prompt:
          'You get an email message whose subject is: Urgently Hiring - Start Tomorrow! It says that it is an international company and pays you \$400 per day to work two hours at the job as a data-entry worker.\n'
          'They indicate that you do not have to be present during an interview, although to guarantee a position, you must pay a \$75 application fee, using a money transfer service.\n',
      options: [
        'Pay the fee quickly to secure the position'
            'Ignore and delete the email',
        'Reply asking for a refund guarantee',
        'Forward the email to your classmates'
      ],
      correctIndices: [1],
      explanation:
          'Any offer of advance payment fees would be a fraud. Candidates are never requested to pay to apply to real companies. This is a typical fake job offer that is not \n'
          'realistic in its payments and does not require an interview.',
    ),
    const Q(
      prompt:
          'On LinkedIn, a person sends a message saying that he is a recruiter with a leading technology company. Your profile is said to be ideal for working as a remote IT support with the remuneration of \$ 2,500 a week. \n'
          'They offer a Google Form contact where you are expected to complete the personal information, including your full name, address, phone number, and bank account details, to get your first paycheck.\n',
      options: [
        'Fill in the form to get started'
            'Report and block the sender',
        'Ask them to send details via email instead',
        'Save the link in case you want to apply later'
      ],
      correctIndices: [1],
      explanation:
          'Authorized recruiters do not utilize random Google Forms to gather personal or financial data that is sensitive. This is an identity theft attempt.',
    ),
    const Q(
      prompt:
          'Someone calls on the phone and states that they are representatives of a high-end hotel chain. They inform you that you were chosen to occupy a high-paying position outside the country and that they would offer you free accommodation.\n'
          'They, however, insist that you need to send a scanned copy of your passport and must also send 200 dollars as visa processing fees within 24 hours to guarantee the job.\n',
      options: [
        'Send the documents and money immediately.'
            'Decline the offer and hang up',
        'Ask if you can pay later after arriving abroad',
        'Forward the caller’s number to a friend who may be interested'
      ],
      correctIndices: [1],
      explanation:
          'This is a scam that takes advantage of urgency to coerce victims. Legitimate employers use official procedures to handle the visa and never require immediate payment, either \n'
          'in the form of upfront costs or passport scans via telephone.',
    ),
    const Q(
        prompt:
            'You get a text message from an unknown number saying that it is Vivian of Seek. The advert is for an off-site job with AUD 150-300 a day pay for only 60-90 minutes of work. \n'
            'It is immediate pay, paid leave, and requests you to write YES if you are interested. What should you do?',
        options: [
          'Reply “YES” to apply immediately before the job is gone',
          'Reply “NO” to politely decline the offer',
          'Delete the message and block the sender',
          'Forward the text to a friend who might want the job'
        ],
        correctIndices: [2],
        explanation:
            ' It is a scam that promises compensation that is too good to be true, with minimal effort by an unknown party pretending to be Seek. Random yes/no texts are not employed by real recruiters.\n'
            'The safest thing to do is to block and delete the message.',
        assetImage: "./assets/Jobs/image13.png"),
    const Q(
      prompt:
          'You get an email that states that it is the HR department of a shipping company in the world. The email states: "We are in urgent need of administrative assistants who would work at home.\n'
          'No interview required. The rate will be \$450/day, 2 hours of easy work like answering emails. To secure your place, you must provide your full name, address, phone number, and a duplicate of your driver\'s license.\n'
          'After you provide us with the details, your contract will be sent to you at once.',
      options: [
        'Send your personal details to secure the job',
        'Ask for more information before sharing documents',
        'Report and delete the email',
        'Save the email in case you want to apply later'
      ],
      correctIndices: [2],
      explanation:
          'It is a fake company since no actual company can pay high without the process, and the authentic companies do not request personal ID documents via email.\n'
          'By giving such information, you are giving yourself exposure to identity theft.',
    ),
    const Q(
      prompt:
          'A recruiter reaches out to you on WhatsApp, stating that he is a hiring manager in a well-recognized financial institution. They are a remote customer service role that pays \$2000 a week and tells you that you can work immediately without training.\n'
          'They, however, describe that you must pay a processing fee of \$100 on PayPal to unlock your employee account before you can get your first paycheck',
      options: [
        'Pay the activation fee so you can start the job quickly',
        'Refuse and block the recruiter',
        'Negotiate with them to deduct the fee from your salary instead',
        'Share the opportunity with your friends'
      ],
      correctIndices: [1],
      explanation:
          'Any demand for advance payments is obviously a sham device. Official employers do not collect activation or training charges from the candidates.\n'
          'The excessive compensation with no qualifications is another warning.',
    ),
    const Q(
        prompt:
            'You are looking for a new job and have submitted your CV to several well-known job searching websites and agencies. You get this message, what are your thoughts?',
        options: [
          'This is a scam: too good to be true because of very high pay for little work, no clear job role, and strange requirements.',
          'This is not the case, because you are looking for a job and you have submitted your CV to several job searching websites and agencies.'
              'This is a scam: suspicious communication because it was sent from an unknown number, it asks for a quick yes or no, and it is not through the official company channel.',
          'This is not a scam: you are 23 years old, and this is a great deal.'
        ],
        correctIndices: [0, 2],
        assetImage: "./assets/Jobs/image14.png"),
    const Q(
        prompt: '“This is NOT a SCAM”.  Is this statement true or false?',
        options: ['True', 'False'],
        correctIndices: [1],
        explanation:
            'This is a scam. Real jobs do not offer high payments with the lack of work or the appearance in some random texts that require immediate responses',
        assetImage: "./assets/Jobs/image15.png"),
    const Q(
        prompt: 'What kind of a scam is this?',
        options: [
          'Money Mule scam - when the scammers use you to move stolen money through your account',
          'Responding scam - when you receive stolen goods and send them overseas',
          'Check Overpayment scam - scammers send a fake check, tell you to cash it, and ask you to send part of the money back.',
          'Work from home - easy money scam - when scammers promise high pay for simple tasks'
        ],
        correctIndices: [2],
        explanation:
            'Never trust a job that sends you a check and asks you to return part of the money. The check is fake, and you\'ll lose your own cash when it bounces',
        assetImage: "./assets/Jobs/image16.png"),
    const Q(
        prompt:
            'You are looking for a job, and you got this email. You identify red flags in this email. Some of them are?',
        options: [
          'Promises very high pay (\$500 for only 8 hours)',
          'Clearly stated job role with proper details',
          'Uses shortened URL',
          'Send by unknown sender'
        ],
        correctIndices: [
          0,
          2,
          3,
        ],
        explanation:
            'Very high pay, shortened links, and unknown senders are red flags. A clearly stated job role is not.',
        assetImage: "./assets/Jobs/image17.png"),
    const Q(
        prompt: 'You get this call, What is your next move?',
        options: [
          'Pay \$50'
              'Hang up the call and block the number',
          'Ask for more details',
          'Hang up the call and call them back'
        ],
        correctIndices: [2],
        explanation:
            'Real recruiters will never ask you to pay a registration fee. If someone calls and demands money to get a job, it\'s a scam. Hang up and block the number',
        assetImage: "./assets/Jobs/image18.png"),
    const Q(
        prompt:
            'You are a university student, and you get this email offering \$400 a week for a “Research Assistant” role. It looks like a big opportunity, but \n'
            'it asks you to send your personal details through the “Signal App". What will you do?',
        options: [
          'Reply, write away, and send the details',
          'Download and install the Signal app',
          'Stop and check with the university directly before doing anything.',
          'Ignore the red flags because the pay is good.'
        ],
        correctIndices: [2],
        explanation:
            'On such apps as WhatsApp or Signal, scammers can impersonate universities or professors. Always confirm the offers with the official university',
        assetImage: "./assets/Jobs/image19.png"),
    const Q(
        prompt: 'Is this not a scam?',
        options: ['True', 'False'],
        correctIndices: [1],
        explanation:
            'This statement is false because the message is a scam. It promises very high pay for very little work, comes from an unknown number, \n'
            'and pressures you to reply, “yes” or “no”. Real job offers don’t arrive this way.',
        assetImage: "./assets/Jobs/image20.png"),
    const Q(
        prompt: 'When you get this message, what will be your next move?',
        options: [
          'Task for more details.',
          'Type “YES”',
          'Delete and report',
          'Ignore the message'
        ],
        correctIndices: [2],
        explanation:
            'The safest move is to delete and report it. Simply ignoring is not enough - reporting helps stop the scam from reaching others',
        assetImage: "./assets/Jobs/image21.png"),
    const Q(
        prompt: 'You get a call, Is this a scam or not a scam?',
        options: ['This is a scam', 'This is not a scam'],
        correctIndices: [0],
        explanation:
            'This is a scam - real HR will never ask for your date of birth or bank details over the phone',
        assetImage: "./assets/Jobs/image22.png"),
    const Q(
        prompt:
            'Your partner shows this conversion to you, and you say that this is a good opportunity. But what are your thoughts?',
        options: [
          'This is a scam - delete it and report it.',
          'This is not a scam - ask for more details',
          'This is a scam - they send this to your partner',
          'This is a scam - the job description is very suspicious'
        ],
        correctIndices: [0, 3],
        explanation:
            'It is a scam that has an ambiguous job description and spam messages. The most secure thing to do is to delete and report it.',
        assetImage: "./assets/Jobs/image23.png"),
    const Q(
        prompt:
            'Your friend showed this conversation between him/her and a scammer. What are your thoughts about friend behavior?',
        options: [
          'A friend has identified this as a scam. That\'s a relief.',
          'Friend hasn\'t blocked the number yet, even though he/she knows this is a scam.',
          'Friend replied to the message, which is something that should be done.',
          'Friends know how scammers behave.'
        ],
        correctIndices: [0, 1, 3],
        explanation:
            'This is a scam, even if your friend knows it\'s fake, replying or not blocking the number is still risky. The safe step is to delete, block, and report.',
        assetImage: "./assets/Jobs/image24.png"),
    const Q(
        prompt: 'What are the red flags in this email?',
        options: [
          'Not addressing you by your real name.',
          'Professional tone with polite language',
          'Suspicious link.',
          'No full description of the job or job title.'
        ],
        correctIndices: [0, 2, 3],
        explanation:
            'Generic greeting, a suspicious link, and no job details are red flags. A polite tone is not.',
        assetImage: "./assets/Jobs/image25.png"),
    const Q(
        prompt:
            'Would you recommend this action that the message receiver has taken?',
        options: [
          'Yes, because they have identified this as a scam and have blocked the number',
          'No, this is a job interview, no need to block the number.'
        ],
        correctIndices: [0],
        explanation:
            'Blocking and reporting the number is the right step once you identify a scam. It stops more messages and keeps you safe.',
        assetImage: "./assets/Jobs/image26.png"),
    const Q(
        prompt:
            'Are you going to respond to this message because this will give you easy money?',
        options: ['Yes', 'No'],
        correctIndices: [1],
        explanation:
            'This is a money mule scam. Scammers ask you to move money from them, but it\'s stolen funds. You could lose money and even get into legal trouble',
        assetImage: "./assets/Jobs/image27.png"),
    const Q(
        prompt: 'You get a WhatsApp message , Why is this a scam? ',
        options: [
          'The message uses polite language.',
          'It pressures you to reply quickly.',
          'Real HR teams don\'t recruit through random WhatsApp messages.',
          'The pay is unrealistically high for a simple task.'
        ],
        correctIndices: [0],
        explanation:
            'Scams often promise big money for easy work, come from random contacts, and push you to act fast. Politeness doesn\'t make the message safe',
        assetImage: "./assets/Jobs/image28.png"),
  ],
};
