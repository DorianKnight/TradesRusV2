//Description: Page containing all of the available floorers

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:trades_r_us_v1/PopUpMenu.dart';

import 'Post.dart';
import 'RequestPlumber.dart';

class Plumbers extends StatefulWidget {
  Plumbers({Key? key}) : super(key: key);

  @override
  State<Plumbers> createState() => _PlumbersState();
}

class _PlumbersState extends State<Plumbers> {
  List<Post>? posts;

  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteService().getPost();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions: [PopUp()],
          title: Text(
            'Plumbing',
            style: TextStyle(fontSize: 30),
          ),
          leading: InkWell(
              onTap: (() {
                Navigator.pop(context);
              }),
              child: const Icon(Icons.arrow_back)),
          flexibleSpace: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
            ),
            child: Image.network(
                'https://modernplumbers.com/wp-content/uploads/2016/04/banner-image.jpg',
                //width: 200,
                //height: 140,
                fit: BoxFit.fill),
          ),
        ),
        body: Visibility(
          visible: isLoaded,
          child: ListView.builder(
            itemCount: posts?.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                child: Card(
                  color: Colors.lightBlueAccent,
                  child: Column(
                    children: [
                      ListTile(
                        title: Center(
                          child: Text(
                            posts![index].company_name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        subtitle: Center(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
