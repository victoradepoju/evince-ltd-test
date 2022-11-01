// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Media {
  final String title;
  final String description;
  final String year;
  final String audioUrl;
  final String imageUrl;
  Media({
    required this.title,
    required this.description,
    required this.year,
    required this.audioUrl,
    required this.imageUrl,
  });

  factory Media.initial() {
    return Media(
      title: '',
      description: '',
      year: '',
      audioUrl: '',
      imageUrl: '',
    );
  }

  Media copyWith({
    String? title,
    String? description,
    String? year,
    String? audioUrl,
    String? imageUrl,
  }) {
    return Media(
      title: title ?? this.title,
      description: description ?? this.description,
      year: year ?? this.year,
      audioUrl: audioUrl ?? this.audioUrl,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  factory Media.fromMap(Map<String, dynamic> map) {
    return Media(
      title: map['Title'] as String,
      description: map['Description'] as String,
      year: map['Year'] as String,
      audioUrl: map['AudioUrl'] as String,
      imageUrl: map['ImageUrl'] as String,
    );
  }

  factory Media.fromJson(String source) =>
      Media.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Media(title: $title, description: $description, year: $year, audioUrl: $audioUrl, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant Media other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.year == year &&
        other.audioUrl == audioUrl &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        year.hashCode ^
        audioUrl.hashCode ^
        imageUrl.hashCode;
  }
}
