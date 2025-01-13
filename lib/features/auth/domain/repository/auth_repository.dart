import 'package:dartz/dartz.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, void>> createAuth(AuthEntity authEntity);
  Future<Either<Failure, List<AuthEntity>>> getAllAuth();
  Future<Either<Failure, void>> deleteAuth(String id);
}
