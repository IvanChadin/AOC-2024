import 'dart:io';

void main() async {
  final lines = await File('input.txt').readAsLines();
  final order = Map<int, Set<int>>();
  int ans = 0;
  for (final line in lines) {
    if (line.contains('|')) {
      final nums = line.split('|').map(int.parse).toList();
      order.putIfAbsent(nums[0], () => Set());
      order[nums[0]]!.add(nums[1]);
    } else if (line.contains(',')) {
      final nums = line.split(',').map(int.parse).toList();
      bool ok = true;
      for (int i = 0; i < nums.length && ok; i++) {
        for (int j = i + 1; j < nums.length && ok; j++) {
          if (order.containsKey(nums[j]) && order[nums[j]]!.contains(nums[i])) {
            ok = false;
          }
        }
      }
      if (ok) {
        ans += nums[nums.length ~/ 2];
      }
    }
  }
  print(ans);
}
