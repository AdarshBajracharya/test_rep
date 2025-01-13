import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:softwarica_student_management_bloc/app/constants/hive_table_constant.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/entity/course_entity.dart';
import 'package:uuid/uuid.dart';

// dart run build_runner build -d

part 'course_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.courseTableId)
class CourseHiveModel extends Equatable {
  @HiveField(0)
  final String? courseId;

  @HiveField(1)
  final String courseName;

  CourseHiveModel({
    String? courseId,
    required this.courseName,
  }) : courseId = courseId ?? const Uuid().v4();

  const CourseHiveModel.intial()
      : courseId = "",
        courseName = "";

  //database le hivemodel matta bujxa so ui bata ako entity lai hive ma convert garxa esle
  factory CourseHiveModel.fromEntity(CourseEntity entity) {
    return CourseHiveModel(
        courseId: entity.courseId, courseName: entity.courseName);
  }

  // ui le entity matra linxa so data tanda yo use hunxa
  CourseEntity toEntity() {
    return CourseEntity(courseId: courseId, courseName: courseName);
  }

  static List<CourseHiveModel> fromEntityList(List<CourseEntity> entities) {
    return entities.map((e) => CourseHiveModel.fromEntity(e)).toList();
  }

  static List<CourseEntity> toEntityList(List<CourseHiveModel> entities) {
    return entities.map((e) => e.toEntity()).toList();
  }

  @override
  List<Object?> get props => [courseId, courseName];
}
