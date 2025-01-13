import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softwarica_student_management_bloc/features/course/presentation/view_model/course_bloc.dart';

class CourseView extends StatelessWidget {
  CourseView({super.key});

  final courseNameController = TextEditingController();
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
                controller: courseNameController,
                decoration: const InputDecoration(
                  labelText: 'Course Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter course name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_batchViewFormKey.currentState!.validate()) {
                    context.read<CourseBloc>().add(
                          AddCourse(courseNameController.text.trim()),
                        );
                  }
                },
                child: const Text('Add Course'),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<CourseBloc, CourseState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (!state.isLoading) {
                      final batchList = state.courses;
                      if (batchList.isEmpty) {
                        return const Center(child: Text('No courses found.'));
                      }
                      return ListView.builder(
                        itemCount: batchList.length,
                        itemBuilder: (context, index) {
                          if (index < batchList.length) {
                            return ListTile(
                              title: Text(batchList[index].courseName),
                              subtitle: Text(state.courses[index].courseId!),
                              trailing: IconButton(
                                  onPressed: () {
                                    context.read<CourseBloc>().add(DeleteCourse(
                                        state.courses[index].courseId!));
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
