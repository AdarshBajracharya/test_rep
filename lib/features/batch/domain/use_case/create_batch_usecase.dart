import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:softwarica_student_management_bloc/app/usecase/usecase.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/entity/batch_entity.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/repository/batch_repository.dart';

class CreateBatchParams extends Equatable {
  final String batchName;

  const CreateBatchParams({required this.batchName});
  @override
  List<Object?> get props => [batchName];
}

//use case domain layer ko repository snga dependednt xa kina  vane paxi internet xaina vane decision repository le linxa ani tei anusar data flow hunxa

//sucess vaye paxi k retuurn garxa , params type
class CreateBatchUsecase implements UsecaseWithParams<void, CreateBatchParams> {
  final IBatchRepository repository;

  CreateBatchUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(CreateBatchParams params) {
    //convert params to object.

    var batchEntity = BatchEntity(batchName: params.batchName);
    return repository.createBatch(batchEntity);
  }
}
