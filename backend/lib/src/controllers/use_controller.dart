import 'package:backend/config/security/user_details_service.dart';
import 'package:backend/src/domain.dart';
import 'package:backend/src/utils/response_message.dart';
import 'package:vaden/vaden.dart';

@Api(tag: 'users', description: 'Operations related to users')
@Controller('/users')
class UseController {
  final UserRepository repository;

  UseController(this.repository);

  @ApiOperation(summary: 'Create a new user', description: 'Creates a new user in the system')
  @ApiResponse(
    200,
    description: 'User created successfully',
    content: ApiContent(type: 'json/application', schema: UserDto),
  )
  @Post('/create')
  Future<UserDto> createUser(@Body() CreateUserDto user) async {
    final createdUser = await repository.create(user);
    return UserDto.fromEntity(createdUser);
  }

  @ApiOperation(summary: 'Get user by ID', description: 'Retrieves a user by their ID')
  @ApiResponse(
    200,
    description: 'User retrieved successfully',
    content: ApiContent(type: 'json/application', schema: UserDto),
  )
  @Get('/<id>')
  Future<UserDto> getUserById(@Param('id') int id) async {
    final user = await repository.getUserById(id);
    return UserDto.fromEntity(user);
  }



  @ApiOperation(summary: 'Change user password', description: 'Changes the password for a user')
  @ApiResponse(
    200,
    description: 'Password changed successfully',
  )
  @Post('/change-password')
  Future<ResponseMessage> changePassword(@Body() ChangePasswordDto changePassword,
  @Context() User user,
  ) async {
    await repository.changePassword(user.id, changePassword);
    return ResponseMessage('Password changed successfully');
  }
}
