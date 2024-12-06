import 'dart:io';

void main() async {
  final lines = await File('input.txt').readAsLines();
  List<List<String>> a = lines.map((line) => line.split('')).toList();
  int i = -1, j = -1;
  for (int ii = 0; ii < a.length; ii++) {
    for (int jj = 0; jj < a[ii].length; jj++) {
      if (a[ii][jj] == '^') {
        i = ii;
        j = jj;
      }
    }
  }
  final di = [-1, 0, 1, 0];
  final dj = [0, 1, 0, -1];
  final dir = ['^', '>', 'v', '<'];
  int curIdx = 0;
  int ans = 1;
  while (true) {
    int ni = i + di[curIdx];
    int nj = j + dj[curIdx];
    if (ni < 0 || ni >= a.length || nj < 0 || nj >= a[ni].length) {
      break;
    }
    while (a[ni][nj] == '#') {
      curIdx = (curIdx + 1) % 4;
      ni = i + di[curIdx];
      nj = j + dj[curIdx];
    }
    if (a[ni][nj] == dir[curIdx]) {
      break;
    }
    i = ni;
    j = nj;
    if (a[i][j] == '.') {
      ans++;
    }
    a[ni][nj] = dir[curIdx];
  }
  print(ans);
}
