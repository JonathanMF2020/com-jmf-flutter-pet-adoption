class TokenException implements Exception {
  final String error;
  const TokenException(this.error);
  @override
  String toString() => 'TokenException: $error';
}
