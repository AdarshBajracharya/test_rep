part of 'course_bloc.dart';

class CourseState extends Equatable {
  final List<CourseEntity> courses;
  final bool isLoading;
  final String? error;

  const CourseState({
    required this.courses,
    required this.isLoading,
    this.error,
  });

  factory CourseState.initial() {
    return CourseState(
      courses: [],
      isLoading: false,
    );
  }

  CourseState copyWith({
    List<CourseEntity>? Coursees,
    bool? isLoading,
    String? error,
  }) {
    return CourseState(
      courses: Coursees ?? courses,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [courses, isLoading, error];
}
