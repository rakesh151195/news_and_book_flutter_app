import 'package:flutter/material.dart';
import 'package:news_and_book/model/bookmodel.dart';

class DetailScreenBooks extends StatefulWidget {
  final Items selectBooksData;
  const DetailScreenBooks({Key? key, required this.selectBooksData})
      : super(key: key);

  @override
  State<DetailScreenBooks> createState() => _DetailScreenBooksState();
}

class _DetailScreenBooksState extends State<DetailScreenBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.selectBooksData.volumeInfo!.title ?? 'Title'),
          backgroundColor: Colors.grey,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.selectBooksData.volumeInfo!.subtitle ?? 'subtitle',
                  overflow: TextOverflow.visible,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                widget.selectBooksData.volumeInfo!.authors != null
                    ? Text(
                        'By : ${widget.selectBooksData.volumeInfo!.authors!.first}',
                        overflow: TextOverflow.visible,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : const Text(
                        'No data',
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'publishedDate : ${widget.selectBooksData.volumeInfo!.publishedDate ?? 'publishedDate'}',
                  overflow: TextOverflow.visible,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.selectBooksData.volumeInfo!.description ??
                      'description',
                  // overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
