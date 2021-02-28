import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:splash_gram/data/model/unsplash.dart';

class DetailScreen extends StatelessWidget {
  final Unsplash unsplash;
  final List<Unsplash> data;

  DetailScreen({@required this.unsplash, @required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Hero(
                tag: "image",
                child: CachedNetworkImage(
                  imageUrl: unsplash.urls.regular,
                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                ),
              ),
              SafeArea(
                  child: Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              )),
              Positioned(
                child: FavoriteButton(),
                right: 5,
                bottom: 5,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(unsplash.user.profileImage.medium),
                  radius: 28,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        unsplash.user.name,
                        style: Theme.of(context).textTheme.headline6,
                        overflow: TextOverflow.fade,
                      ),
                      Text(
                        unsplash?.location?.city ?? "Unknown Location",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${unsplash.likes.toString()} likes",
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(DateFormat('dd MMMM yyyy').format(unsplash.createdAt)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(unsplash?.description ?? ''),
          ),
          Expanded(
              child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(2),
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            crossAxisCount: 2,
            children: data.map((e) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailScreen(unsplash: e, data: data);
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          alignment: FractionalOffset.center,
                          image: CachedNetworkImageProvider(e.urls.regular))),
                ),
              );
            }).toList(),
          )),
        ],
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.pinkAccent,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
        final snackBar = SnackBar(
          content: Text(isFavorite ? 'Favorite' : 'Not Favorite'),
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
    );
  }
}
