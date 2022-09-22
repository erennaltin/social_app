import 'package:flutter/material.dart';
import 'package:social_app/core/constants/color_constants.dart';
import 'package:social_app/core/constants/typo_constants.dart';

class ModalFit extends StatelessWidget {
  const ModalFit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('Edit',
                style: body.copyWith(
                  color: dark,
                )),
            leading: Icon(Icons.edit),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Share',
                style: body.copyWith(
                  color: dark,
                )),
            leading: Icon(Icons.content_cut),
            onTap: () => Navigator.of(context).pop(),
          ),
          ListTile(
            title: Text('Delete',
                style: body.copyWith(
                  color: Colors.red,
                )),
            leading: Icon(Icons.delete, color: Colors.red),
            onTap: () => Navigator.of(context).pop(),
          )
        ],
      ),
    ));
  }
}
