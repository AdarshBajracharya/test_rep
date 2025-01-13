import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';

abstract interface class IAuthDatasource {
  Future<void> createAuth(AuthEntity authEntity);
  Future<List<AuthEntity>> getAllAuth();
  Future<void> deleteAuth(String id);
}
