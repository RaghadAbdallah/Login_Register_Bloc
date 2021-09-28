import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:weather/reposeitories/repositories.dart';
import 'SignUpEvent.dart';
import 'SignUpState.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  UserRepository userRepository;

  SignUpBloc({ required this.userRepository}) : super(SignUpInitial());

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    if (event is SignInButtonPressed) {
      yield SignUpLoading();

      try {
        var user = await userRepository.signUp(event.email, event.password);
        yield SignUpSucced(user: user!);
      } catch (e) {
        yield SignUpFailed(message: e.toString());
      }
    }
  }
}
