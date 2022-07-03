import 'package:flutter/material.dart';
import 'package:news_apps_bloc_rest_api/screens/show_details/show_details.dart';
import '../constants/colors.dart';
import 'package:intl/intl.dart';

class PostCard extends StatelessWidget {
  final double heigth;
  final double width;
  final double padding;

  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  const PostCard(
      {Key? key,
      required this.heigth,
      required this.width,
      required this.padding,
      required this.title,
      required this.description,
      required this.author,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => ShowDetailPage(
              heigth: heigth * 0.55,
              width: width,
              padding: width * 0.03,
              title: title,
              description: description,
              author: author,
              content: content,
              publishedAt: publishedAt,
              url: url,
              urlToImage: urlToImage,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(padding),
        margin: EdgeInsets.only(bottom: width * 0.03),
        height: heigth,
        width: width,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: grey, spreadRadius: 1, blurRadius: width * 0.01),
        ], color: white, borderRadius: BorderRadius.circular(width * 0.05)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: heigth * 0.15,
              child: Text(
                title,
                maxLines: 2,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: width * 0.055,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: heigth * 0.15,
              child: Text(
                description,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: const TextStyle(fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              height: heigth * 0.55,
              child: FadeInImage(
                placeholder: Image.asset(
                        alignment: Alignment.center,
                        fit: BoxFit.scaleDown,
                        height: heigth * 0.02,
                        'assets/images/loading.gif')
                    .image,
                imageErrorBuilder: (context, error, stackTrace) {
                  return Container(
                    alignment: Alignment.center,
                    height: heigth * 0.59,
                    child: Image.asset('assets/images/placeholder.png'),
                  );
                },
                image: Image.network(
                  urlToImage,
                  fit: BoxFit.scaleDown,
                ).image,
              ),
            ),
            SizedBox(
              child: Text(
                DateFormat("yyyy-MM-dd'T'HH:mm:ss")
                    .parse(publishedAt)
                    .toLocal()
                    .toString(),
                // DateTime.parse(publishedAt).toString(),
                style: const TextStyle(fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
