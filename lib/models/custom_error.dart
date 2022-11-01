class CustomError {
  final String errorMessage;

  CustomError({
    this.errorMessage = '',
  });

  @override
  String toString() => 'CustomError(errorMessage: $errorMessage)';
}
