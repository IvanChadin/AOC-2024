import 'dart:io';

void main() async {
  final lines = await File('input.txt').readAsLines();
  final regex = RegExp(r"[a-zA-Z']+\(\d*(,\d*)?\)");
  final mulRegex = RegExp(r'mul\((\d+),(\d+)\)');
  int ans = 0;
  bool shouldExecute = true;
  for (final line in lines) {
    final allMatches = regex.allMatches(line);
    for (final match in allMatches) {
      final command = match.group(0)!;
      final mulMatch = mulRegex.firstMatch(command);
      if (mulMatch != null) {
        if (shouldExecute) {
          ans += int.parse(mulMatch.group(1)!) * int.parse(mulMatch.group(2)!);
        }
      } else if (command.contains("don't()")) {
        shouldExecute = false;
      } else if (command.contains("do")) {
        shouldExecute = true;
      }
    }
  }
  print(ans);
}
