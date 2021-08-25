import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/app/app_constants.dart';
import '../model/home_model.dart';
import '../service/home_service.dart';
import '../viewmodel/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  final viewmodel = HomeViewModel(
    homeService: HomeService(
      service: Dio(BaseOptions(baseUrl: AppConstants.BASE_URL)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HomeModel>>(
      future: viewmodel.getVideos(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return buildLoading;
        }

        return buildListView;
      },
    );
  }

  ListView get buildListView {
    return ListView.builder(
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

  Container buildVideoImage(BuildContext context, HomeModel data) {
    return Container(
      height: context.dynamicHeight(0.28),
      width: double.infinity,
      child: Image.network(
        data.profile_image.toString(),
        fit: BoxFit.contain,
      ),
    );
  }

  ListTile buildVideoDetails(HomeModel data, BuildContext context) {
    return ListTile(
        leading: buildProfileImage(data),
        title: buildTitle(data, context),
        subtitle: buildSubtitle(data, context),
        trailing: buildTrailingButton(context));
  }

  CircleAvatar buildProfileImage(HomeModel data) {
    return CircleAvatar(
      backgroundImage: NetworkImage(data.profile_image.toString()),
    );
  }

  AutoSizeText buildTitle(HomeModel data, BuildContext context) {
    return AutoSizeText(
      data.title.toString(),
      style: context.textTheme.bodyText1!
          .copyWith(color: context.colorScheme.background),
    );
  }

  Row buildSubtitle(HomeModel data, BuildContext context) {
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
}
