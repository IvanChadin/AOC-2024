import 'dart:io';
import 'dart:math';

void main() async {
  final lines = await File('input.txt').readAsLines();
  int ans = 0;
  for (final line in lines) {
    final levels = line.split(RegExp(r'\s+')).map(int.parse).toList();
    if (isSafe(levels)) {
      ans++;
    }
  }
  print(ans);
}

bool isSafe(List<int> a) {
  return longestSubsequenceLength(a, 1) >= a.length - 1 ||
      longestSubsequenceLength(a, -1) >= a.length - 1;
}

int longestSubsequenceLength(List<int> a, int direction) {
  final dp = List.filled(a.length, 1);
  for (int i = 0; i < a.length; i++) {
    for (int j = 0; j < i; j++) {
      final diff = a[j] - a[i];
      if (diff.abs() >= 1 && diff.abs() <= 3 && diff * direction > 0) {
        dp[i] = max(dp[i], dp[j] + 1);
      }
    }
  }
  int ans = 0;
  for (int i = 0; i < a.length; i++) {
    ans = max(ans, dp[i]);
  }
  return ans;
}
