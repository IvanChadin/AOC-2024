import 'dart:io';

void main() async {
  final lines = await File('input.txt').readAsLines();
  List<List<String>> a = lines.map((line) => line.split('')).toList();
  int ans = 0;
  for (int i = 0; i < a.length; i++) {
    for (int j = 0; j < a[i].length; j++) {
      ans += xmasCount(a, i, j);
    }
  }
  print(ans);
}

int xmasCount(List<List<String>> a, int i, int j) {
  if (a[i][j] != 'X') {
    return 0;
  }
  final di = [-1, -1, 0, 1, 1, 1, 0, -1];
  final dj = [0, 1, 1, 1, 0, -1, -1, -1];
  int res = 0;
  for (int k = 0; k < 8; k++) {
    int ni = i, nj = j;
    bool ok = true;
    for (int l = 1; l < 4 && ok; l++) {
      ni += di[k];
      nj += dj[k];
      if (ni < 0 || ni >= a.length ||
          nj < 0 || nj >= a[ni].length ||
          a[ni][nj] != 'XMAS'[l]
      ) {
        ok = false;
      }
    }
    if (ok) {
      res++;
    }
  }
  return res;
}
