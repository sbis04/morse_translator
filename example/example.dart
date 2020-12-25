import 'package:morse/scr/morse_converter.dart';

void main(List<String> arguments) {
  try {
    final m = Morse.fromString(testString);
    print('Text: ${m.text}, length: ${m.textLength}');
    print('Morse: ${m.morse}, length: ${m.morseLength}');
  } catch (ArgumentError) {
    print('Invalid input string: not correctly formatted');
  }
}

const testString = 'hello world';
