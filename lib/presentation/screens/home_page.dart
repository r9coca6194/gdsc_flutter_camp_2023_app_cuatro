import 'package:gdsc_flutter_camp_2023_app_cuatro/presentation/providers/news_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final news = Provider.of<NewsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: news.newsList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : _CardsNews(news: news),
    );
  }
}

class _CardsNews extends StatelessWidget {
  const _CardsNews({
    required this.news,
  });

  final NewsProvider news;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(),
        );
      },
      itemCount: news.newsList.length,
      itemBuilder: (context, index) {
        final res = news.newsList[index];
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/detail',
              arguments: news.newsList[index]),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          res.title,
                          maxLines: 4,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        res.pubDate.toString(),
                      ),
                    ],
                  ),
                ),
                Hero(
                  tag: res.title,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      width: 170,
                      height: 250,
                      placeholder: const AssetImage('assets/loading.gif'),
                      image: NetworkImage(
                        res.imageUrl ??
                            'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
