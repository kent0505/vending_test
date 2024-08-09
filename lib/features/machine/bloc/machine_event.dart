part of 'machine_bloc.dart';

abstract class MachineEvent {}

class GetMachinesEvent extends MachineEvent {}

class AddMachineEvent extends MachineEvent {
  final Machine machine;
  AddMachineEvent({required this.machine});
}

class EditMachineEvent extends MachineEvent {
  final Machine machine;
  EditMachineEvent({required this.machine});
}

class DeleteMachineEvent extends MachineEvent {
  final int id;
  DeleteMachineEvent({required this.id});
}

class EditProductEvent extends MachineEvent {
  final Product product;
  EditProductEvent({required this.product});
}
