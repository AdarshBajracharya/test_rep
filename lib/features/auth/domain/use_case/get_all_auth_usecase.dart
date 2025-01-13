import 'package:dartz/dartz.dart';
import 'package:softwarica_student_management_bloc/app/usecase/usecase.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/repository/auth_repository.dart';

class GetAllAuthUsecase implements UsecaseWithoutParams {
  final IAuthRepository repository;
  GetAllAuthUsecase(this.repository);

  @override
  Future<Either<Failure, List<AuthEntity>>> call() {
    return repository.getAllAuth();
  }
}
