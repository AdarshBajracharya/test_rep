import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/repository/auth_repository.dart';

class AuthRemoteRepository implements IAuthRepository{
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRemoteRepository({required this.authRemoteDataSource});
  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> loginStudent(String username, String password) async {
  try {
    final token = await authRemoteDataSource.loginStudent(username, password);
    return Right(token);
  } catch (e) {
    return Left(ApiFailure(message: "Login failed: ${e.toString()}"));
  }
}
  

  @override
  Future<Either<Failure, void>> registerStudent(AuthEntity student)async {
    try{
      await authRemoteDataSource.registerStudent(student);
      return Right(null);
    }
    catch(e){
      return Left(ApiFailure(message: e.toString()));
    }

  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File? file)async {
    try{
      print("remote repository ${file}");
      await authRemoteDataSource.uploadProfilePicture(file);
      return Right("upload image uploaded in remote repository");
    }
    catch(e){
      return Left(ApiFailure(message: e.toString()));
    }
  }
}