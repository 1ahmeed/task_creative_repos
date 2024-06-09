import 'package:hive_flutter/adapters.dart';
import 'package:task_creative_repo/feature/home/domain/entitiy/repo_entity.dart';


void saveBox(List<RepoEntity> books,String booksName) {
  var box=Hive.box<RepoEntity>(booksName);
  box.addAll(books);
}
