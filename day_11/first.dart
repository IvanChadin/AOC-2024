import 'dart:io';

void main() async {
  final lines = await File('input.txt').readAsLines();
  List<String> a = lines[0].split(RegExp(' ')).toList();
  Map<String, int> d = <String, int>{};
  for (final s in a) {
    d[s] = (d[s] ?? 0) + 1;
  }
  for (int t = 0; t < 25; t++) {
    final temp = <String, int>{};
    for (final s in d.keys) {
      if (s == '0') {
        temp['1'] = (temp['1'] ?? 0) + d[s]!;
      } else if (s.length % 2 == 0) {
        final l = normalize(s.substring(0, s.length ~/ 2));
        final r = normalize(s.substring(s.length ~/ 2));
        temp[l] = (temp[l] ?? 0) + d[s]!;
        temp[r] = (temp[r] ?? 0) + d[s]!;
      } else {
        final l = (int.parse(s) * 2024).toString();
        temp[l] = (temp[l] ?? 0) + d[s]!;
      }
    }
    d = temp;
  }
  int ans = 0;
  for (final s in d.keys) {
    ans += d[s]!;
  }
  print(ans);
}

String normalize(String s) {
  return int.parse(s).toString();
}
