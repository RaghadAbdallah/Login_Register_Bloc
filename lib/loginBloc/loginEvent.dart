import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';


abstract class RegisterEvent extends Equatable{
  const RegisterEvent();

  @override
  List<Object> get props =>[];

}

class SignUpPressed extends RegisterEvent{
  late String email, password;
  SignUpPressed({ required this.email,  required this.password});
}

