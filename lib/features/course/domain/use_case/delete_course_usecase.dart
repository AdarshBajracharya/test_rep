import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:softwarica_student_management_bloc/app/usecase/usecase.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/repository/course_repository.dart';

class DeleteCourseParams extends Equatable {
  final String CourseId;

  const DeleteCourseParams(this.CourseId);

  @override
  List<Object?> get props => [CourseId];
}

class DeleteCourseUsecase
    implements UsecaseWithParams<void, DeleteCourseParams> {
  final ICourseRepository repository;

  DeleteCourseUsecase(this.repository);
  @override
  Future<Either<Failure, void>> call(DeleteCourseParams params) {
    return repository.deleteCourse(params.CourseId);
  }
}
