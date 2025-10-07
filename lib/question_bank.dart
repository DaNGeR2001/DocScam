import 'package:flutter/foundation.dart';

@immutable
class Q {
  final String prompt;
  final List<String> options;

  /// Zero‑based indices of the correct answers.  Use a single‑element list
  /// for single‑answer questions and multiple elements for multi‑answer.
  final List<int> correctIndices;

  /// Optional explanation to show on the result/review page.
  final String? explanation;

  /// Provide either an asset path (preferred) or a network URL.  One of these
  /// may be null.
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


final Map<String, List<Q>> questionBank = {
  'Seasons': [
    // Tax
    const Q(
      prompt:
          'Email: “You are due money of \$750, click here and add bank details.”',
      options: [
        'Click the link and enter info.',
        'Delete and report as phishing.',
        'Reply with questions.',
      ],
      correctIndices: [1],
      explanation: 'Tax offices do not ask for banking info by email.',
    ),
    const Q(
      prompt:
          '“To receive a refund, they say you must pay \$50 processing fees.”',
      options: [
        'Pay soon to get the refund earlier.',
        'Refunds are free — no genuine agency charges fees.',
        'Negotiate a smaller fee.',
      ],
      correctIndices: [1],
      explanation: 'Genuine refunds don’t require fees.',
    ),
    const Q(
      prompt:
          '“Final notice: Your refund will be canceled. Update via this link.”',
      options: [
        'Click link.',
        'Check the official portal yourself and delete the message.',
        'Reply “STOP” to unsubscribe.',
      ],
      correctIndices: [1],
      explanation: 'Urgency/threats are red flags. Use official portals only.',
    ),
    const Q(
      prompt:
          'A site looks like the tax office, but the URL is “ato-refunds.net”. What should you do?',
      options: [
        'Log in to check your refunds.',
        'Use only the official .gov or .gov.au domain.',
        'Bookmark the link for later.',
      ],
      correctIndices: [1],
      explanation: 'Use only official government domains.',
    ),
    const Q(
      prompt:
          'You receive this SMS (ATO refund with a link). What would you do?',
      options: [
        'Forward to friends to warn them.',
        'Reply “STOP” to avoid these messages.',
        'Enter TFN and bank details to check if real.',
        'Report/block the sender.',
      ],
      correctIndices: [3],
      explanation:
          'Government departments won’t send refund links by SMS. Don’t interact; report/block and verify via official channels.',
      assetImage: './assets/Seasons/image29.png',
    ),
    const Q(
      prompt:
          'You get an “official” email that begins with “Dear customer,” not your name.',
      options: [
        'Be wary — generic greetings are a red flag.',
        'Trust it because it looks professional.',
        'Reply asking why they didn’t use your name.',
      ],
      correctIndices: [0],
      explanation:
          'Tax offices address you by your legal name; generic greetings are suspicious.',
      assetImage: './assets/Seasons/image30.png',
    ),
    const Q(
      prompt:
          'A “tax officer” calls and threatens arrest unless you pay taxes over the phone. Is this a scam?',
      options: ['Yes', 'No'],
      correctIndices: [0],
      explanation:
          'No tax authority will demand phone payments or threaten arrest.',
    ),
    const Q(
      prompt:
          'This SMS says HMRC owes you a tax rebate and includes a link. Is this real?',
      options: ['Yes', 'No'],
      correctIndices: [1], // fixed: this is not real
      explanation: 'HMRC does not send rebate links by SMS.',
      assetImage: './assets/Seasons/image32.png',
    ),
    const Q(
      prompt: 'What is the safest action here?',
      options: [
        'Call back immediately to settle your debt.',
        'Save the number and wait for more calls.',
        'Ignore and report the voicemail as a scam.',
        'Text back asking for proof.',
      ],
      correctIndices: [2], // fixed from 3
      explanation:
          'Ignore/report. Authorities use letters/official portals, not pressure voicemails.',
      assetImage: './assets/Seasons/image33.png',
    ),
    const Q(
      prompt: 'How can you tell this is a scam?',
      options: [
        'It uses a shortened bit.ly link.',
        'It provides an exact official domain.',
        'It asks you to log in via a secure government app.',
        'It offers a support hotline.',
      ],
      correctIndices: [0],
      explanation:
          'Shortened links are a red flag; governments use official domains.',
      assetImage: './assets/Seasons/image34.png',
    ),
    const Q(
      prompt: 'What’s the red flag in this email?',
      options: [
        'Request to open an attached refund form.',
        'Information about processing refunds.',
        'Use of “ATO” in the subject line.',
        'Mention of a 28-day processing period.',
      ],
      correctIndices: [0],
      explanation:
          'Attachments can hide malware/phishing. ATO directs you to its portal.',
      assetImage: './assets/Seasons/image35.png',
    ),
    const Q(
      prompt: 'Which clue shows this SMS is a scam?',
      options: [
        'The message offers a bonus.',
        'It’s linked to natural disasters.',
        'The URL contains “verification-digital.com,” not the real myGov site.',
        'It mentions tax return details.',
      ],
      correctIndices: [2],
      explanation:
          'Real myGov uses my.gov.au. Fake domains add extra words to trick you.',
      assetImage: './assets/Seasons/image36.png',
    ),
    const Q(
      prompt: 'What is the biggest red flag here?',
      options: [
        'The email urges immediate taxpayer verification.',
        'The sender domain is unrelated to IRAS.',
        'It includes the IRAS logo.',
        'It mentions the refund process.',
      ],
      correctIndices: [1],
      explanation:
          'Official emails come from .gov.sg. Logos can be copied; domains don’t lie.',
      assetImage: './assets/Seasons/image37.png',
    ),
    const Q(
      prompt: 'What makes this email suspicious?',
      options: [
        'It mentions registering for a refund program.',
        'It offers an unrealistic 19% refund from past taxes.',
        'It includes a receipt reminder.',
        'It uses the term “Cut Off Taxes Program.”',
      ],
      correctIndices: [1],
      explanation:
          'Unrealistic refunds are a huge red flag; ATO does not run such email programs.',
      assetImage: './assets/Seasons/image38.png',
    ),
    const Q(
      prompt:
          'SMS: “Your tax refund is ready. Click here to claim: http://refund-portal-tax.com/refund.” Is this genuine?',
      options: ['Yes', 'No'],
      correctIndices: [1],
      explanation:
          'Tax authorities don’t send refund links by SMS; fake sites steal data.',
    ),
    const Q(
      prompt:
          'Email: ‘Immediate Action Required: Tax Account Suspension’ unless you confirm via link in 24 hours. What should you do?',
      options: [
        'Click the link immediately to secure your account.',
        'Delete the email and report it as phishing.',
        'Reply with your tax file number for verification.',
        'Forward the email to friends to warn them.',
      ],
      correctIndices: [1],
      explanation:
          'Real agencies don’t threaten suspension by email or demand urgent action.',
    ),
    const Q(
      prompt: 'What signs show this is a scam?',
      options: [
        'Fake sender domain',
        'Urgent deadline',
        'No personalization (“Dear Customer”)',
        'Secure florist payment page',
      ],
      correctIndices: [0, 1, 2],
      explanation: 'Scammers use urgency, generic greetings, and fake domains.',
      assetImage: './assets/Seasons/image39.png',
    ),
    const Q(
      prompt: 'Is this offer legitimate?',
      options: ['Yes', 'No'],
      correctIndices: [0],
      explanation:
          'Official Qantas domain (qantas.com) and a realistic discount can be legitimate.',
      assetImage: './assets/Seasons/image40.png',
    ),
    const Q(
      prompt: 'What’s the biggest warning sign here?',
      options: [
        'Late delivery',
        'Asking for a credit card',
        'Message on WhatsApp',
        'Flowers are seasonal',
      ],
      correctIndices: [1],
      explanation:
          'Legit florists don’t ask for card info over WhatsApp; use official checkout pages.',
      assetImage: './assets/Seasons/image41.png',
    ),
    const Q(
      prompt:
          'Dating app chat: “I’d love to meet you. Can you send me \$100 for a Valentine’s train ticket?” Is this request safe?',
      options: ['Yes', 'No'],
      correctIndices: [1],
      explanation: 'Classic romance-scam pattern (travel money).',
    ),
    const Q(
      prompt: 'What are the scam signs?',
      options: [
        'Unrealistic discount',
        'Pressure to pay quickly',
        'Generic sender domain',
        'Linked to the official jeweler',
      ],
      correctIndices: [0, 1, 2],
      explanation: 'Unrealistic sales + urgency are common scam tells.',
      assetImage: './assets/Seasons/image42.png',
    ),
    const Q(
      prompt:
          'Someone professes strong feelings quickly and asks for \$400 for an “emergency” abroad.',
      options: [
        'Send the \$400 because it’s an emergency.',
        'Suggest a short video call first and refuse to send money.',
        'Give them your address so they can send proof.',
        'Block them immediately without checking.',
      ],
      correctIndices: [1],
      explanation:
          'Romance scams escalate to money asks. Verify via live video; never send funds.',
    ),
    const Q(
      prompt:
          'SMS: “Valentine Gift shipment \$5: http://val-fleurs.delivery.” The sender claims a delivery attempt and asks you to pay.',
      options: [
        'Click and pay \$5 to get the flowers.',
        'Reply asking who sent the flowers.',
        'Ignore/delete; check with the official florist directly.',
        'Share the link with friends to ask if it’s legit.',
      ],
      correctIndices: [2],
      explanation:
          '“Small shipping fee” lures are common; verify only via the official site.',
    ),
    const Q(
      prompt:
          'A Valentine’s “charity” asks for full card details and your driver’s licence on a sketchy page.',
      options: [
        'Donate immediately because it’s a worthy cause.',
        'Share the fundraiser on social media.',
        'Verify the charity via the official regulator; donate only via trusted platforms.',
        'Send money using a friend-to-friend app without checking.',
      ],
      correctIndices: [2],
      explanation:
          'Holiday-themed fake charities are common; verify and use trusted platforms.',
    ),
    const Q(
      prompt:
          'Extortion: “We have compromising Valentine’s photos. Pay via crypto or we publish.”',
      options: [
        'Pay immediately to stop them.',
        'Negotiate the fee down.',
        'Do not pay; preserve evidence, block, and report to police/platform.',
        'Reply asking what photos they have.',
      ],
      correctIndices: [2],
      explanation:
          'Paying rarely helps. Preserve evidence and report to authorities.',
    ),
    const Q(
      prompt:
          'A suspicious Valentine’s concert site pushes bank transfer for VIP tickets with a countdown.',
      options: [
        'Pay by bank transfer; it’s cheaper.',
        'Use a secure platform (card/PayPal) and verify on the venue’s official site.',
        'Message the seller your ID to speed things up.',
        'Buy multiple tickets to resell.',
      ],
      correctIndices: [1],
      explanation:
          'Prefer buyer protection (card/PayPal) and verify the event on official channels.',
    ),
    const Q(
      prompt:
          'Feb 13 SMS: “You have a Valentine’s delivery. Text back your full home address or order will be canceled.” No link.',
      options: [
        'Reply with your address so it’s on time.',
        'Ignore completely.',
        'Contact the delivery company via its official website.',
        'Forward to a family member to check if they ordered.',
      ],
      correctIndices: [2],
      explanation:
          'It’s social engineering to harvest addresses. Use only official channels.',
    ),
    const Q(
      prompt: 'Is this a real Valentine’s greeting or a scam?',
      options: ['Real', 'Scam'],
      correctIndices: [1],
      explanation:
          '“Secret admirer” lures are common. If you can’t confirm sender, delete.',
      assetImage: './assets/Seasons/image44.png',
    ),
    const Q(
      prompt:
          'Instagram DM “invite.” Which one is NOT a good reason to call it a scam?',
      options: [
        'The link looks fake and could steal your login.',
        'Instagram doesn’t send invites via random DMs.',
        'The message came late at night.',
        'The web address is not the official Instagram domain.',
      ],
      correctIndices: [2],
      explanation:
          'Time of day proves nothing. Fake links, random DMs, and unofficial domains are the real red flags.',
      assetImage: './assets/Seasons/image45.png',
    ),
    const Q(
      prompt:
          'Valentine’s Day call from a “phone provider” offering bonus data.',
      options: [
        'Real providers don’t ask for SIM details by phone.',
        '“Valentine’s bonus data” sounds unusual/fake.',
        'They pressure you to confirm “right now.”',
        'The caller used a polite greeting.',
      ],
      correctIndices: [0, 1, 2],
      explanation:
          'Hang up and call the official number. Politeness isn’t proof of legitimacy.',
      assetImage: './assets/Seasons/image46.png',
    ),

    // ... (For brevity, continue adding the remaining Seasons items the same way.)
  ],

  // ------------------------------------------------------------------------
  // DELIVERY
  // ------------------------------------------------------------------------
  'Delivery': [
    const Q(
      prompt:
          'Late-night SMS: “Amazon Logistics: verify card at http://amazon-billingfix.net in 6h or parcel is canceled.” What do you do?',
      options: [
        'Enter your card details.',
        'Ignore/delete SMS; check your Amazon account directly.',
        'Paste the link into a different browser to double-check.',
        'Reply asking for your order number.',
      ],
      correctIndices: [1],
      explanation:
          'Phishing via urgency. Amazon won’t ask billing updates by random SMS.',
    ),
    const Q(
      prompt:
          '“DHL Delivery Attempt Failed. Pay AUD 4.99 at http://dhl-parcelupdate.com within 24h.” Safest action?',
      options: [
        'Pay the AUD 4.99 fee immediately.',
        'Check the link on your computer.',
        'Delete the message and verify on DHL’s official site/app.',
        'Reply asking for the tracking number.',
      ],
      correctIndices: [2],
      explanation:
          'Counterfeit URLs steal info. Verify only on official sites.',
    ),
    const Q(
      prompt:
          'If you clicked a scam link accidentally, what should you NOT do?',
      options: [
        'Ignore the whole incident.',
        'Act quickly and change passwords.',
        'Monitor bank/email accounts.',
        'Report the incident to authorities.',
      ],
      correctIndices: [0],
      explanation:
          'Don’t ignore it. Change passwords, monitor, and report promptly.',
    ),
    const Q(
      prompt:
          'Regarding delivery-issue emails/messages, which is NOT a safe step?',
      options: [
        'Contact the official number of the delivery service.',
        'Delete and report the message.',
        'Reply or call the number in the message and follow instructions.',
        'Enable 2FA on your accounts.',
      ],
      correctIndices: [2],
      explanation:
          'Never use the contacts in a suspicious message; use official channels.',
    ),
    const Q(
      prompt:
          '“RoyalMail Delivery: confirm info & pay £2.50 at http://royalmail-redeliv.xyz within 8h. Reply Y to activate.” What should you do?',
      options: [
        'Reply Y, open link, and pay.',
        'Copy link to desktop and check the certificate.',
        'Delete, block, and check your Royal Mail account or official site/app.',
        'Reply asking for tracking and sender details.',
      ],
      correctIndices: [2],
      explanation:
          'Typical phishing: urgency + tiny fee + fake domain. Verify officially.',
    ),
    const Q(
      prompt:
          'Unknown number: “Update your delivery location in 12 hours: http://inlepoizl.shop.” What should you do?',
      options: [
        'Click quickly to avoid losing the parcel.',
        'Call the number to confirm.',
        'Ignore and delete; do not click.',
        'Test the link in another browser.',
      ],
      correctIndices: [2],
      explanation: 'Legit couriers use their site/app — not random SMS links.',
      assetImage: './assets/Delivery/image138.png',
    ),
    const Q(
      prompt:
          '“FedEx: customs clearance AUD 2.99: http://fedex-clearance.top/parcel.” What should you do?',
      options: [
        'Pay the small fee.',
        'Ignore/delete; don’t click.',
        'Copy link into a browser to confirm.',
        'Ask for delivery proof.',
      ],
      correctIndices: [1],
      explanation: 'Small-fee lures are common; fake links harvest cards.',
    ),
    const Q(
      prompt:
          '“AusPost: invalid postal code. Reply Y and use (https://auspostoiiza.shop/au) within 24h.” What should you do?',
      options: [
        'Click and enter your postal code.',
        'Reply “Y” to activate the link.',
        'Ignore/delete and check status via the official AusPost website/app.',
        'Copy the link to another browser to test.',
      ],
      correctIndices: [2],
      explanation:
          'Urgency + fake domain = phishing. Verify only on official sites.',
      assetImage: './assets/Delivery/image139.png',
    ),
    const Q(
      prompt:
          '“Amazon Delivery: wrong billing address. Check at amazon-parcelverify.shop.” What should you do?',
      options: [
        'Enter billing details at the link.',
        'Ignore/delete; check order status in your Amazon account.',
        'Reply asking for your order number.',
        'Forward the link to a friend to test safely.',
      ],
      correctIndices: [1],
      explanation: 'Fake Amazon domains steal payment info.',
    ),
    const Q(
      prompt:
          'Multiple texts claim “CA FasTrak balance \$3.67” with a link and a threat of \$49.67 late fee.',
      options: [
        'Pay \$3.67 immediately.',
        'Copy link to your browser to check.',
        'Delete and verify only on the official FasTrak site/app.',
        'Reply asking for more details.',
      ],
      correctIndices: [2],
      explanation:
          'Tiny fee + urgency = classic lure. Verify on the official site/app.',
      assetImage: './assets/Delivery/image140.png',
    ),
    const Q(
      prompt:
          'USPS text: “Incomplete address; update within 24h at https://usps.uspxstp.com/ipsps.”',
      options: [
        'Click link and update your address.',
        'Reply “Y” to activate the link.',
        'Delete and check updates only on the official USPS site/app.',
        'Test the link in a safe browser first.',
      ],
      correctIndices: [2],
      explanation:
          'Fake tracking + urgency. Use only the official USPS site/app.',
      assetImage: './assets/Delivery/image141.png',
    ),
    const Q(
      prompt:
          '“Evri Customer Service: address missing/damaged. Reply Y and fix via this link.” Safest response?',
      options: [
        'Reply “Y” and update via the link.',
        'Copy the link to confirm first.',
        'Delete the message and check only on Evri’s official site/app.',
        'Ask a friend if they got similar.',
      ],
      correctIndices: [2],
      explanation:
          'Scammers mimic tracking pages; verify only via official channels.',
      assetImage: './assets/Delivery/image142.png',
    ),
    const Q(
      prompt:
          'A “tracking page” with spelling errors and a red “Schedule Your Delivery” button is on a non-official domain.',
      options: [
        'Ignore typos and click “Schedule Your Delivery.”',
        'Close it and log in to the courier’s official site/app to check.',
        'Enter personal details but avoid payment info.',
        'Share with a friend to ask if legit.',
      ],
      correctIndices: [1],
      explanation:
          'Typos + wrong domain = phishing. Use the official site/app.',
      assetImage: './assets/Delivery/image143.png',
    ),
    const Q(
      prompt:
          '“Australia Post: invalid postal code — fix in 24h at https://aupost-todoors.top/Aupost. Reply Y to activate.”',
      options: [
        'Reply Y and update via the link.',
        'Open the link to see if it looks official.',
        'Delete and check only via the official Australia Post site/app.',
        'Ask a friend if they got similar.',
      ],
      correctIndices: [2],
      explanation: 'Bogus domain + urgency. Verify on the official site/app.',
      assetImage: './assets/Delivery/image144.png',
    ),
    const Q(
      prompt:
          '“Australia Post: invalid postal code. https://auspost-com-a□.win/au Reply Y to activate.” What should you do?',
      options: [
        'Reply Y and update quickly.',
        'Report as spam/phishing via carrier or Scamwatch and delete.',
        'Copy link into another browser to check.',
        'Share the message with a friend.',
      ],
      correctIndices: [1],
      explanation: 'Report/delete. Don’t click strange domains.',
      assetImage: './assets/Delivery/image145.png',
    ),
    const Q(
      prompt:
          'Email “DHL Express: pay AUD \$2.99 unpaid shipping charges or return in 48h.” What should you do?',
      options: [
        'Pay \$2.99 through the link.',
        'Report as phishing/spam via your email provider.',
        'Forward to a friend to see if genuine.',
        'Click link but enter only name/address.',
      ],
      correctIndices: [1],
      explanation: 'Low-fee lures with fake branding — report and delete.',
      assetImage: './assets/Delivery/image146.png',
    ),
    const Q(
      prompt:
          '“High-volume scam via RCS.” What is the objective of this message?',
      options: [
        'To complete the address and send the package.',
        'To steal personal and card details.',
        'To stop future delays.',
        'To arrange a new delivery time.',
      ],
      correctIndices: [1],
      explanation:
          'The “delivery problem” is bait to phish personal/payment data.',
      assetImage: './assets/Delivery/image147.png',
    ),
    const Q(
      prompt:
          'You receive this message while waiting for a parcel. Next moves?',
      options: [
        'Panic and fill the form.',
        'Read carefully and identify red flags.',
        'Delete the message.',
        'Report the message to Apple/Google.',
      ],
      correctIndices: [1, 2, 3],
      explanation:
          'Stay calm, spot red flags, delete and report to help others.',
      assetImage: './assets/Delivery/image148.png',
    ),
    const Q(
      prompt: 'What is the right decision?',
      options: [
        'Click the link — avoid extra fees.',
        'Don’t click — you can collect it.',
        'Click to see parcel details.',
        'Don’t click — the link looks suspicious.',
      ],
      correctIndices: [3],
      explanation:
          'If it looks suspicious, don’t click. Use official channels.',
      assetImage: './assets/Delivery/image149.png',
    ),
    const Q(
      prompt: 'What are the red flags in this message?',
      options: [
        'The rush (within 24 hours).',
        'Unofficial link.',
        'Strange instructions.',
        'Asking for sensitive details.',
      ],
      correctIndices: [0, 1, 2, 3],
      explanation:
          'Urgency, odd asks, and fake links are classic phishing signs.',
      assetImage: './assets/Delivery/image150.png',
    ),
    const Q(
      prompt:
          'Delivery scams don’t only come by text. What other ways are common?',
      options: [
        'Email',
        'Calls',
        'Post',
        'Door to door',
      ],
      correctIndices: [0, 1],
      explanation:
          'Email and phone are most common besides SMS. Always verify.',
    ),
    const Q(
      prompt: 'Common red flags in a scam email?',
      options: [
        'Poor format and grammar.',
        'Sense of urgency.',
        'Mismatched email address.',
        'Fake logos/images to look real.',
      ],
      correctIndices: [0, 1, 2, 3],
      explanation: 'These indicators often appear together in phishing emails.',
    ),
    const Q(
      prompt: 'Your mom shows this email. First move?',
      options: [
        'Delete and report.',
        'Ask her to click the link.',
        'Reply to the email.',
        'Copy/paste the link into a browser.',
      ],
      correctIndices: [0],
      explanation: 'Don’t click, reply, or paste. Delete and report.',
      assetImage: './assets/Delivery/image151.png',
    ),
    const Q(
      prompt: 'What is your next step?',
      options: [
        'Click the link.',
        'Delete the message.',
        'Reply to the message.',
        'Call the number.',
      ],
      correctIndices: [1],
      explanation:
          'Delete. Don’t click, reply, or call numbers in the message.',
      assetImage: './assets/Delivery/image152.png',
    ),
    const Q(
      prompt: 'What are the red flags in this email?',
      options: [
        'Asking for a fee.',
        'Urgency.',
        'Trick to harvest details.',
        'Has failed delivery details.',
      ],
      correctIndices: [0, 1, 2],
      explanation: 'They often fabricate “failed delivery” to seem legit.',
      assetImage: './assets/Delivery/image153.png',
    ),
    const Q(
      prompt: 'Inbox “restore” email — what’s the correct response?',
      options: [
        'Click to fix your inbox.',
        'Delete without clicking any links.',
        'Reply and ask for clarification.',
        'Forward to friends for awareness.',
      ],
      correctIndices: [1],
      explanation: 'Legit services don’t use fear to force clicks. Delete it.',
      assetImage: './assets/Delivery/image154.png',
    ),
    const Q(
      prompt: 'Which red flag shows this is a scam?',
      options: [
        'The message demands a small payment fee.',
        'It mentions Royal Mail by name.',
        'It talks about a package delivery.',
        'It includes a shipping charge.',
      ],
      correctIndices: [0],
      explanation: 'Low-fee urgency is a common phishing tactic.',
      assetImage: './assets/Delivery/image155.png',
    ),
    const Q(
      prompt: 'How can you spot this scam?',
      options: [
        'It politely apologizes.',
        'It provides a suspicious reschedule link.',
        'It mentions package return.',
        'It talks about a delivery driver.',
      ],
      correctIndices: [1],
      explanation:
          'The fake link is the tell; real couriers use their app/site.',
      assetImage: './assets/Delivery/image156.png',
    ),
    const Q(
      prompt:
          '“We tried to deliver your parcel… confirm details at the link below. Use Safari.” Next step?',
      options: [
        'Click the link and enter details.',
        'Ignore or delete the message.',
        'Call the number.',
        'Ask for more details.',
      ],
      correctIndices: [1],
      explanation: 'Check your official courier app/site instead.',
    ),
    const Q(
      prompt: 'You get this email. What is your next move?',
      options: [
        'Click and pay immediately.',
        'Reply for more information.',
        'Delete or mark as phishing.',
        'Forward to friends to check if they got it.',
      ],
      correctIndices: [2],
      explanation:
          'Fees should be handled via official sites, not random emails.',
      assetImage: './assets/Delivery/image159.png',
    ),
    const Q(
      prompt:
          'You recently sent a gift; now you get a “free delivery voucher” email asking for your email password.',
      options: [
        'Fill the survey with your password.',
        'Delete and ignore.',
        'Reply asking if the offer is real.',
        'Forward it to friends.',
      ],
      correctIndices: [1],
      explanation:
          'Timing + fake reward is a trap. Never share email passwords.',
      assetImage: './assets/Delivery/image160.png',
    ),
    const Q(
      prompt: 'Subject: “Delivery Notice Attached (PDF).” What should you do?',
      options: [
        'Open the PDF immediately.',
        'Delete without opening the file.',
        'Reply asking for a tracking number.',
        'Save the file for later.',
      ],
      correctIndices: [2],
      explanation:
          'Real couriers provide a tracking link on their official site, not random attachments.',
      assetImage: './assets/Delivery/image161.png',
    ),
    const Q(
      prompt: 'What is the safest thing to do?',
      options: [
        'Reply to activate the link.',
        'Ignore and delete the message.',
        'Copy the link into your browser to check.',
      ],
      correctIndices: [1],
      explanation:
          'Combos of fake links, deadlines, and odd instructions = phishing.',
      assetImage: './assets/Delivery/image162.png',
    ),
    const Q(
      prompt: 'A friend asks “why delete this?” Choose valid reasons.',
      options: [
        'Deleting it will automatically reschedule delivery.',
        'Button likely leads to a phishing page.',
        'Generic greeting (“Dear User”) instead of your name.',
        'Fake/unavailable tracking number.',
      ],
      correctIndices: [1, 2, 3],
      explanation:
          'Phishing buttons, generic greetings, and bogus tracking are red flags.',
      assetImage: './assets/Delivery/image163.png',
    ),
    const Q(
      prompt:
          '“This is DHL. Package on hold at customs. Provide DoB and credit card to release.” Why is this a scam?',
      options: [
        'They say they’re from DHL and are polite.',
        'Parcel being held and genuine DHL contact.',
        'Asking for credit card and date of birth.',
        'Urgency to pay fee and polite language.',
      ],
      correctIndices: [2],
      explanation:
          'Legit couriers won’t ask for card details/DoB via call/text.',
    ),
    const Q(
      prompt:
          'WhatsApp: “AusPost VIP Group — verify at http://auspost-vip-check.net.” Why is this a scam?',
      options: [
        'AusPost doesn’t use WhatsApp groups.',
        'Link isn’t the official AusPost domain.',
        'Fake VIP status to trick users.',
        'Group invite proves it’s real.',
      ],
      correctIndices: [0, 1, 2],
      explanation: 'Anyone can create WhatsApp groups.',
    ),
    const Q(
      prompt: 'Why is this email legitimate?',
      options: [
        'Sent from official domain.',
        'Uses your real name.',
        'Valid tracking ID that works on AusPost site.',
        'Doesn’t ask for payment or personal info via link.',
      ],
      correctIndices: [0, 1, 2, 3],
      assetImage: './assets/Delivery/image164.png',
    ),
    const Q(
      prompt: 'Do you want to reschedule this package?',
      options: ['Yes', 'No'],
      correctIndices: [1],
      explanation:
          'Always reschedule via the courier’s official site/app, not random links.',
      assetImage: './assets/Delivery/image123.png',
    ),
    const Q(
      prompt: 'Is this a scam message?',
      options: ['Yes', 'No'],
      correctIndices: [0],
      explanation: 'Non-official links that ask for personal details = scam.',
      assetImage: './assets/Delivery/image125.png',
    ),
    const Q(
      prompt: 'SMS with a “tracking code” and a shortened link. Is this safe?',
      options: ['Yes', 'No'],
      correctIndices: [1],
      explanation:
          'Shortened links hide destinations; random codes are often fake.',
      assetImage: './assets/Delivery/image137.png',
    ),
    const Q(
      prompt:
          'Email with a “Sign in” button to reconfirm address; page keeps saying password incorrect.',
      options: ['Phishing', 'Legitimate'],
      correctIndices: [0],
      explanation:
          'Credential-harvesting login pages often loop “incorrect password.”',
      assetImage: './assets/Delivery/image126.png',
    ),
    const Q(
      prompt:
          'Courier calls from an unknown number asking for your card details. OK?',
      options: ['A scam', 'Legitimate'],
      correctIndices: [0],
      explanation: 'Legit couriers won’t ask for card details by phone.',
      assetImage: './assets/Delivery/image128.png',
    ),
    const Q(
      prompt:
          'SMS: “Package couldn’t be delivered — check status” with a sketchy link. Safe?',
      options: ['Yes', 'No'],
      correctIndices: [1],
      explanation:
          'Couriers don’t use generic links; use official domains/apps.',
      assetImage: './assets/Delivery/image135.png',
    ),
    const Q(
      prompt:
          '“Delivery delayed — click urgently to update preferences.” Safe?',
      options: ['Yes', 'No'],
      correctIndices: [1],
      explanation: 'Threats/urgency + odd links = phishing.',
      assetImage: './assets/Delivery/image157.png',
    ),
    const Q(
      prompt: 'Email “DHL: pay \$1.99 to release your package.” Safe?',
      options: ['Yes', 'No'],
      correctIndices: [1],
      explanation:
          'Tiny-fee tricks are common; use official portals/invoices only.',
      assetImage: './assets/Delivery/image158.png',
    ),
    const Q(
      prompt:
          '“Customs hold — pay \$15 now (http://customs-clearance-fee.org).” Is this a scam?',
      options: ['Yes', 'No'],
      correctIndices: [0],
      explanation: 'Customs/couriers won’t demand payments via random links.',
    ),
    const Q(
      prompt:
          '“Congrats! Free express delivery for 6 months — claim at fasttrack-freepromo.co.” Is this a scam?',
      options: ['Yes', 'No'],
      correctIndices: [0],
      explanation: 'Fake rewards funnel to phishing pages.',
    ),
  ],

  // ------------------------------------------------------------------------
  // JOB OFFERS
  // ------------------------------------------------------------------------
  'Job Offers': [
    const Q(
      prompt:
          'You get a high-pay job message (see image). What will you send back?',
      options: ['YES', 'NO', 'Ignore/report the message'],
      correctIndices: [2],
      explanation:
          'If pay sounds too good to be true, it probably is. Research first.',
      assetImage: './assets/Jobs/image01.png',
    ),
    const Q(
      prompt:
          '“This is your manager. Buy 500 gift cards and email the codes.” Best action?',
      options: [
        'Buy them or lose your job.',
        'Reply requesting a gift card.',
        'Call your manager on the official number.',
        'Share this message with colleagues.',
      ],
      correctIndices: [2],
      explanation:
          'Always verify via official channels. Gift-card requests = classic scam.',
    ),
    const Q(
      prompt:
          '“Congratulations! You won 1000 vouchers for hard work! Click to claim.” What do you do?',
      options: [
        'Click to view the prize.',
        'Report/block the number.',
        'Enter info to check if it’s real.',
      ],
      correctIndices: [1],
      explanation: 'Surprise prizes via links are usually phishing or malware.',
    ),
    const Q(
      prompt:
          'Sneaker site offers 80% off; bank transfer only. What do you do?',
      options: [
        'Buy before it sells out.',
        'Ask support about PayPal.',
        'Check reviews and payment safety, then decide.',
        'Trust it because it’s on social media.',
      ],
      correctIndices: [3],
      explanation:
          '“Bank transfer only” is a red flag. Prefer buyer-protected methods.',
    ),
    const Q(
      prompt:
          'LinkedIn DM: “Google urgently hiring. No interview. Send ID and bank details.” Best response?',
      options: [
        'Send your ID.',
        'Ask for an official job-posting link.',
        'Ignore — too much effort.',
        'Give partial bank details to test.',
      ],
      correctIndices: [1],
      explanation:
          'Big companies interview and don’t ask for bank info over DM.',
    ),
    const Q(
      prompt:
          'Remote assistant: “We’ll mail you a \$2000 cheque. Deposit it, keep salary, send the rest.”',
      options: [
        'Deposit and follow instructions.',
        'Refuse and block.',
        'Ask for a smaller payment to test.',
        'Send money then follow up with bank.',
      ],
      correctIndices: [1],
      explanation: 'Classic fake-cheque overpayment scam.',
    ),
    const Q(
      prompt:
          'Paid internship requires you to buy a \$250 software license first. Normal?',
      options: ['Yes', 'No'],
      correctIndices: [1],
      explanation: 'Legit roles provide required software/equipment.',
    ),
    const Q(
      prompt:
          'They ask for an “application/training fee” to get a job. This is a(n)…',
      options: ['Job offer scam', 'Advance-fee scam'],
      correctIndices: [1],
      explanation: 'Upfront fees for jobs are a hallmark of advance-fee scams.',
    ),
    const Q(
      prompt: 'Is this email genuine?',
      options: ['Yes', 'No'],
      correctIndices: [1],
      explanation:
          'Google uses @google.com; mismatched domains + bank info = scam.',
      assetImage: './assets/Jobs/image02.png',
    ),
    const Q(
      prompt:
          '“You’ve been selected for a part-time job. To start, pay a \$50 training fee.” Biggest red flag?',
      options: [
        'The offer came via social media.',
        'Asking for a training fee.',
        'The job is part-time.',
        'The message is friendly.',
      ],
      correctIndices: [1],
      explanation: 'Real jobs don’t charge to start.',
    ),
    const Q(
      prompt: 'What are the red flags?',
      options: [
        'Requesting ID copy.',
        'Requesting a photo of your credit card.',
        'Offering a job without interview.',
        'Contacting on WhatsApp.',
      ],
      correctIndices: [0, 1, 2],
      explanation: 'No employer needs card photos; interviews are standard.',
      assetImage: './assets/Jobs/image03.png',
    ),
    const Q(
      prompt: 'Is this email genuine?',
      options: ['Yes', 'No'],
      correctIndices: [1],
      explanation: 'Use official domains and verified career portals.',
      assetImage: './assets/Jobs/image04.png',
    ),
    const Q(
      prompt: 'Is this a legitimate Unilever domain?',
      options: ['Yes', 'No'],
      correctIndices: [1],
      explanation: 'Watch for extra words/typos — use @unilever.com.',
      assetImage: './assets/Jobs/image05.png',
    ),
    const Q(
      prompt: 'Signs of a genuine recruiter?',
      options: [
        'Verified LinkedIn recruiter badge.',
        'Provides official careers page.',
        'Requests personal bank info.',
        'Pressures immediate action.',
      ],
      correctIndices: [0, 1],
      explanation:
          'Verified profiles + official portals; no sensitive data via DM.',
      assetImage: './assets/Jobs/image06.png',
    ),
    const Q(
      prompt: 'Which parts are suspicious?',
      options: [
        'Asking for a credit card.',
        'Very high weekly salary.',
        'Mystery shopper jobs are real.',
        'No interview or screening.',
      ],
      correctIndices: [0, 1, 3],
      explanation: 'Legit companies pay via payroll, not card photos.',
      assetImage: './assets/Jobs/image07.png',
    ),
    const Q(
      prompt: 'Most dangerous red flag?',
      options: [
        'Hired without interview.',
        'Contact arrives via LinkedIn.',
        'Microsoft is a big company.',
        'Message looks professional.',
      ],
      correctIndices: [0],
      explanation:
          'No major company hires without interviews/background checks.',
      assetImage: './assets/Jobs/image08.png',
    ),
    const Q(
      prompt:
          'Random SMS claims “Indeed/SEEK/Jora” with \$150–\$300/day for 60–90 mins. Reply YES?',
      options: ['Yes', 'No', 'Ignore/delete and block', 'Share with friends'],
      correctIndices: [2],
      explanation: 'Unrealistic pay + random SMS = scam. Don’t reply.',
      assetImage: './assets/Jobs/image09.png',
    ),
    const Q(
      prompt:
          'LinkedIn “recruiter” offers \$3,000/week data entry + PDF “Job Contract” asking for ID and bank details.',
      options: [
        'Fill the form and send immediately.',
        'Ask for official company email.',
        'Do not open/share details; block.',
        'Share with classmates to check.',
      ],
      correctIndices: [2],
      explanation:
          'Identity theft risk. Legit recruiters won’t ask for ID/bank via DM PDFs.',
    ),
    const Q(
      prompt:
          'Unknown number says “Hotjar remote job: \$70–\$300/hr for 60–90 mins; reply yes/no.”',
      options: [
        'Reply “yes.”',
        'Reply “no.”',
        'Ignore, delete, and block.',
        'Share with friends.',
      ],
      correctIndices: [2],
      explanation: 'Hotjar won’t recruit this way; this is a lure.',
      assetImage: './assets/Jobs/image12.png',
    ),
    const Q(
      prompt:
          'Recruiter from a “reputable bank” emailing from Gmail asks for CV and bank statement.',
      options: [
        'Send CV/details now.',
        'Ask for more information.',
        'Delete and do not respond.',
        'Visit the Gmail account to check if real.',
      ],
      correctIndices: [2],
      explanation:
          'Official hiring uses company domains; never send bank statements.',
    ),
    const Q(
      prompt:
          '“Urgently hiring — start tomorrow! \$400/day for 2 hours. No interview. Pay \$75 application fee.”',
      options: [
        'Pay the fee quickly.',
        'Ignore and delete the email.',
        'Ask for a refund guarantee.',
        'Forward to classmates.',
      ],
      correctIndices: [1],
      explanation: 'Upfront “application/training” fees = scam.',
    ),
    const Q(
      prompt:
          'LinkedIn message links to a Google Form asking for name, address, phone, and bank account for first paycheck.',
      options: [
        'Fill the form to get started.',
        'Report and block the sender.',
        'Ask to email the details instead.',
        'Save link for later.',
      ],
      correctIndices: [1],
      explanation: 'Never give bank info through random forms.',
    ),
    const Q(
      prompt:
          'Phone call: luxury hotel chain offers overseas role with free housing; send passport scan + \$200 visa fee within 24h.',
      options: [
        'Send documents/money immediately.',
        'Decline and hang up.',
        'Ask to pay later after arrival.',
        'Share the number with a friend.',
      ],
      correctIndices: [1],
      explanation:
          'Legit employers handle visas formally; no upfront fees by phone.',
    ),
    const Q(
      prompt:
          '“Vivian from Seek” SMS: AUD 150–300/day for 60–90 mins; paid leave; reply YES.',
      options: [
        'Reply “YES.”',
        'Reply “NO.”',
        'Delete and block.',
        'Forward to a friend.',
      ],
      correctIndices: [2],
      explanation: 'Unrealistic + random SMS = scam. Don’t engage.',
      assetImage: './assets/Jobs/image13.png',
    ),
    const Q(
      prompt:
          'Email: global shipping firm “urgent admin assistants, \$450/day for 2 hours, no interview.” Send full name, address, phone, driver’s licence.',
      options: [
        'Send personal details.',
        'Ask for more info first.',
        'Report and delete.',
        'Save for later.',
      ],
      correctIndices: [2],
      explanation: 'High pay + no process + ID request = identity theft risk.',
    ),
    const Q(
      prompt:
          'WhatsApp recruiter from a “top bank” offers \$2000/week; pay \$100 to unlock your employee account.',
      options: [
        'Pay the activation fee.',
        'Refuse and block.',
        'Ask them to deduct from salary.',
        'Share with friends.',
      ],
      correctIndices: [1],
      explanation: 'Upfront fees are a dead giveaway.',
    ),
    const Q(
      prompt:
          'You’re job hunting; random message offers extremely high pay for little work, with strange requirements.',
      options: [
        'Scam: too good to be true.',
        'Not a scam: you’re job hunting anyway.',
        'Scam: unknown number, quick yes/no, not official channel.',
        'Not a scam: great deal for 23-year-olds.',
      ],
      correctIndices: [0, 2],
      assetImage: './assets/Jobs/image14.png',
    ),
    const Q(
      prompt: '“This is NOT a SCAM.” True or false?',
      options: ['True', 'False'],
      correctIndices: [1],
      explanation: 'High pay + little work + hurry response = scam.',
      assetImage: './assets/Jobs/image15.png',
    ),
    const Q(
      prompt:
          'What kind of scam is this: fake cheque, cash it, send some back?',
      options: [
        'Money mule scam',
        'Reshipping scam',
        'Cheque overpayment scam',
        'Work-from-home easy money',
      ],
      correctIndices: [2],
      explanation: 'Cheque will bounce; you eat the loss.',
      assetImage: './assets/Jobs/image16.png',
    ),
    const Q(
      prompt: 'Red flags in this email?',
      options: [
        'Very high pay (\$500 for only 8 hours).',
        'No experience for Personal Assistant.',
        'Shortened URL.',
        'Unknown sender.',
      ],
      correctIndices: [0, 1, 2, 3],
      explanation: 'Random links + unrealistic terms = scam.',
      assetImage: './assets/Jobs/image17.png',
    ),
    const Q(
      prompt: 'You get this call. Next move?',
      options: [
        'Pay \$50.',
        'Hang up and block the number.',
        'Ask for more details.',
        'Hang up and call them back.',
      ],
      correctIndices: [1],
      explanation: '“Registration fees” for jobs are scams.',
      assetImage: './assets/Jobs/image18.png',
    ),
    const Q(
      prompt:
          'University email offering \$400/week “Research Assistant”, but asks to move to Signal app.',
      options: [
        'Reply and send details.',
        'Install Signal.',
        'Stop and check with the university directly.',
        'Ignore red flags because pay is good.',
      ],
      correctIndices: [2],
      explanation: 'Confirm via official university channels.',
      assetImage: './assets/Jobs/image19.png',
    ),
    const Q(
      prompt: '“Is this not a scam?”',
      options: ['True', 'False'],
      correctIndices: [1],
      explanation: 'It *is* a scam; don’t reply “yes/no” to unknown numbers.',
      assetImage: './assets/Jobs/image20.png',
    ),
    const Q(
      prompt: 'When you get this message, what’s your next move?',
      options: [
        'Ask for more details.',
        'Type “YES.”',
        'Delete and report.',
        'Ignore the message.',
      ],
      correctIndices: [2],
      explanation: 'Report to help stop the scam for others.',
      assetImage: './assets/Jobs/image21.png',
    ),
    const Q(
      prompt: 'You get a call — scam or not?',
      options: ['This is a scam', 'This is not a scam'],
      correctIndices: [0],
      explanation: 'Real HR won’t ask DOB/bank details by phone.',
      assetImage: './assets/Jobs/image22.png',
    ),
    const Q(
      prompt: 'Partner shows a vague job “opportunity” message. Your thoughts?',
      options: [
        'Scam — delete/report.',
        'Not a scam — ask for more details.',
        'Scam — they sent it to your partner.',
        'Scam — job description is suspicious.',
      ],
      correctIndices: [0, 3],
      explanation: 'Ambiguous job + spammy outreach = scam.',
      assetImage: './assets/Jobs/image23.png',
    ),
    const Q(
      prompt: 'Friend chatted with a scammer. Thoughts on friend behavior?',
      options: [
        'Good: identified as scam.',
        'Hasn’t blocked the number yet.',
        'Replied — risky behavior.',
        'Understands scam patterns.',
      ],
      correctIndices: [0, 1, 2, 3],
      explanation: 'Best practice: delete, block, and report.',
      assetImage: './assets/Jobs/image24.png',
    ),
    const Q(
      prompt: 'What are red flags in this email?',
      options: [
        'Doesn’t address you by your real name.',
        'Asks for passport and bank details.',
        'Suspicious link.',
        'No clear job title/description.',
      ],
      correctIndices: [0, 1, 2, 3],
      explanation:
          'Legit employers don’t ask for sensitive docs via random email.',
      assetImage: './assets/Jobs/image25.png',
    ),
    const Q(
      prompt: 'Would you recommend the receiver’s action (blocking)?',
      options: [
        'Yes — identified as a scam and blocked.',
        'No — it’s just an interview; no need to block.',
      ],
      correctIndices: [0],
      explanation: 'Blocking/reporting stops further contact.',
      assetImage: './assets/Jobs/image26.png',
    ),
    const Q(
      prompt: 'Will you respond because this gives you “easy money”?',
      options: ['Yes', 'No'],
      correctIndices: [1],
      explanation: 'Likely a money mule scheme — legal risk.',
      assetImage: './assets/Jobs/image27.png',
    ),
    const Q(
      prompt: 'WhatsApp job message — why is it a scam?',
      options: [
        'The message uses polite language.',
        'It pressures quick replies.',
        'Real HR doesn’t recruit via random WhatsApp.',
        'Pay is unrealistically high for simple tasks.',
      ],
      correctIndices: [1, 2, 3],
      explanation:
          'Polite tone is irrelevant; pressure and unrealistic pay are red flags.',
      assetImage: './assets/Jobs/image28.png',
    ),
  ],
};
