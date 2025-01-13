import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:softwarica_student_management_bloc/app/usecase/usecase.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/entity/course_entity.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/repository/course_repository.dart';

class CreateCourseParams extends Equatable {
  final String CourseName;

  const CreateCourseParams({required this.CourseName});
  @override
  List<Object?> get props => [CourseName];
}

//use case domain layer ko repository snga dependednt xa kina  vane paxi internet xaina vane decision repository le linxa ani tei anusar data flow hunxa

//sucess vaye paxi k retuurn garxa , params type
class CreateCourseUsecase
    implements UsecaseWithParams<void, CreateCourseParams> {
  final ICourseRepository repository;

  CreateCourseUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(CreateCourseParams params) {
    //convert params to object.

    var courseEntity = CourseEntity(courseName: params.CourseName);
    return repository.createCourse(courseEntity);
  }
}
