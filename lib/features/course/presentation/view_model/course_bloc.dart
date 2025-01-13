import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softwarica_student_management_bloc/features/Course/domain/use_case/create_Course_usecase.dart';
import 'package:softwarica_student_management_bloc/features/Course/domain/use_case/delete_Course_usecase.dart';
import 'package:softwarica_student_management_bloc/features/Course/domain/use_case/get_all_Course_usecase.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/entity/course_entity.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CreateCourseUsecase _createCourseUsecase;
  final GetAllCourseUsecase _getAllCourseUsecase;
  final DeleteCourseUsecase _deleteCourseUsecase;

  CourseBloc({
    required CreateCourseUsecase createCourseUsecase,
    required GetAllCourseUsecase getAllCourseUsecase,
    required DeleteCourseUsecase deleteCourseUsecase,
  })  : _createCourseUsecase = createCourseUsecase,
        _getAllCourseUsecase = getAllCourseUsecase,
        _deleteCourseUsecase = deleteCourseUsecase,
        super(CourseState.initial()) {
    on<LoadCourses>(_onLoadCoursees);
    on<AddCourse>(_onAddCourse);
    on<DeleteCourse>(_onDeleteCourse);
    add(LoadCourses());
  }

  Future<void> _onLoadCoursees(
      LoadCourses event, Emitter<CourseState> emit) async {
    //progress bar ghumaune

    emit(state.copyWith(isLoading: true));

    //data lai laune

    var result = await _getAllCourseUsecase.call();
    result.fold(
        (l) => //in case of failure
            emit(state.copyWith(isLoading: false, error: l.toString())),
        (r) => //in case of success
            emit(state.copyWith(isLoading: false, Coursees: r)));
  }

  Future<void> _onAddCourse(AddCourse event, Emitter<CourseState> emit) async {
    //progress bar ghumaune

    emit(state.copyWith(isLoading: true));

    //data lai laune

    var result = await _createCourseUsecase
        .call(CreateCourseParams(CourseName: event.CourseName));
    result.fold(
        (l) => //in case of failure
            emit(state.copyWith(isLoading: false, error: l.toString())),
        (r) => //in case of success
            emit(state.copyWith(isLoading: false)));

    //database bata tanera feri load Coursees wala function recall garxa ra page refresh hunxa
    add(LoadCourses());
  }

  Future<void> _onDeleteCourse(
      DeleteCourse event, Emitter<CourseState> emit) async {
    //progress bar ghumaune

    emit(state.copyWith(isLoading: true));

    //data lai laune

    var result =
        await _deleteCourseUsecase.call(DeleteCourseParams(event.CourseId));
    result.fold(
        (l) => //in case of failure
            emit(state.copyWith(isLoading: false, error: l.toString())),
        (r) => //in case of success
            emit(state.copyWith(isLoading: false)));

    //database bata tanera feri load Coursees wala function recall garxa ra page refresh hunxa
    add(LoadCourses());
  }
}
