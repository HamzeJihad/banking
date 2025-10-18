import 'package:frontend/domain/dto/register_credentials.dart';
import 'package:lucid_validation/lucid_validation.dart';

class RegisterCredentialsValidator extends LucidValidator<RegisterCredentials> {
  RegisterCredentialsValidator() {
    ruleFor((c) => c.name, key: 'name')
        .notEmpty(message: 'O nome é obrigatório.')
        .minLength(3, message: 'O nome deve ter pelo menos 3 caracteres.');

    ruleFor((c) => c.email, key: 'email').notEmpty().validEmail();

    ruleFor((c) => c.password, key: 'password')
        .notEmpty()
        .minLength(6)
        .maxLength(20)
        .mustHaveLowercase()
        .mustHaveUppercase()
        .mustHaveSpecialCharacter()
        .mustHaveNumber();

    ruleFor((c) => c.confirmPassword, key: 'confirmPassword')
        .notEmpty(message: 'Confirme sua senha.')
        .equalTo((c) => c.password);
  }
}