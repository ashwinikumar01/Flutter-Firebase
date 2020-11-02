import 'package:meta/meta.dart';
import 'package:time_tracker_app/app/home/models/job.dart';
import 'package:time_tracker_app/services/api_path.dart';
import 'package:time_tracker_app/services/firestore_service.dart';

// created dynamically
abstract class Database {
  Future<void> createJob(Job job);
  Stream<List<Job>> jobsStream();
}

class FirestoreDatabase implements Database {
  final String uid;
  FirestoreDatabase({@required this.uid}) : assert(uid != null);

  final _service = FirestoreService.instance;
  Future<void> createJob(Job job) async => await _service.setData(
        path: APIPath.job(uid, 'job_abc'),
        data: job.toMap(),
      );

  // converting into list of jobs
  Stream<List<Job>> jobsStream() => _service.collectionStream(
      path: APIPath.jobs(uid), builder: (data) => Job.fromMap(data));
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
