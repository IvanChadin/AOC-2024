import 'dart:io';

void main() async {
  final lines = await File('input.txt').readAsLines();
  final regex = RegExp(r'mul\(\d+,\d+\)');
  int ans = 0;
  for (final line in lines) {
    final allMatches = regex.allMatches(line);
    for (final match in allMatches) {
      final p = match.group(0)!;
      final firstMatch = RegExp(r'mul\((\d+),(\d+)\)').firstMatch(p)!;
      ans += int.parse(firstMatch.group(1)!) * int.parse(firstMatch.group(2)!);
    }
  }
  print(ans);
}
