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
              Image.network(unsplash.urls.regular),
              SafeArea(
                  child: Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(unsplash.user.profileImage.medium),
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
                          image: NetworkImage(e.urls.regular))),
                ),
              );
            }).toList(),
          ))
        ],
      ),
    );
  }
}
