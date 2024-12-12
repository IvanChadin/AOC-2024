import 'dart:collection';
import 'dart:io';

void main() async {
  final lines = await File('input.txt').readAsLines();
  final a = lines.map((s) => s.split(RegExp(''))).toList();
  final used = [];
  for (int i = 0; i < a.length; i++) {
    used.add([]);
    for (int j = 0; j < a[i].length; j++) {
      used[i].add(false);
    }
  }
  int ans = 0;
  for (int i = 0; i < a.length; i++) {
    for (int j = 0; j < a[i].length; j++) {
      if (!used[i][j]) {
        ans += calc(a, i, j, used);
      }
    }
  }
  print(ans);
}

int calc(List<List<String>> a, int si, int sj, List<dynamic> used) {
  final di = [-1, 0, 1, 0];
  final dj = [0, 1, 0, -1];
  final qr = Queue<int>();
  final qc = Queue<int>();
  qr.add(si);
  qc.add(sj);
  used[si][sj] = true;
  int area = 1;
  int perimeter = 4;
  while (qr.isNotEmpty) {
    int i = qr.removeFirst();
    int j = qc.removeFirst();
    for (int k = 0; k < 4; k++) {
      int ni = i + di[k];
      int nj = j + dj[k];
      if (ni >= 0 &&
          ni < a.length &&
          nj >= 0 &&
          nj < a[ni].length &&
          !used[ni][nj] &&
          a[si][sj] == a[ni][nj]) {
        used[ni][nj] = true;
        area++;
        perimeter += 4 - usedNeighboursCount(a, ni, nj, a[ni][nj], used);
        qr.add(ni);
        qc.add(nj);
      }
    }
  }
  return area * perimeter;
}

int usedNeighboursCount(List<List<String>> a, int i, int j, String s, List<dynamic> used) {
  final di = [-1, 0, 1, 0];
  final dj = [0, 1, 0, -1];
  int cnt = 0;
  for (int k = 0; k < 4; k++) {
    int ni = i + di[k];
    int nj = j + dj[k];
    if (ni >= 0 &&
        ni < a.length &&
        nj >= 0 &&
        nj < a[ni].length &&
        used[ni][nj] &&
        a[i][j] == a[ni][nj]) {
      cnt += 2;
    }
  }
  return cnt;
}
