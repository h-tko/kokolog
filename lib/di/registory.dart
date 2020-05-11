import 'package:kokolog/dao/record.dart';
import 'package:kokolog/repository/record_repository.dart';
import 'package:kokolog/view_model/regist_view_model.dart';

class ViewModelRegistory {
  static RegistViewModel makeRegistViewModel() {
    return RegistViewModel(RepositoryRegistory.makeRecordRepository());
  }
}

class RepositoryRegistory {
  static RecordRepository makeRecordRepository() {
    return RecordRepository(Record());
  }
}
