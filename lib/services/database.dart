import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:time_tracker_app/app/home/models/job.dart';

// created dynamically
abstract class Database {
  Future<void> createJob(Job job);
}

class FirestoreDatabase implements Database {
  final String uid;
  FirestoreDatabase({@required this.uid}) : assert(uid != null);

  // setData returns a Future
  Future<void> createJob(Job job) async {
    final path = '/users/$uid/jobs/job_abc';
    final documentReference = Firestore.instance.document(path);
    await documentReference.setData(job.toMap());
  }
}

// created by user
// abstract class Database {
//   Future<void> createJob(Map<String, dynamic> jobData);
// }

// class FirestoreDatabase implements Database {
//   final String uid;
//   FirestoreDatabase({@required this.uid}) : assert(uid != null);

//   // setData returns a Future
//   Future<void> createJob(Map<String, dynamic> jobData) async {
//     final path = '/users/$uid/jobs/job_abc';
//     final documentReference = Firestore.instance.document(path);
//     await documentReference.setData(jobData);
//   }
// }
