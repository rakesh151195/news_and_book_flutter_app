import 'package:flutter/material.dart';
import 'package:news_and_book/api/newsapi.dart';
import 'package:news_and_book/model/newsmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_and_book/screen/newsdetailspage.dart';

class NewsScreenListView extends StatefulWidget {
  const NewsScreenListView({Key? key}) : super(key: key);

  @override
  State<NewsScreenListView> createState() => _NewsScreenListViewState();
}

class _NewsScreenListViewState extends State<NewsScreenListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("News"),
        backgroundColor: Colors.grey,
      ),
      body: _buildBody(context),
    );
  }

  FutureBuilder<List<Articles>> _buildBody(BuildContext context) {
    final NewsApiService httpService = NewsApiService();
    return FutureBuilder<List<Articles>>(
      future: httpService.getNewsApiData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<Articles> posts = snapshot.data ?? [];
          return _buildPosts(context, posts);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildPosts(BuildContext context, List<Articles> posts) {
    return ListView.builder(
      itemCount: posts.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return buildItemForNews(context, posts, index);
      },
    );
  }

  buildItemForNews(BuildContext context, List<Articles> posts, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DetailScreenNews(selctnewsheading: posts[index])),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  blurRadius: 8.0,
                  spreadRadius: 1.0,
                ),
              ]),
          child: Column(
            children: <Widget>[
              Container(
                child: posts[index].urlToImage != null
                    ? Image.network(posts[index].urlToImage.toString())
                    : const SizedBox(
                        height: 200, child: Text('No Images to Display')),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 260,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, top: 10),
                          child: Text(
                            posts[index].source!.name ?? 'title',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  bottom: 10,
                  right: 16,
                  top: 10,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      constraints:
                          const BoxConstraints(minWidth: 200, maxWidth: 280),
                      child: Text(
                        '${posts[index].description}',
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.only(top: 8),
                      icon: const Icon(
                        Icons.share,
                        size: 15,
                        color: Colors.purple,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
