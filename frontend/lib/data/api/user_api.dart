import 'package:domain/domain.dart';

@ApiClient('/users')
abstract class UserApi {
  @Post('/create')
  Future<UserDto> createUser(@Head('create-user') String createUser, @Body() CreateUserDto user);

  @Post('/change-password')
  Future<ResponseMessage> changePassword(
    @Body() ChangePasswordDto changePassword,
    @Context() UserDtoWithPassword user,
  );

  @Get('/me')
  Future<UserDtoWithlessPassword> getMe();
}
