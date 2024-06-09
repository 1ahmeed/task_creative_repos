import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/entitiy/repo_entity.dart';

class RepositoryItem extends StatelessWidget {
   const RepositoryItem({
    required this.reposList,
    Key? key,
  }) : super(key: key);
final RepoEntity reposList;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: reposList.isFork! ? Colors.white : Colors.lightGreenAccent,
      child: ListTile(
        title: Text(reposList.nameRepo!),
        subtitle: Text(reposList.descriptionRepo!),
        trailing: Text(reposList.userNameOfRepo!),
        onTap: () => _showUrlDialog(context, reposList),
        onLongPress: () => _showUrlDialog(context, reposList),
      ),
    );

  }
   void _showUrlDialog(BuildContext context, RepoEntity repository) {
     showDialog(
       context: context,
       builder: (context) => AlertDialog(
         title: Text('Open URL'),
         content: Text('Which URL do you want to open?'),
         actions: [
           TextButton(
             onPressed: () => Navigator.pop(context, repository.htmlUrl),
             child: Text('Repository'),
           ),
           TextButton(
             onPressed: () => Navigator.pop(context, repository.userNameOfRepo),
             child: Text('Owner Profile'),
           ),
         ],
       ),
     ).then((url) {
       if (url != null) {
         launchUrl(Uri.parse(url));
       }
     });
   }
}