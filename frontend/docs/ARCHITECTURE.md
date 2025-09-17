# ARCHITECTURE

## Repository

Handles communication with external APIs.  
Each method should return an `AsyncResult` from the `result_dart` package.

```dart
@Repository()
class AuthRepository {
  final AuthApi authApi;

  AuthRepository(this.authApi);

  // Methods
  AsyncResult<User> login(Credentials credentials) {
    // Implementation
  }
}
```

## Service

Abstracts business logic, integrates `packages`, and aggregates `repositories`.

```dart
@Service()
class DashboardService {
  final ProductRepository productRepository;
  final UserRepository userRepository;

  DashboardService(this.productRepository, this.userRepository);

  // Methods
}
```

## API

Abstracts the application's data source.  
Uses the `flutter_vaden` package.

```dart
@ApiClient()
abstract class ProductApi {
  @Get('/product/<id>')
  Future<ProductDTO> getProduct(@Param() int id);

  @Post('/product')
  Future<ProductDTO> createProduct(@Body() ProductDTO product);

  @Put('/product/<id>')
  Future<ProductDTO> updateProduct(@Param() int id, @Body() ProductDTO product);

  @Delete('/product/<id>')
  Future<void> deleteProduct(@Param() int id);

  @Get('/products')
  Future<List<ProductDTO>> getAllProducts();
}
```

## Store

Manages state for the application.  
Each `Store` corresponds 1:1 with a View.  
The Store communicates with the View using the `Command` pattern.

```dart
class ProductStore {
  final fetchGreetingCommand = Command0<String>(
  () async {
    await Future.delayed(Duration(seconds: 2));
    return Success('Hello, World!');
  },
  );

  final calculateSquareCommand = Command1<int, int>(
  (number) async {
    if (number < 0) {
    return Failure(Exception('Negative numbers are not allowed.'));
    }
    return Success(number * number);
  },
  );
}
```
