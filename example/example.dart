import 'package:morse_translator/morse.dart';

void main(List<String> arguments) {
  try {
    final m = Morse.fromString(testString);
    print('Text: ${m.text}, length: ${m.textLength}');
    print('Morse: ${m.morse}, length: ${m.morseLength}');
  } catch (ArgumentError) {
    print('Invalid input string: cannot be parsed');
  }

  try {
    final m = Morse.toString(morseString);
    print('Text: ${m.text}, length: ${m.textLength}');
    print('Morse: ${m.morse}, length: ${m.morseLength}');
  } catch (ArgumentError) {
    print('Invalid input string: cannot be parsed');
  }
}

const testString = 'hello world';
const morseString = '--.... --. --.-.. --.-.. -----/---- --.- --.. ---.';
