part of 'machine_bloc.dart';

abstract class MachineState {}

class MachineInitial extends MachineState {}

class SecondPageState extends MachineState {
  final String title;
  SecondPageState({required this.title});
}

class ThirdPageState extends MachineState {
  final String title;
  ThirdPageState({required this.title});
}
