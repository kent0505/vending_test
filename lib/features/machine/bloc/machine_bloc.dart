import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/machine.dart';
import '../../../core/models/product.dart';
import '../../../core/utils.dart';

part 'machine_event.dart';
part 'machine_state.dart';

class MachineBloc extends Bloc<MachineEvent, MachineState> {
  List<Machine> _machines = [];
  List<Product> _products = [];

  MachineBloc() : super(MachineInitial()) {
    on<GetMachinesEvent>((event, emit) async {
      if (machinesList.isEmpty) {
        _machines = await getModels();
        _products = getProducts();
        emit(MachinesLoadedState(
          machines: _machines,
          products: _products,
        ));
      } else {
        emit(MachinesLoadedState(
          machines: _machines,
          products: _products,
        ));
      }
    });

    on<AddMachineEvent>((event, emit) async {
      machinesList.add(event.machine);
      _machines = await updateModels();
      _products = getProducts();
      emit(MachinesLoadedState(
        machines: _machines,
        products: _products,
      ));
    });

    on<EditMachineEvent>((event, emit) async {
      for (Machine machine in machinesList) {
        if (machine.id == event.machine.id) {
          machine.name = event.machine.name;
          machine.location = event.machine.location;
          machine.type = event.machine.type;
          machine.products = event.machine.products;
        }
      }
      _machines = await updateModels();
      _products = getProducts();
      emit(MachinesLoadedState(
        machines: _machines,
        products: _products,
      ));
    });

    on<DeleteMachineEvent>((event, emit) async {
      machinesList.removeWhere((element) => element.id == event.id);
      _machines = await updateModels();
      _products = getProducts();
      emit(MachinesLoadedState(
        machines: _machines,
        products: _products,
      ));
    });
  }
}
