import 'package:frontend/domain/dto/credentials.dart';
import 'package:lucid_validation/lucid_validation.dart';

class CredentialsValidator extends LucidValidator<Credentials> {
  CredentialsValidator() {
    ruleFor((credentials) => credentials.email, key: 'email').notEmpty().validEmail();

    ruleFor((credentials) => credentials.password, key: 'password')
        .notEmpty()
        .minLength(6)
        .maxLength(20)
        .mustHaveLowercase()
        .mustHaveUppercase()
        .mustHaveSpecialCharacter()
        .mustHaveNumber();
  }
}
