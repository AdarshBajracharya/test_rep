import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softwarica_student_management_bloc/features/batch/presentation/view_model/batch_bloc.dart';

class BatchView extends StatelessWidget {
  BatchView({super.key});

  final batchNameController = TextEditingController();
  final _batchViewFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _batchViewFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: batchNameController,
                decoration: const InputDecoration(
                  labelText: 'Batch Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter batch name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_batchViewFormKey.currentState!.validate()) {
                    context.read<BatchBloc>().add(
                          AddBatch(batchNameController.text.trim()),
                        );
                  }
                },
                child: const Text('Add Batch'),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<BatchBloc, BatchState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (!state.isLoading) {
                      final batchList = state.batches;
                      if (batchList.isEmpty) {
                        return const Center(child: Text('No batches found.'));
                      }
                      return ListView.builder(
                        itemCount: batchList.length,
                        itemBuilder: (context, index) {
                          if (index < batchList.length) {
                            return ListTile(
                              title: Text(batchList[index].batchName),
                              subtitle: Text(state.batches[index].batchId!),
                              trailing: IconButton(
                                  onPressed: () {
                                    context.read<BatchBloc>().add(DeleteBatch(
                                        state.batches[index].batchId!));
                                  },
                                  icon: Icon(Icons.delete)),
                            );
                          } else {
                            return const SizedBox(); // Handle invalid index
                          }
                        },
                      );
                    } else {
                      return const Center(child: Text('Unexpected state.'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
