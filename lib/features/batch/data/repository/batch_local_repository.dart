import 'package:dartz/dartz.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/batch/data/data_source/local_datasource/batch_local_datasource.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/entity/batch_entity.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/repository/batch_repository.dart';

class BatchLocalRepository implements IBatchRepository {
  final BatchLocalDatasource batchLocalDatasource;

  BatchLocalRepository({required this.batchLocalDatasource});

  @override
  Future<Either<Failure, void>> createBatch(BatchEntity batchEntity) {
    try {
      batchLocalDatasource.createBatch(batchEntity);
      return Future.value(Right(null));
    } catch (e) {
      return Future.value(Left(LocalDatabaseFailure(message: 'e')));
    }
  }

  @override
  Future<Either<Failure, void>> deleteBatch(String id) {
    try {
      batchLocalDatasource.deleteBatch(id);
      return Future.value(Right(null));
    } catch (e) {
      return Future.value(Left(LocalDatabaseFailure(message: 'e')));
    }
  }

  @override
  Future<Either<Failure, List<BatchEntity>>> getAllBatch()async {
    try {
      var batches =  await batchLocalDatasource.getAllBatch();
      return Future.value(Right(batches));
    } catch (e) {
      return Future.value(Left(LocalDatabaseFailure(message: 'e')));
    }
  }
}
