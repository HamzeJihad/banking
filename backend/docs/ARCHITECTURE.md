# ARCHITECTURE

Este arquivo mostrará como deverá ser feito o backend.

## Estrutura de pasta

```markdown
project/
├── lib/
│   ├── controllers/      # HTTP request handlers
│   ├── services/         # Business logic
│   ├── repositories/     # Data access layer
│   ├── models/           # Data models and DTOs
│   ├── middleware/       # Custom middleware
│   ├── guards/           # Authentication/authorization
│   ├── config/           # Configuration classes
│   └── main.dart         # Application entry point
├── bin/
│   └── server.dart       # Server executable
├── config/               # YAML configuration files
├── test/                 # Test files
└── pubspec.yaml          # Dependencies
```

## Design Patterns

### Controller

Exemplo de uso
```dart
@Controller('api/users')
class UserController {
    @Get('/<id>')
    Future<Response> getUser(@Param('id') String id){

    }
    @Post()
    Future<Response> createUser(@Body() CreateUserDto dto){

    }
}
```

### Core Annotations:

```dart
@Controller: Defines HTTP request handlers
@Get/@Post/@Put/@Delete: HTTP method mapping
@Param/@Query/@Body/@Header: Parameter binding
@UseGuards/@UseMiddleware: Cross-cutting concerns
```

### Injeção de dependência

Exemplo de uso com `@Configuration()`

```dart
@Configuration
class AppConfig {
  @Bean()
  DatabaseService database() => DatabaseService();

  @Bean()
  InnerService service(DatabaseService db) => InnerService();
}
```

> Os métodos com o `Bean()`podem receber como argumentos outras classes injetadas no sistema.

Também poderemos registrar no sistema de injeção utilizando os annotation `@Service()`e `@Repository`

### Repository

O Repository deve ser usado para consumo de API externas bem como base de dados.

> Não deverá ser utilizado de outra maneira a não ser consumo de API ou base de dados.

Deverá ser criado uma Interface como contrato servindo de dominio e deverá cria a implementação na camada de dados.

```dart
@Repository()
class ProductRepository implements IProductRepository {
}
```

> Deve criar testes de unidade para cada método do repository. Veja a seção de Teste de Unidade.

### Testes de Unidade

Usa forma padrão de testes usando Dart usando as funções `test()`, `group()`.
> Crie Fakes ao inves de Mocks.

## Packages externos

### Dart Vaden

Framework de backend inspirado no SpringBoot.

### Drift

Package para acesso a base de dados tanto postgres quanto SQLITE.
