import 'package:softwarica_student_management_bloc/core/network/hive_service.dart';
import 'package:softwarica_student_management_bloc/features/batch/data/data_source/batch_datasource.dart';
import 'package:softwarica_student_management_bloc/features/batch/data/model/batch_hive_model.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/entity/batch_entity.dart';

class BatchLocalDatasource implements IBatchDatasource{
  final HiveService hiveService;

  BatchLocalDatasource({required this.hiveService});
  @override
  Future<void> createBatch(BatchEntity BatchEntity) async{
    try{
       var batchHiveModel = BatchHiveModel.fromEntity(BatchEntity); 
       await hiveService.addBatch(batchHiveModel);
    }
    catch(e){
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteBatch(String id) async {
    try{
      await hiveService.deleteBatch(id);
    }
    catch(e){
      throw Exception(e);
    }
  }

  @override
  Future<List<BatchEntity>> getAllBatch() async {
     try{
      // await _hiveService.getAllBatches();
      return hiveService.getAllBatches().then(
        (value){
          return value.map((e)=>e.toEntity()).toList();
        }
      );
    }
    catch(e){ 
      throw Exception(e);
    }
  }
}