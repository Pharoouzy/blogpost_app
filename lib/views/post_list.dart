import 'package:blogapp/index.dart';
import 'package:blogapp/models/post.dart';
import 'package:blogapp/views/post_delete.dart';
import 'package:blogapp/views/post_modify.dart';

class PostList extends StatelessWidget {

  final posts = [
    new Post(
      id: 1,
      title: "Post title 1",
      body: "This is the body of Post title 1",
      created_at: DateTime.now(),
      updated_at: DateTime.now()
    ),
    new Post(
        id: 2,
        title: "Post title 2",
        body: "This is the body of Post title 2",
        created_at: DateTime.now(),
        updated_at: DateTime.now()
    ),
    new Post(
        id: 3,
        title: "Post title 3",
        body: "This is the body of Post title 3",
        created_at: DateTime.now(),
        updated_at: DateTime.now()
    ),
  ];

  String formatDateTime(DateTime dateTime){
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Posts'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => PostModify()));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        itemBuilder: (_, index){
          return Dismissible(
            key: ValueKey(posts[index].id),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction){

            },
            confirmDismiss: (direction) async {
              final result = await showDialog(
                context: context,
                builder: (_) => PostDelete()
              );
              return result;
            },
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.only(left: 16),
              child: Align(
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                alignment: Alignment.centerLeft,
              ),
            ),
            child: ListTile(
              title: Text(
                posts[index].title,
                style: TextStyle(
                    color: Theme.of(context).primaryColor
                ),
              ),
              subtitle: Text('Last Edited on ${this.formatDateTime(posts[index].updated_at)}'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_)  => PostModify(id: posts[index].id)));
              },
            ),
          );
        },
        separatorBuilder: (_, __) => Divider(
          height: 1,
          color: Colors.green,
        ),
        itemCount: posts.length,
      ),
    );
  }
}
