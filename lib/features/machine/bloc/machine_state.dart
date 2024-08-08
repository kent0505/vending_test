part of 'machine_bloc.dart';

abstract class MachineState {}

class MachineInitial extends MachineState {}

class MachinesLoadedState extends MachineState {
  final List<Machine> machines;
  MachinesLoadedState({required this.machines});
}
