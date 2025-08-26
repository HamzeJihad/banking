import 'package:backend/src/domain.dart';
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

 
}
