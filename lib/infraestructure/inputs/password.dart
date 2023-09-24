



import 'package:formz/formz.dart';

enum PasswordError { empty, length }

class Password extends FormzInput<String, PasswordError> {

  const Password.pure() : super.pure('');

  const Password.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if ( isPure || isValid ) return null;
    if ( error == PasswordError.empty ) return 'No se permite campos vacíos';
    if ( error == PasswordError.length ) return 'La contraseña debe tener más de 5 carácteres';
    return null;
  }

  @override
  PasswordError? validator(String value) {
    if ( value.trim().isEmpty ) return PasswordError.empty;
    if ( value.trim().length < 6 ) return PasswordError.length;
    return null;
  }

}