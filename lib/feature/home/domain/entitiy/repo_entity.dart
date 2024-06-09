
import 'package:hive/hive.dart';
part 'repo_entity.g.dart';
@HiveType(typeId: 0)
class RepoEntity {
  @HiveField(0)
  final String? nameRepo;
  @HiveField(1)
  final String? descriptionRepo;
  @HiveField(2)
  final String? userNameOfRepo;
  @HiveField(3)
  final bool? isFork;
  @HiveField(4)
  final String? htmlUrl;

  RepoEntity({
    required this.nameRepo,
    required this.isFork,
    required this.htmlUrl,
    required this.descriptionRepo,
    required this.userNameOfRepo});
}
