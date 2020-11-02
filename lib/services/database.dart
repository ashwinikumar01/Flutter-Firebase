import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:time_tracker_app/app/home/models/job.dart';
import 'package:time_tracker_app/services/api_path.dart';

// created dynamically
abstract class Database {
  Future<void> createJob(Job job);
  Stream<List<Job>> jobsStream();
}

class FirestoreDatabase implements Database {
  final String uid;
  FirestoreDatabase({@required this.uid}) : assert(uid != null);

  // setData returns a Future
  Future<void> createJob(Job job) async => await _setData(
        path: APIPath.job(uid, 'job_abc'),
        data: job.toMap(),
      );

  // converting into list of jobs
  Stream<List<Job>> jobsStream() {
    final path = APIPath.jobs(uid);
    final reference = Firestore.instance.collection(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => snapshot.documents.map((snapshot) => Job(
          name: snapshot.data['name'],
          ratePerHour: snapshot.data['ratePerHour'],
        )));
  }

  Future<void> _setData({String path, Map<String, dynamic> data}) async {
    final reference = Firestore.instance.document(path);
    print('$path: $data');
    await reference.setData(data);
  }
}

// created by user
// abstract class Database {
//   Future<void> createJob(Map<String, dynamic> jobData);
// }

// class FirestoreDatabase implements Database {
//   final String uid;
//   FirestoreDatabase({@required this.uid}) : assert(uid != null);

// setData returns a Future
//   Future<void> createJob(Map<String, dynamic> jobData) async {
//     final path = '/users/$uid/jobs/job_abc';
//     final documentReference = Firestore.instance.document(path);
//     await documentReference.setData(jobData);
//   }
// }
