import 'dart:io';

void main() async {
  final lines = await File('input.txt').readAsLines();
  final a = lines[0].split(RegExp('')).map((a) => int.parse(a)).toList();
  int ans = 0;
  int l = 0, r = a.length % 2 == 0 ? a.length - 2 : a.length - 1, idx = 0;
  final used = <int>{};
  while (l <= r) {
    if (l % 2 == 0) {
      if (!used.contains(l)) {
        for (int i = 0; i < a[l]; i++) {
          ans += idx * (l ~/ 2);
          idx++;
        }
      } else {
        idx += a[l];
      }
      l++;
    } else {
      int rr = r;
      while (l < rr && (a[rr] > a[l] || used.contains(rr))) {
        rr -= 2;
      }
      if (rr > l) {
        for (int i = 0; i < a[rr]; i++) {
          ans += idx * (rr ~/ 2);
          idx++;
        }
        a[l] -= a[rr];
        used.add(rr);
      }
      if (a[l] == 0 || rr < l) {
        idx += a[l];
        l++;
      }
    }
  }
  print(ans);
}
