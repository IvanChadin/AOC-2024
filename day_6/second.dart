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
  int ans = 0;
  for (int ii = 0; ii < a.length; ii++) {
    for (int jj = 0; jj < a[ii].length; jj++) {
      List<List<String>> copy = a.map((innerList) => List<String>.from(innerList)).toList();
      copy[ii][jj] = '#';
      if (isCycle(i, j, copy)) {
        ans++;
      }
    }
  }
  print(ans);
}

bool isCycle(int i, int j, List<List<String>> a) {
  final di = [-1, 0, 1, 0];
  final dj = [0, 1, 0, -1];
  final dir = ['^', '>', 'v', '<'];
  int curIdx = 0;
  while (true) {
    int ni = i + di[curIdx];
    int nj = j + dj[curIdx];
    if (ni < 0 || ni >= a.length || nj < 0 || nj >= a[ni].length) {
      return false;
    }
    while (a[ni][nj] == '#') {
      curIdx = (curIdx + 1) % 4;
      ni = i + di[curIdx];
      nj = j + dj[curIdx];
    }
    if (a[ni][nj] == dir[curIdx]) {
      return true;
    }
    i = ni;
    j = nj;
    a[i][j] = dir[curIdx];
  }
}
