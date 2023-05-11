final List<LanguageModel> languages = [
  LanguageModel("English", "en_US"),
  LanguageModel("हिंदी", "hi"),
];

class LanguageModel {
  LanguageModel(
    this.language,
    this.symbol,
  );

  String language;
  String symbol;
}
