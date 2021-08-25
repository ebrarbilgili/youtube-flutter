import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/app/app_constants.dart';
import '../model/subs_model.dart';
import '../service/subs_service.dart';
import '../viewmodel/subs_viewmodel.dart';

class SubsView extends StatelessWidget {
  SubsView({Key? key}) : super(key: key);

  final viewmodel = SubsViewModel(
    subsService: SubsService(
      service: Dio(BaseOptions(baseUrl: AppConstants.BASE_URL)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SubsModel>>(
      future: viewmodel.getVideos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return buildLoading;
        }

        return buildBody(context);
      },
    );
  }

  SingleChildScrollView buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildStoryList(context),
          buildChipList(context),
          buildListView,
        ],
      ),
    );
  }

  Container buildChipList(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.05),
      child: ListView.builder(
        itemCount: viewmodel.chipList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final data = viewmodel.chipList[index];
          return buildChipItem(context, data);
        },
      ),
    );
  }

  Padding buildChipItem(BuildContext context, String data) {
    return Padding(
      padding: context.horizontalPaddingLow * 0.3,
      child: Chip(label: AutoSizeText(data)),
    );
  }

  Widget buildStoryList(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.1),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.colorScheme.background, width: .1),
        ),
      ),
      child: ListView.builder(
        itemCount: viewmodel.videoList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final data = viewmodel.videoList[index];
          return Padding(
            padding: context.horizontalPaddingLow,
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: context.colorScheme.background,
                  radius: context.dynamicHeight(0.034),
                  foregroundImage: NetworkImage(data.profile_image.toString()),
                ),
                AutoSizeText(
                  data.channel.toString(),
                  style: context.textTheme.caption,
                )
              ],
            ),
          );
        },
      ),
    );
  }

  CircleAvatar buildProfileImage(SubsModel data) {
    return CircleAvatar(
      backgroundImage: NetworkImage(data.profile_image.toString()),
    );
  }

  AutoSizeText buildTitle(SubsModel data, BuildContext context) {
    return AutoSizeText(
      data.title.toString(),
      style: context.textTheme.bodyText1!
          .copyWith(color: context.colorScheme.background),
    );
  }

  Row buildSubtitle(SubsModel data, BuildContext context) {
    return Row(children: [
      AutoSizeText(
        '${data.channel} * ',
        style: context.textTheme.caption!
            .copyWith(color: context.colorScheme.onSurface),
      ),
      AutoSizeText(
        '6,2B Views * ',
        style: context.textTheme.caption!
            .copyWith(color: context.colorScheme.onSurface),
      ),
      AutoSizeText(
        ' 52 minutes ago',
        style: context.textTheme.caption!
            .copyWith(color: context.colorScheme.onSurface),
      )
    ]);
  }

  IconButton buildTrailingButton(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.more_vert,
        color: context.colorScheme.background,
        size: 20,
      ),
    );
  }

  Container buildVideoImage(BuildContext context, SubsModel data) {
    return Container(
      height: context.dynamicHeight(0.28),
      width: double.infinity,
      child: Image.network(
        data.profile_image.toString(),
        fit: BoxFit.contain,
      ),
    );
  }

  ListTile buildVideoDetails(SubsModel data, BuildContext context) {
    return ListTile(
        leading: buildProfileImage(data),
        title: buildTitle(data, context),
        subtitle: buildSubtitle(data, context),
        trailing: buildTrailingButton(context));
  }

  Widget get buildListView {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: viewmodel.videoList.length,
      itemBuilder: (BuildContext context, int index) {
        final data = viewmodel.videoList[index];
        return Column(
          children: [
            buildVideoImage(context, data),
            buildVideoDetails(data, context)
          ],
        );
      },
    );
  }

  Center get buildLoading => Center(child: CircularProgressIndicator());
}
