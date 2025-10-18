import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: NewsScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

// ---------- MODEL ----------
class Article {
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? url;

  Article({
    this.title,
    this.description,
    this.urlToImage,
    this.url,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      urlToImage: json['urlToImage'] ??
          'https://via.placeholder.com/150', // fallback image
      url: json['url'] ?? '',
    );
  }
}

// ---------- API SERVICE ----------
class NewsApiService {
  final String apiKey = 'e7d87a12e2294e39b80af802723ae6d8'; // your API key
  final String baseUrl = 'https://newsapi.org/v2';

  Future<List<Article>> fetchIndiaNews() async {
    final String urlString =
        '$baseUrl/everything?q=india&language=en&sortBy=publishedAt&apiKey=$apiKey';
    final Uri uri = Uri.parse(urlString);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      if (jsonData['articles'] != null) {
        final List<dynamic> articlesJson = jsonData['articles'];
        return articlesJson.map((json) => Article.fromJson(json)).toList();
      } else {
        throw Exception('No articles found');
      }
    } else {
      throw Exception('Failed to load news: ${response.statusCode}');
    }
  }
}

// ---------- MAIN SCREEN ----------
class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Future<List<Article>> _newsFuture;
  final NewsApiService _newsService = NewsApiService();

  @override
  void initState() {
    super.initState();
    _newsFuture = _newsService.fetchIndiaNews(); // fetch Indian news
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("India News"),
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder<List<Article>>(
        future: _newsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No news found'));
          }

          final articles = snapshot.data!;
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return Card(
                margin: const EdgeInsets.all(10),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      article.urlToImage!,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    article.title ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    article.description ?? '',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
