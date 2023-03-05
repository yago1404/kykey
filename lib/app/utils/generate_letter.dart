import 'dart:math';

String generateLetter({
  bool includesDigits = true,
  bool includesSpacialCharacters = true,
  bool includesLowerCases = true,
  bool includesUpperCases = true,
}) {
  List<String> letters = [];
  if (includesDigits) letters.addAll(digits);
  if (includesSpacialCharacters) letters.addAll(specialCharacters);
  if (includesLowerCases) letters.addAll(lowerCases);
  if (includesUpperCases) letters.addAll(upperCases);
  int letterPosition = Random().nextInt(letters.length);
  return letters[letterPosition];
}

List<String> upperCases = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z',
];
List<String> lowerCases = [
  'a',
  'b',
  'c',
  'd',
  'e',
  'f',
  'g',
  'h',
  'i',
  'j',
  'k',
  'l',
  'm',
  'n',
  'o',
  'p',
  'q',
  'r',
  's',
  't',
  'u',
  'v',
  'w',
  'x',
  'y',
  'z',
];
List<String> digits = [
  '0',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
];
List<String> specialCharacters = [
  '!',
  '@',
  '#',
  '\$',
  '%',
  '&',
  '*',
  '(',
  ')',
  '^',
  '{',
  '}',
  '[',
  ']',
  '/',
  '\\',
  ';',
  ':',
  '.',
  ',',
  '=',
  '+',
  '-',
  '_',
  '\'',
];
