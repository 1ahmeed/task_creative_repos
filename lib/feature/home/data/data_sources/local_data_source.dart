

import 'package:hive/hive.dart';
import 'package:task_creative_repo/core/utils/constant.dart';
import 'package:task_creative_repo/feature/home/domain/entitiy/repo_entity.dart';


abstract class HomeLocalDataSource{
  List<RepoEntity> fetchRepos({int pageNum=0});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource{
  @override
  List<RepoEntity> fetchRepos({int pageNum=0}) {
    int startIndex=pageNum*10;
    int endIndex=(pageNum+1)*10;
    var box=Hive.box<RepoEntity>(kFeaturedRepo);
    int length=box.values.length;
    if(startIndex >= length || endIndex>length){
      return [];
    }
    //box.delete(kFeaturedBox);
    return box.values.toList().sublist(startIndex,endIndex);
  }



}

