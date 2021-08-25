import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/app/app_constants.dart';
import '../../../core/extensions/locale/locale_extensions.dart';
import '../../../core/lang/locale_key.g.dart';
import '../model/lib_model.dart';
import '../service/lib_service.dart';
import '../viewmodel/lib_viewmodel.dart';

class LibView extends StatelessWidget {
  LibView({Key? key}) : super(key: key);

  final viewmodel = LibViewModel(
    libService: LibService(
      service: Dio(BaseOptions(baseUrl: AppConstants.BASE_URL)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingNormal * 0,
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: context.dynamicHeight(0.01)),
            height: context.dynamicHeight(0.05),
            child: AutoSizeText(LocaleKeys.lib_last_watch.locale),
          ),
          buildVideos(context),
          TextButton.icon(
            onPressed: () {},
            label: AutoSizeText(LocaleKeys.lib_history.locale),
            icon: Icon(Icons.history),
          ),
          TextButton.icon(
            onPressed: () {},
            label: AutoSizeText(LocaleKeys.lib_videos.locale),
            icon: Icon(Icons.play_arrow),
          ),
          TextButton.icon(
            onPressed: () {},
            label: AutoSizeText(
              LocaleKeys.lib_films.locale,
            ),
            icon: Icon(Icons.theaters_outlined),
          ),
          TextButton.icon(
            onPressed: () {},
            label: AutoSizeText(LocaleKeys.lib_watch_later.locale),
            icon: Icon(Icons.schedule),
          ),
          Container(decoration: buildDivider(context)),
          buildPlayListTitle(context),
          TextButton.icon(
            onPressed: () {},
            label: Padding(
              padding: context.horizontalPaddingLow,
              child: AutoSizeText(LocaleKeys.lib_new_playlist.locale,
                  style:
                      context.textTheme.button!.copyWith(color: Colors.blue)),
            ),
            icon: Icon(Icons.add, color: Colors.blue),
          ),
          TextButton.icon(
            onPressed: () {},
            label: Padding(
              padding: context.horizontalPaddingLow,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(LocaleKeys.lib_liked.locale,
                      style: context.textTheme.button!.copyWith()),
                  AutoSizeText('32 ' + LocaleKeys.lib_video.locale,
                      style: context.textTheme.caption!.copyWith()),
                ],
              ),
            ),
            icon: Icon(
              Icons.thumb_up_alt_outlined,
            ),
          ),
        ],
      ),
    );
  }

  Padding buildPlayListTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.dynamicHeight(0.01),
        vertical: context.dynamicHeight(0.01),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            LocaleKeys.lib_playlist.locale,
            style: context.textTheme.caption,
          ),
          Row(
            children: [
              AutoSizeText(
                LocaleKeys.lib_added.locale,
                style: context.textTheme.caption!
                    .copyWith(color: context.colorScheme.background),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: context.colorScheme.background,
                size: 16,
              )
            ],
          ),
        ],
      ),
    );
  }

  Container buildVideos(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.2),
      padding: EdgeInsets.only(left: context.dynamicHeight(0.01)),
      decoration: buildDivider(context),
      child: FutureBuilder<List<LibModel>>(
          future: viewmodel.getVideos(),
          builder: (context, snapshot) {
            return buildVideoList;
          }),
    );
  }

  BoxDecoration buildDivider(BuildContext context) {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(color: context.colorScheme.background, width: .2),
      ),
    );
  }

  ListView get buildVideoList {
    return ListView.builder(
      itemCount: viewmodel.videoList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        final data = viewmodel.videoList[index];
        return Container(
          width: context.dynamicWidth(0.45),
          height: context.dynamicHeight(0.4),
          child: Column(
            children: [
              buildVideoImage(data),
              buildVideoTitle(data, context),
            ],
          ),
        );
      },
    );
  }

  Expanded buildVideoTitle(LibModel data, BuildContext context) {
    return Expanded(
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              data.title.toString(),
              maxLines: 2,
              style: context.textTheme.caption,
              textAlign: TextAlign.start,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: context.colorScheme.background,
                size: 10,
              ),
            ),
          ],
        ),
        minVerticalPadding: 0,
        subtitle: AutoSizeText(
          data.channel.toString(),
          style: context.textTheme.caption,
        ),
      ),
    );
  }

  Expanded buildVideoImage(LibModel data) {
    return Expanded(
      flex: 1,
      child: Image.network(data.video_image.toString()),
    );
  }
}
