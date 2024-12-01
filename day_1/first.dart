import 'dart:io';

void main() async {
  final lines = await File('input.txt').readAsLines();
  final l = <int>[], r = <int>[];
  for (final line in lines) {
    final nums = line.split(RegExp(r'\s+')).map(int.parse).toList();
    l.add(nums[0]);
    r.add(nums[1]);
  }
  l.sort();
  r.sort();
  print(List.generate(l.length, (i) => (l[i] - r[i]).abs()).reduce((a, b) => a + b));
}
