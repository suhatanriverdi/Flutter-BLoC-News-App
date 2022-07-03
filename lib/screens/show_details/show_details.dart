import 'package:flutter/material.dart';
import 'package:news_apps_bloc_rest_api/screens/constants/colors.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowDetailPage extends StatefulWidget {
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

  const ShowDetailPage(
      {Key? key,
      required this.heigth,
      required this.width,
      required this.padding,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content})
      : super(key: key);

  @override
  State<ShowDetailPage> createState() => ShowtDetailStatePage();
}

class ShowtDetailStatePage extends State<ShowDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.only(right: widget.width * 0.04),
              child: GestureDetector(
                onTap: () => Share.share(widget.url, subject: widget.title),
                child: const Icon(Icons.share),
              ),
            )
          ],
          title: SizedBox(child: Text(widget.title)),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  FadeInImage(
                    placeholder: Image.asset(
                            alignment: Alignment.center,
                            fit: BoxFit.scaleDown,
                            height: widget.heigth * 0.02,
                            'assets/images/loading.gif')
                        .image,
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/placeholder.png',
                        ),
                      );
                    },
                    image: Image.network(
                      widget.urlToImage,
                    ).image,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(widget.heigth * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      maxLines: 5,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: widget.width * 0.065,
                          fontWeight: FontWeight.w400),
                    ),
                    Divider(
                      color: black,
                    ),
                    Text(
                      widget.description,
                      maxLines: 50,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: widget.width * 0.045,
                      ),
                    ),
                    Divider(
                      color: black,
                    ),
                    Text(
                      widget.content,
                      maxLines: 50,
                      style: TextStyle(
                        fontSize: widget.width * 0.040,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Divider(
                      color: black,
                    ),
                    Text(
                      widget.publishedAt,
                      style: const TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.width * 0.3),
                child: ElevatedButton(
                  onPressed: () => _launchURL(widget.url),
                  child: const Text('Go To The Source'),
                ),
              ),
            ],
          ),
        ));
  }
}

_launchURL(url) async {
  var _url = Uri.parse(url);
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}
