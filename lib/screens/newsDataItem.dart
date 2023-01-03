import 'package:flutter/material.dart';
import 'package:news7/models/NewsDataModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  Articles articles;

  NewsCard(this.articles);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {},
            child: CachedNetworkImage(
              imageUrl: articles.urlToImage ?? '',
              height: 180,
              fit: BoxFit.fill,
              placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                color: Colors.green,
              )),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(
            articles.author ?? '',
            style: TextStyle(
              fontSize: 13,
              color: Colors.green.shade500,
            ),
          ),
          Text(
            articles.title ?? '',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(articles.publishedAt?.substring(0, 10) ?? '',
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              )),
          Text(articles.content ?? '',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              )),
        ],
      ),
    );
  }
}
