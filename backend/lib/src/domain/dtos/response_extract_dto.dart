

import 'package:backend/src/domain/dtos/extract_dto.dart';
import 'package:vaden/vaden.dart';


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