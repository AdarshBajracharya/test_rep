import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:softwarica_student_management_bloc/app/usecase/usecase.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/repository/auth_repository.dart';

class DeleteAuthParams extends Equatable {
  final String authId;

  const DeleteAuthParams(this.authId);

  @override
  List<Object?> get props => [authId];
}

class DeleteAuthUsecase implements UsecaseWithParams<void, DeleteAuthParams> {
  final IAuthRepository repository;

  DeleteAuthUsecase(this.repository);
  @override
  Future<Either<Failure, void>> call(DeleteAuthParams params) {
    return repository.deleteAuth(params.authId);
  }
}
