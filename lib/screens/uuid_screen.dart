import 'package:uuid/uuid.dart';

String generatedCustomID() {
  final String currentYear = DateTime.now().year.toString();

  final String fullUuid = Uuid().v4();

  final String uniquePart = fullUuid.substring(0, 4);

  final String customId = '$currentYear-$uniquePart';

  return customId;
}
