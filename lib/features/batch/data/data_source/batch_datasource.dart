import 'package:softwarica_student_management_bloc/features/batch/domain/entity/batch_entity.dart';

abstract interface class IBatchDatasource {
  Future<void>createBatch(BatchEntity  BatchEntity);
  Future <List<BatchEntity>>getAllBatch();
  Future<void>deleteBatch(String id);
}