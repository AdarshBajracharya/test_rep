part of 'course_bloc.dart';

@immutable
sealed class CourseEvent extends Equatable {
  const CourseEvent();

  @override
  List<Object> get props => [];
}

final class LoadCourses extends CourseEvent {}

final class AddCourse extends CourseEvent {
  final String CourseName;
  const AddCourse(this.CourseName);

  @override
  List<Object> get props => [CourseName];
}

final class DeleteCourse extends CourseEvent {
  final String CourseId;

  const DeleteCourse(this.CourseId);

  @override
  List<Object> get props => [CourseId];
}
