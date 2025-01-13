import 'package:dartz/dartz.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/course/data/data_source/local_datasource/course_local_datasource.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/entity/course_entity.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/repository/course_repository.dart';

class CourseLocalRepository implements ICourseRepository {
  final CourseLocalDatasource _courseLocalDatasource;

  CourseLocalRepository(this._courseLocalDatasource);

  @override
  Future<Either<Failure, void>> createCourse(CourseEntity courseEntity) {
    try {
      _courseLocalDatasource.createCourse(courseEntity);
      return Future.value(Right(null));
    } catch (e) {
      return Future.value(Left(LocalDatabaseFailure(message: 'e')));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCourse(String id) {
    try {
      _courseLocalDatasource.deleteCourse(id);
      return Future.value(Right(null));
    } catch (e) {
      return Future.value(Left(LocalDatabaseFailure(message: 'e')));
    }
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getAllCourses()async {
    try {
      var coursees =  await _courseLocalDatasource.getAllCourse();
      return Future.value(Right(coursees));
    } catch (e) {
      return Future.value(Left(LocalDatabaseFailure(message: 'e')));
    }
  }
}
