


import 'package:formz/formz.dart';

enum EmailError { empty, format }

class Email extends FormzInput<String, EmailError> {

  static const regExp = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

  const Email.pure() : super.pure('');

  const Email.dirty(String value) : super.dirty(value);

  String? get messageError {
    if( isValid || isPure ) return null;
    if( error == EmailError.empty ) return 'No se permiten campos vacíos';
    if( error == EmailError.format ) return 'No tiene el formato de un correo';
    return null;
  }

  @override
  EmailError? validator(String value) {
    if ( value.trim().isEmpty ) return EmailError.empty;
    if ( !RegExp(regExp).hasMatch(value) ) return EmailError.format;
    return null;
  }

}