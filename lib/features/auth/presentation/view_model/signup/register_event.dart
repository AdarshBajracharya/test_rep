part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

// class NavigateLoginScreenEvent extends RegisterEvent {
//   final BuildContext context;
//   final Widget destination;

//   const NavigateLoginScreenEvent({
//     required this.context,
//     required this.destination,
//   });
// }

class LoadCoursesAndBatches extends RegisterEvent {}

class RegisterStudent extends RegisterEvent {}
