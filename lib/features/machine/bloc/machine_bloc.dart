import 'package:flutter_bloc/flutter_bloc.dart';

part 'machine_event.dart';
part 'machine_state.dart';

class MachineBloc extends Bloc<MachineEvent, MachineState> {
  MachineBloc() : super(MachineInitial()) {
    on<ChangeIndexEvent>((event, emit) {
      if (event.index == 0) {
        emit(MachineInitial());
      } else if (event.index == 1) {
        emit(SecondPageState(title: ''));
      }
    });
  }
}
