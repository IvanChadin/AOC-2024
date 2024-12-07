import 'dart:io';

void main() async {
  final lines = await File('input.txt').readAsLines();
  int ans = 0;
  final operators = [
    (int a, int b) => a + b,
    (int a, int b) => a * b
  ];
  for (final line in lines) {
    final nums = line.split(RegExp(r'\s|:\s')).map(int.parse).toList();
    if (isValid(nums, 1, 0, operators)) {
      ans += nums[0];
    }
  }
  print(ans);
}

bool isValid(List<int> nums, int idx, int sum, List<int Function(int, int)> operators) {
  if (idx == nums.length) {
    return sum == nums[0];
  }
  for (final operator in operators) {
    if (isValid(nums, idx + 1, operator(sum, nums[idx]), operators)) {
      return true;
    }
  }
  return false;
}
