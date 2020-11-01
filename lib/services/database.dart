import 'package:meta/meta.dart';

abstract class Database {}

class FirestoreDatabase implements Database {
  final String uid;
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
}
