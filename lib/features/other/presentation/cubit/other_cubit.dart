import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'other_state.dart';

class OtherCubit extends Cubit<OtherState> {
  OtherCubit() : super(OtherInitial());
}
