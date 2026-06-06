import 'models.dart';

class CastNotApprovedException implements Exception {
  final String unapprovedCastId;
  const CastNotApprovedException(this.unapprovedCastId);

  @override
  String toString() => 'CastNotApprovedException: Cast member "$unapprovedCastId" is not approved.';
}

void validateStoryCast(Story story, Map<String, bool> castApproval) {
  for (final castId in story.castIds) {
    if (castApproval[castId] != true) {
      throw CastNotApprovedException(castId);
    }
  }
}
