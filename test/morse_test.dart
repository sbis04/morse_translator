import 'package:morse/scr/morse_converter.dart';
import 'package:test/test.dart';

void main() {
  test('Text: Fails with null', () {
    expect(() => Morse.fromString(null), throwsArgumentError);
  });

  test('Morse: Fails with null', () {
    expect(() => Morse.toString(null), throwsArgumentError);
  });

  test('Convert to morse', () {
    final m = Morse.fromString('hello world');
    expect(m.textLength, 11);
    expect(m.morseLength, 61);
  });
  test('Convert to normal text', () {
    final m = Morse.toString('--.... --. --.-.. --.-.. -----/---- --.- --.. ---.');
    expect(m.textLength, 10);
    expect(m.morseLength, 50);
  });
}
