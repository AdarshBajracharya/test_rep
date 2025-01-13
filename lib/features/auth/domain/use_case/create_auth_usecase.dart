import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:softwarica_student_management_bloc/app/usecase/usecase.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/repository/auth_repository.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/entity/batch_entity.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/entity/course_entity.dart';

class CreateAuthParams extends Equatable {
  final String fName;
  final String lName;
  final String? image;
  final String phoneNo;
  final BatchEntity batchEntity;
  final List<CourseEntity> courseEntity;
  final String username;
  final String password;

  const CreateAuthParams({
    required this.fName,
    required this.lName,
    required this.image,
    required this.phoneNo,
    required this.batchEntity,
    required this.courseEntity,
    required this.username,
    required this.password,
  });
  @override
  List<Object?> get props => [
        fName,
        lName,
        image,
        phoneNo,
        batchEntity,
        courseEntity,
        username,
        password
      ];
}

//use case domain layer ko repository snga dependednt xa kina  vane paxi internet xaina vane decision repository le linxa ani tei anusar data flow hunxa

//sucess vaye paxi k retuurn garxa , params type
class CreateAuthUsecase implements UsecaseWithParams<void, CreateAuthParams> {
  final IAuthRepository repository;

  CreateAuthUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(CreateAuthParams params) {
    //convert params to object.

    var authEntity = AuthEntity(
      fName: '',
      lName: '',
      image: '',
      phoneNo: '',
      batchEntity: BatchEntity(batchName: ''),
      courseEntity: [],
      username: '',
      password: '',
    );
    return repository.createAuth(authEntity);
  }
}
