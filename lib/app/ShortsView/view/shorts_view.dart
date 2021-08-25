import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_flutter/app/BaseView/view/base_view.dart';

import '../../../core/constants/app/app_constants.dart';
import '../model/shorts_model.dart';
import '../service/shorts_service.dart';
import '../viewmodel/shorts_viewmodel.dart';

class ShortsView extends StatefulWidget {
  const ShortsView({Key? key}) : super(key: key);

  @override
  _ShortsViewState createState() => _ShortsViewState();
}

class _ShortsViewState extends State<ShortsView> {
  VideoPlayerController? _controller;

  final PageController pageController = PageController();

  final viewmodel = ShortsViewModel(
    shortsService: ShortsService(
      service: Dio(BaseOptions(baseUrl: AppConstants.BASE_URL)),
    ),
  );

  // Future<void> controlToApp(BuildContext context) async {
  //   await Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => ShortsView()));
  // }

  @override
  void initState() {
    super.initState();
    // controlToApp(context);
    viewmodel.getVideos().whenComplete(() {}).then((value) {
      _controller = VideoPlayerController.network(
        viewmodel.videoList[0].url.toString(),
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );

      _controller!.addListener(() {
        // setState(() {});
      });
      _controller!.setLooping(true);
      _controller!.initialize();
    });
  }

  // @override
  // void dispose() {
  //   _controller!.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder<List<ShortsModel>>(
            future: viewmodel.getVideos(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              return Stack(
                children: [
                  PageView.builder(
                      scrollDirection: Axis.vertical,
                      controller: pageController,
                      itemCount: viewmodel.videoList.length,
                      onPageChanged: (value) {
                        print('url value $value:' +
                            viewmodel.videoList[value].url.toString());

                        VideoPlayerController.network(
                          viewmodel.videoList[value].url.toString(),
                          videoPlayerOptions:
                              VideoPlayerOptions(mixWithOthers: false),
                        );
                      },
                      itemBuilder: (context, index) {
                        print('url index  $index:' +
                            viewmodel.videoList[index].url.toString());
                        final data = viewmodel.videoList[index];
                        return GestureDetector(
                          onTap: () {
                            _controller!.value.isPlaying
                                ? _controller!.pause()
                                : _controller!.play();
                          },
                          child: Stack(
                            children: [
                              Center(child: VideoPlayer(_controller!)),
                              Container(
                                width: double.infinity,
                                color: Colors.transparent,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.more_horiz,
                                          size: 32,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.thumb_up,
                                          size: 32,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.thumb_down,
                                          size: 32,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.comment,
                                          size: 32,
                                        )),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.reply,
                                        size: 32,
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: context.dynamicHeight(0.06),
                                      color: Colors.transparent,
                                      padding: context.horizontalPaddingLow,
                                      child: AutoSizeText(
                                        data.title.toString(),
                                        style: context.textTheme.headline6!,
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration:
                                          buildBottomNavbarBorder(context),
                                      height: context.dynamicHeight(0.1),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding:
                                                context.horizontalPaddingLow,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                data.profile_image.toString(),
                                              ),
                                            ),
                                          ),
                                          AutoSizeText(data.channel.toString()),
                                          Padding(
                                            padding:
                                                context.horizontalPaddingLow,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              child: AutoSizeText(
                                                'Subscribe',
                                                style: context.textTheme.button!
                                                    .copyWith(
                                                  color: context
                                                      .colorScheme.background,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                  buildAppBar(context),
                ],
              );
            }),
      ),
    );
  }

  ListTile buildAppBar(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () {
          context.navigation.pop();
        },
        icon: Icon(
          Icons.arrow_back_ios,
        ),
      ),
      trailing:
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
    );
  }

  BoxDecoration buildBottomNavbarBorder(BuildContext context) {
    return BoxDecoration(
      color: Colors.transparent,
      border: Border(
        top: BorderSide(
          color: Colors.white,
          width: context.dynamicHeight(0.001),
        ),
      ),
    );
  }
}
