String? getText(int? index, List list) {
  final result = (index != null && index != -1) ? list[index][1] : null;

  return result;
}