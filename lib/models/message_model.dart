import 'package:rows_and_cols/models/user_model.dart';

class Message{

final User sender;
final String time;
final String text;
final bool isLiked;
final bool unread;

Message({
  this.sender,
  this.time,
  this.text,
  this.isLiked,
  this.unread,
});

}

final User currentUser = User(
  id: 0,
  name: 'Current user',
  imageUrl: 'assets/images/greg.jpg',
);

final User greg = User(
  id: 1,
  name: 'Greg',
  imageUrl: 'assets/images/greg.jpg',
);

final User john = User(
  id: 2,
  name: 'John',
  imageUrl: 'assets/images/john.jpg',
);

final User james = User(
  id: 3,
  name: 'James',
  imageUrl: 'assets/images/james.jpg',
);

  