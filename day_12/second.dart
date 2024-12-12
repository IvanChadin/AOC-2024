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
  int angles = anglesCount(a, si, sj, a[si][sj], used);
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
        angles += anglesCount(a, ni, nj, a[ni][nj], used);
        qr.add(ni);
        qc.add(nj);
      }
    }
  }
  return area * angles;
}

int anglesCount(List<List<String>> a, int i, int j, String s, List<dynamic> used) {
  final di = [-1, -1, 0, 1, 1, 1, 0, -1];
  final dj = [0, 1, 1, 1, 0, -1, -1, -1];
  int res = 0;
  for (int sk in [1, 3, 5, 7]) {
    List<bool> list = [];
    for (int t = -1; t <= 1; t++) {
      int k = (sk + t) % 8;
      int ni = i + di[k];
      int nj = j + dj[k];
      if (ni < 0 ||
          ni >= a.length ||
          nj < 0 ||
          nj >= a[ni].length ||
          a[i][j] != a[ni][nj]) {
        list.add(false);
      } else {
        list.add(true);
      }
    }
    if (areListsEqual(list, [true, false, true]) ||
        areListsEqual(list, [false, false, false]) ||
        areListsEqual(list, [false, true, false])) {
      res++;
    }
  }
  return res;
}

bool areListsEqual(List<bool> a, List<bool> b) {
  if (a.length != b.length) return false;
  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}
