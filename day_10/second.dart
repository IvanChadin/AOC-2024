import 'dart:io';

void main() async {
  final lines = await File('input.txt').readAsLines();
  final a = lines
      .map((a) => a.split(RegExp('')).map((a) => int.parse(a)).toList())
      .toList();
  final di = [-1, 0, 1, 0];
  final dj = [0, 1, 0, -1];
  List<List<int>> d = [];
  int N = a.length;
  for (int i = 0; i < a.length; i++) {
    d.add(List.empty(growable: true));
    for (int j = 0; j < a[i].length; j++) {
      if (a[i][j] == 9) {
        d[i].add(1);
      } else {
        d[i].add(0);
      }
    }
  }
  for (int k = 9; k > 0; k--) {
    for (int i = 0; i < a.length; i++) {
      for (int j = 0; j < a[i].length; j++) {
        for (int l = 0; l < 4; l++) {
          int ni = i + di[l];
          int nj = j + dj[l];
          if (ni >= 0 &&
              ni < a.length &&
              nj >= 0 &&
              nj < a[ni].length &&
              a[i][j] == k &&
              a[ni][nj] == k - 1) {
            d[ni][nj] += d[i][j];
          }
        }
      }
    }
  }
  int ans = 0;
  for (int i = 0; i < a.length; i++) {
    for (int j = 0; j < a[i].length; j++) {
      if (a[i][j] == 0) {
        ans += d[i][j];
      }
    }
  }
  print(ans);
}
