part of 'machine_bloc.dart';

abstract class MachineEvent {}

class ChangeIndexEvent extends MachineEvent {
  final int index;
  ChangeIndexEvent({required this.index});
}
