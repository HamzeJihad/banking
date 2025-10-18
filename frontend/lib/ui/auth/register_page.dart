import 'package:flutter/material.dart';
import 'package:frontend/core/ui/custom_text_field.dart';
import 'package:frontend/core/ui/logo_widget.dart';
import 'package:frontend/core/ui/primary_button.dart';
import 'package:frontend/domain/dto/register_credentials.dart';
import 'package:frontend/domain/validations/register_credentials_validator.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _validator = RegisterCredentialsValidator();
  final credentials = RegisterCredentials();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  _register() {
    // Lógica de cadastro aqui
    // Ex: Chamar um use case, repositório, etc.
    print('Nome: ${credentials.name}');
    print('Email: ${credentials.email}');

    // Após o sucesso, você pode navegar para a home ou login
    context.go('/home'); // Exemplo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SizedBox(
            // Garante que o conteúdo se ajuste à tela sem overflow
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 150, child: LogoWidget()),
                const SizedBox(height: 48.0),

                CustomTextFormField(
                  onChanged: credentials.setName,
                  labelText: 'Nome',
                  prefixIcon: Icons.person,
                  validator: _validator.byField(credentials, 'name'),
                ),
                const SizedBox(height: 16.0),

                CustomTextFormField(
                  onChanged: credentials.setEmail,
                  labelText: 'Email',
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: _validator.byField(credentials, 'email'),
                ),
                const SizedBox(height: 16.0),

                CustomTextFormField(
                  onChanged: credentials.setPassword,
                  validator: _validator.byField(credentials, 'password'),
                  labelText: 'Senha',
                  prefixIcon: Icons.lock,
                  obscureText: !_isPasswordVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                  ),
                ),
                const SizedBox(height: 16.0),

                CustomTextFormField(
                  onChanged: credentials.setConfirmPassword,
                  validator: _validator.byField(credentials, 'confirmPassword'),
                  labelText: 'Confirmar Senha',
                  prefixIcon: Icons.lock_outline,
                  obscureText: !_isConfirmPasswordVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () => setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible),
                  ),
                ),
                const SizedBox(height: 24.0),

                ListenableBuilder(
                  listenable: credentials,
                  builder: (context, child) {
                    final valid = _validator.validate(credentials).isValid;
                    return PrimaryButton(
                      isLoading: false,
                      onPressed: valid ? _register : null,
                      text: 'Cadastrar',
                    );
                  }
                ),
                const SizedBox(height: 24.0),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Já tem uma conta?'),
                    TextButton(
                      onPressed: () {
                        context.go('/login'); // Navega de volta para o login
                      },
                      child: const Text('Faça login'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}