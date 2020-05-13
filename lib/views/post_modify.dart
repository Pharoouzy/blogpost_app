import 'package:blogapp/index.dart';

class PostModify extends StatelessWidget {

  final int id;
  bool get isCreatingPost => id == null;
  PostModify({this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isCreatingPost ? 'Create Post' : 'Modify Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Post Title'
              ),
            ),
            SizedBox(height: 15.0,),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Post Body'
              ),
            ),
            SizedBox(height: 16.0,),
            SizedBox(
              width: double.infinity,
              height: 35.0,
              child: RaisedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0
                  ),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  if(isCreatingPost){
                    // create post from API
                  }
                  else{
                    // modify post
                  }
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
