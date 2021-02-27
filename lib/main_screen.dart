import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:splash_gram/data/response_unsplash.dart';
import 'package:splash_gram/detail_screen.dart';

import 'data/api.dart';

class MainScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Splash Gram',
          style: TextStyle(fontFamily: 'Instagram'),
        ),
      ),
      body: Center(
        child: FutureBuilder<ResponseUnsplash>(
          future: Api.getData(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  var unsplash = snapshot.data.data[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return DetailScreen(
                          unsplash: unsplash,
                          data: snapshot.data.data,
                        );
                      }));
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                          Image.network(unsplash.urls.regular),
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
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: snapshot.data.data.length,
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
