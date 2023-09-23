import 'package:flutter/material.dart';
import 'package:forms_app/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: SafeArea(
        bottom: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlutterLogo(size: 100,),
            _RegisterForm(),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // CustomTextFormField(
          //   hintText: 'Hint text',
          //   label: 'Label text',
          //   errorMessage: null,
          //   onChanged: (value) {
          //     print(">>> $value");
          //   },
          //   validator: (value) {
          //     if( value == null ) return 'Campo es requerido';
          //     if(value.isEmpty) return 'Campo es requerido';
          //     if( value.trim().isEmpty ) return 'Campo es requerido';

          //     return null;
          //   },
          // ),
          const SizedBox(height: 10,),
          CustomTextFormField(
            label: 'Nombre del usuario',
            onChanged: (value) => username = value,
            validator: (value) {
              if ( value == null || value.isEmpty ) return 'Campo requerido';
              if ( value.trim().isEmpty ) return 'Campo requerido';
              if ( value.trim().length < 6 ) return 'Inserte más de 6 letras';
              return null;
            },
          ),

          const SizedBox(height: 10,),

          CustomTextFormField(
            label: 'Correo electrónico',
            onChanged: (value) => email = value,
            validator: (value) {
              if ( value == null || value.isEmpty ) return 'Campo requerido';
              if ( value.trim().isEmpty ) return 'Campo requerido';
              if ( value.trim().length < 6 ) return 'Inserte más de 6 letras';
              final emailRegExp = RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );
              if( !emailRegExp.hasMatch(value) ) return 'No tiene formato de correo';
              return null;
            },
          ),

          const SizedBox(height: 10,),

          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onChanged: (value) => password = value,
            validator: (value) {
              if ( value == null || value.isEmpty ) return 'Campo requerido';
              if ( value.trim().isEmpty ) return 'Campo requerido';
              if ( value.trim().length < 6 ) return 'Inserte más de 6 letras';
              return null;
            },
          ),

          const SizedBox(height: 20,),

          FilledButton.tonalIcon(
            onPressed: (){
              final isValid = _formKey.currentState!.validate();
              if ( !isValid ) return;
              print('>>> $username, $email, $password');
            }, 
            icon: const Icon(Icons.save), 
            label: const Text("Crear usuario")
          ),
        ],
      ));
  }
}