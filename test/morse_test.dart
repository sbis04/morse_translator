import 'package:morse/morse.dart';
import 'package:test/test.dart';

void main() {
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
