import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';

import '../../../data/models/article_model.dart';

class ArticleItemWidget extends StatelessWidget {
  final ArticleModel articleModel;

  const ArticleItemWidget({Key? key, required this.articleModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          Container(
            height: 250,
            width: Constants.mediaquery.size.width,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16)),
            child: CachedNetworkImage(
              imageUrl: articleModel.urlToImage,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error, color: Colors.grey, size: 45),
            ),
          )
        ],
      ),
    );
  }
}


