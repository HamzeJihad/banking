import 'package:flutter/material.dart';
import 'package:flutter_vaden/flutter_vaden.dart';
import 'package:frontend/core/ui/custom_text_field.dart';
import 'package:frontend/core/ui/logo_widget.dart';
import 'package:frontend/core/ui/primary_button.dart';
import 'package:frontend/domain/dto/credentials.dart';
import 'package:frontend/domain/validations/credentials_validator.dart';
import 'package:frontend/ui/auth/stores/auth_store.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _validator = CredentialsValidator();
  final credential = Credentials();

  bool _isPasswordVisible = false;

  _enter() async {
    final store = context.read<AuthStore>();

    if (store.loginCommand.value.isRunning) return;
    await store.loginCommand.execute(credential);

    if (store.loginCommand.value.isFailure) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao tentar fazer login')));
      }
    }
    if(store.loginCommand.value.isSuccess){
     print('Login bem-sucedido');
    } 
  }

  @override
  Widget build(BuildContext context) {
    final store = context.read<AuthStore>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),

          child: SizedBox(
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Hero(
                  tag: 'app_logo',
                  child: SizedBox(height: 150, child: LogoWidget()),
                ),
                const SizedBox(height: 48.0),
                CustomTextFormField(
                  onChanged: credential.setEmail,
                  labelText: 'Email',
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: _validator.byField(credential, 'email'),
                ),
                const SizedBox(height: 16.0),
                CustomTextFormField(
                  onChanged: credential.setPassword,
                  validator: _validator.byField(credential, 'password'),
                  labelText: 'Senha',
                  prefixIcon: Icons.lock,
                  obscureText: !_isPasswordVisible,
                  suffixIcon: IconButton(
                    icon: Icon(_isPasswordVisible ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(onPressed: () {}, child: const Text('Esqueceu a senha?')),
                ),
                const SizedBox(height: 16.0),

                ListenableBuilder(
                  listenable: Listenable.merge([credential, store.loginCommand]),
                  builder: (context, child) {
                    final isRunning = store.loginCommand.value.isRunning;
                    final isValid = _validator.validate(credential).isValid;
                    final enabled = isValid && !isRunning;
                    return PrimaryButton(onPressed: enabled ? _enter : null, text: 'Entrar', isLoading: isRunning);
                  },
                ),
                const SizedBox(height: 24.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Não tem uma conta?'),
                    TextButton(
                      onPressed: () {
                        context.go('/register');
                      },
                      child: const Text('Cadastre-se'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
