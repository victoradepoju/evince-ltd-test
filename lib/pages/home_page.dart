import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task1/controllers/media_controller.dart';
import 'package:task1/custom_widgets/media_list_tile.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () => ref.watch(mediaProvider.notifier).fetchMediaList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Test'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          final fetchMediaState = ref.watch(mediaProvider);
          final lists = fetchMediaState.mediaList;
          return MediaListTile(
            index: index,
            mediaState: fetchMediaState,
            lists: lists,
          );
        },
      ),
    );
  }
}
