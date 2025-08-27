

import 'extract_dto.dart';
import 'package:vaden_core/vaden_core.dart';


@DTO()
class ResponseExtractDto {
  final List<ExtractDto> extracts;
  final int currentPage;
  final int ? nextPage;

  ResponseExtractDto({
    required this.extracts,
    required this.currentPage,
    this.nextPage,
  });
}