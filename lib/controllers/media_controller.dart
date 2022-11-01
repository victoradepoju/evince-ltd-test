// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:task1/models/custom_error.dart';
import 'package:task1/models/media.dart';
import 'package:task1/services/media_api_services.dart';

enum MediaStatus {
  initial,
  loading,
  loaded,
  error,
}

class MediaState {
  final MediaStatus status;
  final List mediaList;
  final CustomError error;
  MediaState({
    required this.status,
    required this.mediaList,
    required this.error,
  });

  factory MediaState.initial() {
    return MediaState(
      status: MediaStatus.initial,
      mediaList: [],
      error: CustomError(),
    );
  }

  @override
  String toString() =>
      'MediaState(status: $status, media: $mediaList, error: $error)';

  MediaState copyWith({
    MediaStatus? status,
    List? mediaList,
    CustomError? error,
  }) {
    return MediaState(
      status: status ?? this.status,
      mediaList: mediaList ?? this.mediaList,
      error: error ?? this.error,
    );
  }
}

class MediaStateNotifier extends StateNotifier<MediaState> {
  MediaStateNotifier() : super(MediaState.initial());

  Future<List> fetchMediaList() async {
    state = state.copyWith(status: MediaStatus.loading);
    List currentList = [];

    try {
      final mediaList = await MediaApiServices().getMediaList();
      state = state.copyWith(status: MediaStatus.loaded, mediaList: mediaList);
      currentList = [...mediaList];
    } on CustomError catch (e) {
      state = state.copyWith(status: MediaStatus.error, error: e);
    }
    return currentList;
  }

  Future<void> downloadAudio(String url, String fileName) async {
    await MediaApiServices().downloadAudio(url, fileName);
  }
}

final mediaProvider =
    StateNotifierProvider<MediaStateNotifier, MediaState>((ref) {
  return MediaStateNotifier();
});

final mediaFutureProvider = FutureProvider<List>((ref) async {
  return MediaStateNotifier().fetchMediaList();
});
