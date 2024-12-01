import 'dart:io';

void main() async {
  final lines = await File('input.txt').readAsLines();

  final l = <int>[];
  final cnt = <int, int>{};

  for (final line in lines) {
    final nums = line.split(RegExp(r'\s+')).map(int.parse).toList();
    l.add(nums[0]);
    cnt[nums[1]] = (cnt[nums[1]] ?? 0) + 1;
  }
  print(l.map((a) => a * (cnt[a] ?? 0)).reduce((a, b) => a + b));
}
