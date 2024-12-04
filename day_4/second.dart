import 'dart:io';

void main() async {
  final lines = await File('input.txt').readAsLines();
  List<List<String>> a = lines.map((line) => line.split('')).toList();
  int ans = 0;
  for (int i = 0; i < a.length - 2; i++) {
    for (int j = 0; j < a[i].length - 2; j++) {
      if (isXmasExist(a, i, j, 1, 1) && isXmasExist(a, i, j + 2, 1, -1)) {
        ans++;
      }
    }
  }
  print(ans);
}

bool isXmasExist(List<List<String>> a, int i, int j, int di, int dj) {
  for (final p in ['SAM', 'MAS']) {
    int ni = i - di, nj = j - dj;
    bool ok = true;
    for (int k = 0; k < 3 && ok; k++) {
      ni += di;
      nj += dj;
      if (ni < 0 || ni >= a.length ||
          nj < 0 || nj >= a[ni].length ||
          a[ni][nj] != p[k]
      ) {
        ok = false;
      }
    }
    if (ok) {
      return true;
    }
  }
  return false;
}
