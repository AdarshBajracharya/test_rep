import 'package:softwarica_student_management_bloc/core/network/hive_service.dart';
import 'package:softwarica_student_management_bloc/features/auth/data/data_source/auth_datasource.dart';
import 'package:softwarica_student_management_bloc/features/auth/data/model/auth_hive_model.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';

class AuthLocalDatasource implements IAuthDatasource {
  final HiveService hiveService;

  AuthLocalDatasource({required this.hiveService});
  @override
  Future<void> createAuth(AuthEntity authEntity) async {
    try {
      var authHiveModel = AuthHiveModel.fromEntity(authEntity);
      await hiveService.addAuth(authHiveModel);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteAuth(String id) async {
    try {
      await hiveService.deleteAuth(id);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<AuthEntity>> getAllAuth() async {
    try {
      // await _hiveService.getAllAuth();
      return hiveService.getAllAuth().then((value) {
        return value.map((e) => e.toEntity()).toList();
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
