import 'dart:io';

class Antenna {
  final String freq;
  final int row;
  final int col;

  Antenna(this.freq, this.row, this.col);
}

void main() async {
  final lines = await File('input.txt').readAsLines();
  final a = lines.map((s) => s.split('')).toList();
  final antennas = <Antenna>[];
  for (int i = 0; i < a.length; i++) {
    for (int j = 0; j < a[i].length; j++) {
      if (a[i][j] != '.') {
        antennas.add(Antenna(a[i][j], i, j));
      }
    }
  }
  int ans = 0;
  for (int i = 0; i < antennas.length; i++) {
    for (int j = i + 1; j < antennas.length; j++) {
      if (antennas[i].freq == antennas[j].freq) {
        int drow = antennas[i].row - antennas[j].row;
        int dcol = antennas[i].col - antennas[j].col;
        for (int k = -1; k < 3; k++) {
          int nrow = antennas[i].row - k * drow;
          int ncol = antennas[i].col - k * dcol;
          if (nrow >= 0 && nrow < a.length &&
              ncol >= 0 && ncol < a[nrow].length &&
              (nrow != antennas[i].row || ncol != antennas[i].col) &&
              (nrow != antennas[j].row || ncol != antennas[j].col) &&
              a[nrow][ncol] != '#') {
            a[nrow][ncol] = '#';
            ans++;
          }
        }
      }
    }
  }
  print(ans);
}
