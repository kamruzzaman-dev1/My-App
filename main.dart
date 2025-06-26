
import 'package:flutter/material.dart';

void main() => runApp(MySocialApp());

class MySocialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MySocial',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PostListPage(),
    );
  }
}

class Post {
  final String username;
  final String content;
  Post({required this.username, required this.content});
}

class PostListPage extends StatefulWidget {
  @override
  _PostListPageState createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  List<Post> posts = [
    Post(username: "Kamruzzaman", content: "আলহামদুলিল্লাহ, প্রথম পোস্ট!"),
    Post(username: "User123", content: "এই অ্যাপটা দারুণ হচ্ছে!"),
  ];

  final _controller = TextEditingController();

  void _addPost(String text) {
    if (text.isEmpty) return;
    setState(() {
      posts.insert(0, Post(username: "Kamruzzaman", content: text));
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MySocial')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Write a post...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _addPost(_controller.text),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Card(
                  child: ListTile(
                    title: Text(post.username),
                    subtitle: Text(post.content),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
