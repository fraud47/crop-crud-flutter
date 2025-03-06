import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../hive/hive.dart';

part 'token_event.dart';
part 'token_state.dart';

class TokenBloc extends Bloc<TokenEvent, TokenState> {
  TokenBloc() : super(TokenInitial()){
    on<CheckLoginStatus>(_onCheckLoginStatus);
  }
  void _onCheckLoginStatus(CheckLoginStatus event, Emitter<TokenState> emit) async {
    emit(TokenLoading());
    try {
        var box = MainBoxMixin.mainBox;
        if (box != null) {
          final isLogin = box.get(MainBoxKeys.isLogin.name);
          if (isLogin != null && isLogin == true) {
             emit(TokenSuccess());
          } else {
            emit(TokenFailure('failed login'));
          }
        } else {
          emit(TokenFailure("failed"));
        }
      } catch (e) {
        emit(TokenFailure(e.toString()));
      }
    }
  }

