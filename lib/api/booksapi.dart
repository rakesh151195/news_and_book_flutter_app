import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_and_book/model/bookmodel.dart';

class BooksApiService {
  final String booksURL =
      "https://www.googleapis.com/books/v1/volumes?q=cancer";

  Future<List<Items>> getBooksApiData() async {
    try {
      print("Api Called");
      http.Response res = await http.get(Uri.parse(booksURL));

      if (res.statusCode == 200) {
        BookModel bookmodel = BookModel();
        print("200 in");

        bookmodel = BookModel.fromJson(json.decode(res.body));
        print(bookmodel.items);

        List<Items> booksposts = bookmodel.items ?? [];
        print(booksposts.length);
        for (Items a in booksposts) {
          print(a.accessInfo);
        }
        return booksposts;
      } else {
        throw "Unable to retrieve posts.";
      }
      // return posts;
    } on Exception catch (e) {
      throw ('New Exception: ${e.toString()}');
    }
  }
}
