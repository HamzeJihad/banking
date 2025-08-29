# BANKING - Sistema de Carteira Digital

![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)

BANKING é um sistema completo de carteira digital desenvolvido para facilitar transações financeiras em ambientes onde o uso de dinheiro físico é restrito, como escolas e eventos. O sistema substitui tickets tradicionais por créditos digitais, tornando o processo mais seguro, prático e transparente.

## 📱 Funcionalidades

### Para Usuários

- ✅ **Criação de conta** - Registro seguro no sistema
- 💰 **Gestão de carteira** - Visualização de saldo e histórico
- 💸 **Transferências** - Envio de créditos entre usuários
- 📊 **Extrato detalhado** - Histórico completo de transações
- 🔐 **Autenticação segura** - Login protegido por JWT

### Para Administradores

- 👥 **Gestão de usuários** - Controle completo de contas
- 📈 **Relatórios financeiros** - Acompanhamento de transações
- 🛡️ **Controle de acesso** - Diferentes níveis de permissão
- 📋 **Auditoria** - Rastreamento de todas as operações

## 🏗️ Arquitetura do Projeto

O projeto utiliza uma arquitetura modular dividida em três pacotes principais:

```
BANKING/
├── 🎯 domain/          # Regras de negócio compartilhadas
├── 🖥️ backend/         # API REST com Vaden Framework
├── 📱 frontend/        # Aplicativo Flutter
└── 📄 README.md        # Este arquivo
```

### 🎯 Domain Package

Centraliza toda a lógica de negócio compartilhada entre frontend e backend:

- **DTOs**: Objetos de transferência de dados
- **Entities**: Entidades do domínio (User, Wallet, Transaction)
- **Repositories**: Interfaces dos repositórios
- **Parsers**: Conversores de tipos (Decimal, etc.)

### 🖥️ Backend

API REST construída com o framework Vaden:

- **Controllers**: Endpoints da API
- **Repositories**: Implementação do acesso a dados
- **Security**: Autenticação JWT e autorização
- **Database**: Integração com PostgreSQL via Drift ORM

### 📱 Frontend

Aplicativo móvel desenvolvido em Flutter:

- **Multiplataforma**: iOS, Android, Web
- **Interface moderna**: Material Design
- **Integração com API**: Consumo dos serviços backend

## 🛠️ Tecnologias Utilizadas

### Backend

- **[Vaden Framework](https://pub.dev/packages/vaden)** - Framework web para Dart
- **[Drift ORM](https://pub.dev/packages/drift)** - Object-Relational Mapping
- **[PostgreSQL](https://www.postgresql.org/)** - Banco de dados relacional
- **[JWT](https://jwt.io/)** - Autenticação via tokens
- **[Decimal](https://pub.dev/packages/decimal)** - Precisão decimal para valores monetários

### Frontend

- **[Flutter](https://flutter.dev/)** - Framework UI multiplataforma
- **[Dart](https://dart.dev/)** - Linguagem de programação

### DevOps

- **[Docker](https://www.docker.com/)** - Containerização
- **[Docker Compose](https://docs.docker.com/compose/)** - Orquestração de containers

## 🚀 Instalação e Configuração

### Pré-requisitos

- Dart SDK 3.8.0+
- Flutter 3.0.0+
- PostgreSQL 12+
- Docker (opcional)

### 1. Clone o repositório

```bash
git clone https://github.com/HamzeJihad/banking.git
cd banking
```

### 2. Configuração do Domain Package

```bash
cd domain
dart pub get
```

### 3. Configuração do Backend

#### Usando Docker (Recomendado)

```bash
cd backend
docker-compose up -d  # Inicia PostgreSQL
dart pub get
dart run build_runner build  # Gera código do Drift
dart run bin/server.dart
```

#### Configuração Manual

1. Configure o PostgreSQL
2. Edite `backend/application.yaml` com suas credenciais
3. Execute as migrações:

```bash
cd backend
dart pub get
dart run build_runner build
dart run bin/server.dart
```

### 4. Configuração do Frontend

```bash
cd frontend
flutter pub get
flutter run
```

## 📡 API Endpoints

### Autenticação

- `POST /auth/login` - Login do usuário
- `POST /auth/refresh` - Renovar token

### Usuários

- `POST /users/create` - Criar usuário
- `GET /users/{id}` - Buscar usuário por ID
- `PUT /users/change-password` - Alterar senha

### Carteira

- `GET /wallet/byUser` - Buscar carteira do usuário logado
- `POST /wallet/transfer` - Transferir fundos
- `GET /wallet/extracts/{page}/{walletId}` - Buscar extrato paginado

## 📊 Modelo de Dados

### Principais Entidades

#### User

```dart
class UserEntity {
  final int id;
  final String name;
  final String email;
  final String password;
  final UserRole role;  // admin, user, guest
  final DateTime createdAt;
  final DateTime updatedAt;
}
```

#### Wallet

```dart
class WalletEntity {
  final int id;
  final Decimal balance;
  final int userId;
}
```

#### Transaction

```dart
class TransactionEntity {
  final int id;
  final int fromWalletId;
  final int toWalletId;
  final Decimal amount;
  final DateTime createdAt;
}
```

## 🔐 Segurança

- **Autenticação JWT**: Tokens seguros para autenticação
- **Autorização por roles**: Diferentes níveis de acesso (admin, user, guest)
- **Validação de dados**: Validação rigorosa em todos os endpoints
- **Precisão decimal**: Uso de Decimal para evitar erros de ponto flutuante
- **Hashing de senhas**: Senhas protegidas com hash seguro

## 💰 Casos de Uso

### Escolas

- Cantinas escolares sem dinheiro físico
- Eventos e feiras da escola
- Controle de gastos dos estudantes

### Eventos

- Festas juninas e festivais
- Shows e apresentações
- Feiras e exposições

### Empresas

- Refeitórios corporativos
- Eventos internos
- Sistemas de bonificação

## 🧪 Testes

```bash
# Testes do Backend
cd backend
dart test

# Testes do Domain
cd domain
dart test

# Testes do Frontend
cd frontend
flutter test
```

## 📦 Build e Deploy

### Backend

```bash
cd backend
dart compile exe bin/server.dart -o banking-server
```

### Frontend

```bash
cd frontend
# Android
flutter build apk --release

# iOS
flutter build ios --release

# Web
flutter build web --release
```

## 🤝 Contribuição

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📋 Roadmap

- [ ] Interface administrativa web
- [ ] Notificações push
- [ ] Relatórios avançados
- [ ] Integração com gateways de pagamento
- [ ] API para terceiros
- [ ] App para estabelecimentos

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 👨‍💻 Autor

**Hamze Jihad**

- GitHub: [@HamzeJihad](https://github.com/HamzeJihad)

## 🙏 Agradecimentos

- [Flutterando](https://flutterando.com.br/) - Comunidade e aprendizado
- [Vaden Framework](https://pub.dev/packages/vaden) - Framework backend em Dart
- [Flutter Team](https://flutter.dev/) - Framework mobile incrível

---

⭐ **Se este projeto te ajudou, considere dar uma estrela!** ⭐
