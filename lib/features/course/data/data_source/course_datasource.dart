import 'package:softwarica_student_management_bloc/features/batch/domain/entity/batch_entity.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/entity/course_entity.dart';

abstract interface class ICourseDatasource {
  Future<void>createCourse(CourseEntity  courseEntity);
  Future <List<CourseEntity>>getAllCourse();
  Future<void>deleteCourse(String id);
}