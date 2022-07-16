import 'package:flutter/material.dart';
import 'package:news_and_book/model/newsmodel.dart';

class DetailScreenNews extends StatefulWidget {
  final Articles selctnewsheading;
  const DetailScreenNews({
    Key? key,
    required this.selctnewsheading,
  }) : super(key: key);

  @override
  State<DetailScreenNews> createState() => _DetailScreenNewsState();
}

class _DetailScreenNewsState extends State<DetailScreenNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.selctnewsheading.source!.name ?? 'title'),
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
                  widget.selctnewsheading.title ?? 'title',
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
                Container(
                  child: widget.selctnewsheading.urlToImage != null
                      ? Image.network(
                          widget.selctnewsheading.urlToImage.toString())
                      : const SizedBox(
                          height: 200, child: Text('No Images to Display')),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.selctnewsheading.description ?? 'description',
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
