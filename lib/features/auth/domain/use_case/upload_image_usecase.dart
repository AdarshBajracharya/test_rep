import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:softwarica_student_management_bloc/app/usecase/usecase.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/repository/auth_repository.dart';

class UploadImageParams extends Equatable {
  final File? image;

  const UploadImageParams({required this.image});

  //intial constructor
  const UploadImageParams.initial({ required this.image});

  @override
  List<Object?> get props => [image];
}
class UploadImageUsecase implements UsecaseWithParams<void,UploadImageParams>{
  final IAuthRepository repository;

  UploadImageUsecase({required this.repository});

  @override
  Future<Either<Failure, void>> call(UploadImageParams params) {
    print("usecase ${params.image}");
    return repository.uploadProfilePicture(params.image);
  }
}
