abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    "en_US": enUS,
    "hi": hi,
  };
}

final Map<String, String> enUS = {
  'language': 'English',
  'select': 'Please select your Language',
  'change': "You can change the language \n at any time",
  'selectm': 'Please enter your mobile number',
  'changem': 'You\'ll receive a 4 digit code \n to verify next',
  'verify': 'Verify Phone',
  'code': 'Code is sent to',
  'receive': 'Did\'t receive the code?'
};
final Map<String, String> hi = {
  'language': 'हिंदी',
  'select': 'कृपया अपनी भाषा चुनें',
  'change': "आप किसी भी समय \n भाषा बदल सकते हैं",
  'selectm': 'अपना मोबाइल नंबर दर्ज करें',
  'changem': 'अगली पुष्टि के लिए \n आपको 4 अंकों का कोड मिलेगा',
  'verify': 'फ़ोन सत्यापित करें',
  'code': 'कोड भेजा जाता है',
  'receive': 'कोड नहीं मिला?'
};
