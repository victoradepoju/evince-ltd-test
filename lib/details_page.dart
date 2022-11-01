// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:task1/controllers/media_controller.dart';

class DetailsPage extends ConsumerStatefulWidget {
  final List<dynamic> data;
  final int index;
  const DetailsPage({
    super.key,
    required this.data,
    required this.index,
  });

  @override
  ConsumerState<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends ConsumerState<DetailsPage> {
  @override
  void initState() {
    requestPermission();
    super.initState();
  }

  void requestPermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    var status1 = await Permission.manageExternalStorage.status;
    if (!status1.isGranted) {
      await Permission.manageExternalStorage.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('${widget.data[widget.index]['Title']}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 400,
            width: double.maxFinite,
            child: Hero(
                tag: 'image${widget.index}',
                child: Image.network("${widget.data[widget.index]['ImageUrl']}",
                    fit: BoxFit.fill)),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            child: Column(
              children: [
                const Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  child: Text(
                    '${widget.data[widget.index]['Description']}',
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () async {
              await ref.read(mediaProvider.notifier).downloadAudio(
                    "${widget.data[widget.index]['AudioUrl']}",
                    "audiobook${widget.index}.mp3",
                  );
            },
            child: const Text('Download Audio'),
          ),
        ],
      ),
    );
  }
}
