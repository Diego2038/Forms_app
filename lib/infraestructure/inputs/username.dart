import 'package:formz/formz.dart';

// Define input validation errors
enum UsernameError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Username extends FormzInput<String, UsernameError> {
  // Call super.pure to represent an unmodified form input.
  const Username.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Username.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if ( isPure || isValid ) return null;
    if ( error == UsernameError.empty ) return 'El campo no puede ser vacío';
    if ( error == UsernameError.length ) return 'Debe tener más de 5 carácteteres';
    return null;
  } 

  // Override validator to handle validating a given input value.
  @override
  UsernameError? validator(String value) {
    if ( value.trim().isEmpty ) return UsernameError.empty;
    if ( value.trim().length < 6 ) return UsernameError.length;
    return null;
  }
}