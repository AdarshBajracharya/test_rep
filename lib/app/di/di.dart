import 'package:get_it/get_it.dart';
import 'package:softwarica_student_management_bloc/core/network/hive_service.dart';
import 'package:softwarica_student_management_bloc/features/Course/domain/use_case/create_Course_usecase.dart';
import 'package:softwarica_student_management_bloc/features/Course/domain/use_case/delete_Course_usecase.dart';
import 'package:softwarica_student_management_bloc/features/Course/domain/use_case/get_all_Course_usecase.dart';
import 'package:softwarica_student_management_bloc/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:softwarica_student_management_bloc/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:softwarica_student_management_bloc/features/batch/data/data_source/local_datasource/batch_local_datasource.dart';
import 'package:softwarica_student_management_bloc/features/batch/data/repository/batch_local_repository.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/use_case/create_batch_usecase.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/use_case/delete_batch_usecase.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/use_case/get_all_batch_usecase.dart';
import 'package:softwarica_student_management_bloc/features/batch/presentation/view_model/batch_bloc.dart';
import 'package:softwarica_student_management_bloc/features/course/data/data_source/local_datasource/course_local_datasource.dart';
import 'package:softwarica_student_management_bloc/features/course/data/repository/course_local_repository.dart';
import 'package:softwarica_student_management_bloc/features/course/presentation/view_model/course_bloc.dart';
import 'package:softwarica_student_management_bloc/features/home/presentation/view_model/home_cubit.dart';
import 'package:softwarica_student_management_bloc/features/splash/presentation/view_model/splash_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  await _initBatchDependencies();
  await _initCourseDependencies();
  await _initHomeDependencies();
  await _initRegisterDependencies();
  await _initLoginDependencies();
  await _initSplashScreenDependencies();
  await _initHiveService();
}

_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initBatchDependencies() {
  //bottom to top approac ma dependency banaune

  //local data source
  getIt.registerLazySingleton<BatchLocalDatasource>(
      () => BatchLocalDatasource(hiveService: getIt()));

  //local data repository
  getIt.registerLazySingleton<BatchLocalRepository>(
      () => BatchLocalRepository(batchLocalDatasource: getIt()));

  //use case

  getIt.registerLazySingleton<GetAllBatchUsecase>(
      () => GetAllBatchUsecase(getIt<BatchLocalRepository>()));
  getIt.registerLazySingleton<CreateBatchUsecase>(
      () => CreateBatchUsecase(getIt<BatchLocalRepository>()));
  getIt.registerLazySingleton<DeleteBatchUsecase>(
      () => DeleteBatchUsecase(getIt<BatchLocalRepository>()));

  //bloc

  //register factory use garne kinaki harek state ko changes ma naya object create hunxa

  getIt.registerFactory<BatchBloc>(() => BatchBloc(
      createBatchUsecase: getIt<CreateBatchUsecase>(),
      getAllBatchUsecase: getIt<GetAllBatchUsecase>(),
      deleteBatchUsecase: getIt<DeleteBatchUsecase>()));
}

_initCourseDependencies() {
  //bottom to top approac ma dependency banaune

  //local data source
  getIt.registerLazySingleton<CourseLocalDatasource>(
      () => CourseLocalDatasource(getIt()));

  //local data repository
  getIt.registerLazySingleton<CourseLocalRepository>(
      () => CourseLocalRepository(getIt()));

  //use case

  getIt.registerLazySingleton<GetAllCourseUsecase>(
      () => GetAllCourseUsecase(getIt<CourseLocalRepository>()));
  getIt.registerLazySingleton<CreateCourseUsecase>(
      () => CreateCourseUsecase(getIt<CourseLocalRepository>()));
  getIt.registerLazySingleton<DeleteCourseUsecase>(
      () => DeleteCourseUsecase(getIt<CourseLocalRepository>()));

  //bloc

  //register factory use garne kinaki harek state ko changes ma naya object create hunxa

  getIt.registerFactory<CourseBloc>(() => CourseBloc(
      createCourseUsecase: getIt<CreateCourseUsecase>(),
      deleteCourseUsecase: getIt<DeleteCourseUsecase>(),
      getAllCourseUsecase: getIt<GetAllCourseUsecase>()));
}

_initHomeDependencies() async {
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );
}

_initRegisterDependencies() async {
  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      // loginBloc: getIt<LoginBloc>(),
      batchBloc: getIt<BatchBloc>(),
      courseBloc: getIt<CourseBloc>(),
    ),
  );
}

_initLoginDependencies() async {
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
    ),
  );
}

_initSplashScreenDependencies() async {
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(getIt<LoginBloc>()),
  );
}
