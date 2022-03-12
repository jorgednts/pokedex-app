extension CapitalizeStringExtension on String {
  String capitalize() =>
      '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
}
extension StringExtensions on String {
  bool isBlank() => trim().isEmpty;
}
