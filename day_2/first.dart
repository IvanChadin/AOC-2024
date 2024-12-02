import 'dart:io';

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
  final mainDiff = a.last - a.first;
  if (mainDiff == 0) {
    return false;
  }
  for (int i = 1; i < a.length; i++) {
    final diff = a[i] - a[i - 1];
    if (diff * mainDiff < 0 || diff.abs() < 1 || diff.abs() > 3) {
      return false;
    }
  }
  return true;
}
