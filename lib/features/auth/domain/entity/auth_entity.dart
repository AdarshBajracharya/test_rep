import 'package:equatable/equatable.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/entity/batch_entity.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/entity/course_entity.dart';

class AuthEntity extends Equatable {
  final String? authId;
  final String fName;
  final String lName;
  final String? image;
  final String phoneNo;
  //foreign key
  final BatchEntity batchEntity;
  final List<CourseEntity> courseEntity;
  final String username;
  final String password;

  const AuthEntity(
      {this.authId,
      required this.fName,
      required this.lName,
      this.image,
      required this.password,
      required this.phoneNo,
      required this.batchEntity,
      required this.courseEntity,
      required this.username});

  @override
  List<Object?> get props => [authId];
}
