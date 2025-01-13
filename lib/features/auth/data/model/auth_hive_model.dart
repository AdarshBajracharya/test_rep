import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:softwarica_student_management_bloc/app/constants/hive_table_constant.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';
import 'package:softwarica_student_management_bloc/features/batch/data/model/batch_hive_model.dart';
import 'package:softwarica_student_management_bloc/features/course/data/model/course_hive_model.dart';
import 'package:uuid/uuid.dart';

// dart run build_runner build -d

part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.studentTableId)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String? authId;
  @HiveField(1)
  final String fname;
  @HiveField(2)
  final String lname;
  @HiveField(3)
  final String? image;
  @HiveField(4)
  final String phoneNo;
  @HiveField(5)
  final BatchHiveModel batch;
  @HiveField(6)
  final List<CourseHiveModel> courses;
  @HiveField(7)
  final String username;
  @HiveField(8)
  final String password;

  AuthHiveModel({
    String? authId,
    required this.fname,
    required this.lname,
    this.image,
    required this.phoneNo,
    required this.batch,
    required this.courses,
    required this.username,
    required this.password,
  }) : authId = authId ?? const Uuid().v4();

  const AuthHiveModel.initial()
      : authId = "",
        fname = "",
        lname = "",
        image = "",
        phoneNo = "",
        batch = const BatchHiveModel.intial(),
        courses = const [],
        username = "",
        password = "";

  //database le hivemodel matta bujxa so ui bata ako entity lai hive ma convert garxa esle
  factory AuthHiveModel.fromEntity(AuthEntity entity) {
    return AuthHiveModel(
      authId: entity.authId,
      fname: entity.fName,
      lname: entity.lName,
      image: entity.image,
      phoneNo: entity.phoneNo,
      batch: BatchHiveModel.fromEntity(entity.batchEntity),
      courses: CourseHiveModel.fromEntityList(entity.courseEntity),
      username: entity.username,
      password: entity.password,
    );
  }

  // ui le entity matra linxa so data tanda yo use hunxa
  AuthEntity toEntity() {
    return AuthEntity(
      authId: authId,
      fName: fname,
      lName: lname,
      image: image,
      phoneNo: phoneNo,
      batchEntity: batch.toEntity(),
      courseEntity: CourseHiveModel.toEntityList(courses),
      username: username,
      password: password,
    );
  }

  @override
  List<Object?> get props => [
        authId,
        fname,
        lname,
        image,
        phoneNo,
        batch,
        courses,
        username,
        password
      ];
}
