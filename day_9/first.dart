import 'dart:io';

void main() async {
  final lines = await File('input.txt').readAsLines();
  final a = lines[0].split(RegExp('')).map((a) => int.parse(a)).toList();
  int ans = 0;
  int l = 0, r = a.length % 2 == 0 ? a.length - 2 : a.length - 1, idx = 0;
  while (l <= r) {
    for (int i = 0; i < a[l]; i++) {
      if (l % 2 == 0) {
        ans += idx * (l ~/ 2);
      } else {
        while (a[r] == 0 && l < r) {
          r -= 2;
        }
        if (r < l) {
          break;
        }
        ans += idx * (r ~/ 2);
        a[r]--;
      }
      idx++;
    }
    l++;
  }
  print(ans);
}
