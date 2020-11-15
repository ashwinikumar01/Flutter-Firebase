import 'package:time_tracker_app/app/home/models/entry.dart';
import 'package:time_tracker_app/app/home/models/job.dart';

class EntryJob {
  EntryJob(this.entry, this.job);

  final Entry entry;
  final Job job;
}
