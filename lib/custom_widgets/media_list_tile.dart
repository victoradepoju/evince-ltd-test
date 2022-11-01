// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:task1/controllers/media_controller.dart';
import 'package:task1/pages/details_page.dart';

class MediaListTile extends StatelessWidget {
  final int index;
  final MediaState mediaState;
  final List<dynamic> lists;
  const MediaListTile({
    Key? key,
    required this.index,
    required this.mediaState,
    required this.lists,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (mediaState.status == MediaStatus.loading) {
      return SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: 150,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 212, 210, 210),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const SizedBox(
                      height: 150,
                      child: Center(
                        child: CircularProgressIndicator(),
                      )),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 150,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          'Title: ',
                        ),
                        Center(
                          child: Text(
                            'Loading',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                )
              ],
            ),
          ),
        ),
      );
    } else if (mediaState.status == MediaStatus.loaded) {
      return SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: 150,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 212, 210, 210),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    height: 150,
                    child: Hero(
                      tag: 'image$index',
                      child: Image.network(
                        "${lists[index]['ImageUrl']}",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 150,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Title: ',
                        ),
                        Text(
                          '${lists[index]['Title']}',
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DetailsPage(
                                data: lists,
                                index: index,
                              );
                            }));
                          },
                          child: const Text('Details'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return const AlertDialog();
    }
  }
}
