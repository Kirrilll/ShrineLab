import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shrine/models/post.dart';
import 'package:shrine/services/remote_service.dart';

import 'models/user.dart';


class MainPage extends StatefulWidget {
  final User user;

  const MainPage({Key? key, required this.user}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Post>? _posts;
  var _isLoaded = false;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async{
    _posts = await RemoteService().getPosts();
    if(_posts != null){
      setState(() {
        _isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Hello, ${widget.user.login}'),
          ),
          title: Text(
            'Posts',
            style: Theme
                .of(context)
                .textTheme
                .headline5,
          ),
          centerTitle: true,
        ),
        body: Visibility(
          visible: _isLoaded,
          child: ListView.builder(
              itemCount: _posts?.length,
              itemBuilder: (_, index) {
                return  Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.account_box,
                      size: 30,
                    ),
                    title: Text(
                        _posts![index].title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        ),
                    ),
                    subtitle: Text(_posts![index].body)
                  ),
                );
              }),
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
        )
    );
  }
}
