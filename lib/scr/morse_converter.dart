library custom_morse;

import 'morse_brain.dart';

/// add some more info
/// `INTERNATIONAL MORSE TRANSLATION FORMAT`
/// (enhanced version to support `capitalizaion` and proper `spacing`)
///
/// Information regarding morse translation:
///
/// * First two characters for checking `capitalization`
/// * Next for checking the `alphabet`
/// * Then `word/letter separator`
///
/// * `"/"` word or character separator
/// * `" "` letter separator
///
/// `"--"` small
/// `".."` capital
///
class Morse {
  int textLength;
  int morseLength;
  String text;
  String morse;

  Morse({
    this.textLength,
    this.morseLength,
    this.text,
    this.morse,
  });

  factory Morse.fromString(String normalText) {
    if (normalText == null) throw ArgumentError();
    int length = normalText.length;
    String finalString = '';

    List<String> words = normalText.split(' ');

    for (int k = 0; k < words.length; k++) {
      String eachWord = words[k];
      List<String> letters = eachWord.split('');
      String morseWord = '';

      for (int i = 0; i < letters.length; i++) {
        String letter = letters[i];

        if (letter.toUpperCase() == letter) {
          morseWord += '..';
        } else {
          morseWord += '--';
        }
        morseWord += MorseBrain.parseMorse(letter.toLowerCase());

        if (i != letters.length - 1) {
          morseWord += ' ';
        }
      }

      if (k != words.length - 1) morseWord += '/';
      finalString += morseWord;
    }

    int morseLength = finalString.length;

    return Morse(
      textLength: length,
      morseLength: morseLength,
      text: normalText,
      morse: finalString,
    );
  }

  factory Morse.toString(String morseText) {
    if (morseText == null) throw ArgumentError();
    int morseLength = morseText.length;
    String finalString = '';

    List<String> wordsOrCharacters = morseText.split('/');

    for (int k = 0; k < wordsOrCharacters.length; k++) {
      String eachWordOrCharacter = wordsOrCharacters[k];
      List<String> charactersInAWord = eachWordOrCharacter.split(' ');
      String word = '';

      for (String eachCharacter in charactersInAWord) {
        String capitalizationCheckerString = eachCharacter.substring(0, 2);

        String actualLetterInMorse = eachCharacter.substring(2);

        String parsedCharacter = MorseBrain.parseCharacter(actualLetterInMorse);

        if (capitalizationCheckerString == '..') {
          parsedCharacter = parsedCharacter.toUpperCase();
        }

        word += parsedCharacter;
      }

      if (k != wordsOrCharacters.length - 1) word += ' ';

      finalString += word;
    }

    int length = finalString.length;

    return Morse(
      textLength: length,
      morseLength: morseLength,
      text: finalString,
      morse: morseText,
    );
  }
}
