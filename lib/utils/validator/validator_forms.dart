bool isNumeric(String v) {
  if (v.isEmpty) return false;
  final n = num.tryParse(v);
  return (n == null) ? false : true;
}
