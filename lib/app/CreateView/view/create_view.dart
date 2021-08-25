import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';
import 'package:youtube_flutter/core/constants/app/app_constants.dart';

class CreateView extends StatelessWidget {
  const CreateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: 0.3,
      initialChildSize: 0.25,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          color: Colors.red,
          // context.colorScheme.secondary,
          height: context.dynamicHeight(0.1),
          child: ListView(
            controller: scrollController,
            shrinkWrap: true,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[900],
                  child: Icon(Icons.upload_sharp),
                ),
                title: AutoSizeText('Upload video'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[900],
                  child: buildShortsLogo(context),
                ),
                title: AutoSizeText('Create Short'),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[900],
                  child: Icon(Icons.stream),
                ),
                title: AutoSizeText('Start Streaming'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildShortsLogo(BuildContext context) {
    return SvgPicture.asset(
      AppConstants.SHORTS_LOGO,
      height: context.dynamicHeight(0.03),
    );
  }
}
