import 'package:backend/config/security/user_details_service.dart';
import 'package:domain/domain.dart';

@Api(tag: 'users', description: 'Operations related to users')
@Controller('/users')
class UseController {
  final UserRepository userRepository;
  final WalletRepository walletRepository;

  // Use case instances
  late final CreateUserUseCase createUserUseCase;
  late final GetUserByIdUseCase getUserByIdUseCase;
  late final ChangePasswordUseCase changePasswordUseCase;

  UseController({required this.userRepository, required this.walletRepository}) {
    // Initialize use cases
    createUserUseCase = CreateUserUseCase(userRepository: userRepository, walletRepository: walletRepository);
    getUserByIdUseCase = GetUserByIdUseCase(userRepository: userRepository);
    changePasswordUseCase = ChangePasswordUseCase(userRepository: userRepository);
  }

  @ApiOperation(summary: 'Create a new user', description: 'Creates a new user in the system')
  @ApiResponse(
    200,
    description: 'User created successfully',
    content: ApiContent(type: 'json/application', schema: UserDto),
  )
  @Post('/create')
  Future<UserDto> createUser(@Body() CreateUserDto user) async {
    final createdUser = await createUserUseCase.call(user);
    return UserDto.fromEntity(createdUser);
  }

  @ApiOperation(summary: 'Change user password', description: 'Changes the password for a user')
  @ApiResponse(200, description: 'Password changed successfully')
  @Post('/change-password')
  Future<ResponseMessage> changePassword(
    @Body() ChangePasswordDto changePassword,
    @Context() User user,
  ) async {
    final params = ChangePasswordParams(userId: user.id, changePasswordDto: changePassword);
    await changePasswordUseCase.call(params);
    return ResponseMessage('Password changed successfully');
  }

  @ApiOperation(summary: 'Get current user', description: 'Retrieves the currently authenticated user')
  @ApiResponse(
    200,
    description: 'Current user retrieved successfully',
    content: ApiContent(type: 'json/application', schema: UserDto),
  )
  @Get('/me')
  Future<UserDtoWithlessPassword> getMe(@Context() User user) async {
    return UserDtoWithlessPassword(id: user.id, email: user.email, name: user.name, role: user.role);
  }


  @ApiOperation(summary: 'Get user by ID', description: 'Retrieves a user by their ID')
  @ApiResponse(
    200,
    description: 'User retrieved successfully',
    content: ApiContent(type: 'json/application', schema: UserDto),
  )
  @Get('/<id>')
  Future<UserDto> getUserById(@Param('id') int id) async {
    final params = GetUserByIdParams(userId: id);
    final user = await getUserByIdUseCase.call(params);
    return UserDto.fromEntity(user);
  }

}
