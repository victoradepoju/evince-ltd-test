class MediaException implements Exception {
  String message;
  MediaException([this.message = 'Something went wrong']) {
    message = 'Media Exception: $message';
  }

  @override
  String toString() => 'MediaException(message: $message)';
}
