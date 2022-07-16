import 'package:flutter/material.dart';
import 'package:news_and_book/api/booksapi.dart';
import 'package:news_and_book/model/bookmodel.dart';
import 'package:news_and_book/screen/booksdetailspage.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Books"),
        backgroundColor: Colors.grey,
      ),
      body: _buildBody(context),
    );
  }

  FutureBuilder<List<Items>> _buildBody(BuildContext context) {
    final BooksApiService httpService = BooksApiService();
    return FutureBuilder<List<Items>>(
      future: httpService.getBooksApiData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<Items> bookposts = snapshot.data ?? [];
          return _buildPosts(context, bookposts);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildPosts(BuildContext context, List<Items> bookposts) {
    return ListView.builder(
      itemCount: bookposts.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return buildItemForBooks(context, bookposts, index);
      },
    );
  }

  buildItemForBooks(
    BuildContext context,
    List<Items> posts,
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DetailScreenBooks(selectBooksData: posts[index])),
        );
      },
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      posts[index].volumeInfo!.title ?? "title",
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    'By:',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      ' ${posts[index].volumeInfo!.authors ?? 'authors'}',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
