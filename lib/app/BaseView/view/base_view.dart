import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

import 'package:youtube_flutter/app/BaseView/viewmodel/base_viewmodel.dart';
import 'package:youtube_flutter/app/ShortsView/view/shorts_view.dart';
import 'package:youtube_flutter/core/constants/app/app_constants.dart';
import 'package:youtube_flutter/core/extensions/locale/locale_extensions.dart';
import 'package:youtube_flutter/core/lang/locale_key.g.dart';

class BaseView extends StatelessWidget {
  BaseView({
    Key? key,
  }) : super(key: key);

  final viewModel = BaseViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody,
      bottomNavigationBar: Container(
        decoration: buildBottomNavbarBorder(context),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildBottomNavBarItem(context, () => viewModel.onItemTapped(0),
                LocaleKeys.bottom_nav_bar_home.locale, Icons.home, null, null),
            buildBottomNavBarItem(context, () {
              context.navigation.push(MaterialPageRoute(
                builder: (context) => ShortsView(),
              ));
            }, LocaleKeys.bottom_nav_bar_home.locale, Icons.home,
                buildShortsLogo(context), null),
            buildBottomNavBarItem(context, () {
              showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      color: context.colorScheme.secondary,
                      height: context.dynamicHeight(0.3),
                      child: Column(
                        // controller: scrollController,
                        // shrinkWrap: true,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: context.horizontalPaddingNormal,
                                  child: AutoSizeText(
                                    'Create',
                                    style: context.textTheme.headline6!
                                        .copyWith(
                                            color:
                                                context.colorScheme.background,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () => context.navigation.pop(),
                                    icon: Icon(Icons.close))
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey[900],
                                child: Icon(Icons.upload_sharp),
                              ),
                              title: AutoSizeText('Upload video'),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey[900],
                                child: buildShortsLogo(context),
                              ),
                              title: AutoSizeText('Create Short'),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey[900],
                                child: Icon(Icons.stream),
                              ),
                              title: AutoSizeText('Start Streaming'),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }, '', Icons.add_circle_outline, null, 40),
            buildBottomNavBarItem(
                context,
                () => viewModel.onItemTapped(3),
                LocaleKeys.bottom_nav_bar_subscription.locale,
                Icons.subscriptions_outlined,
                null,
                null),
            buildBottomNavBarItem(
                context,
                () => viewModel.onItemTapped(4),
                LocaleKeys.bottom_nav_bar_library.locale,
                Icons.video_library_outlined,
                null,
                null),
          ],
        ),
      ),
    );
  }

  SvgPicture buildShortsLogo(BuildContext context) {
    return SvgPicture.asset(
      AppConstants.SHORTS_LOGO,
      height: context.dynamicHeight(0.03),
    );
  }

  Expanded buildBottomNavBarItem(BuildContext context, Function()? onPressed,
      String locale, IconData icon, Widget? svg, double? size) {
    return Expanded(
      child: ElevatedButton(
        style: buildButtonStyle(context),
        onPressed: onPressed,
        child: Container(
          padding: EdgeInsets.zero,
          height: context.dynamicHeight(0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              svg ??
                  Icon(
                    icon,
                    color: context.colorScheme.background,
                    size: size ?? 24,
                  ),
              AutoSizeText(
                locale,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.button!
                    .copyWith(color: context.colorScheme.background),
              )
            ],
          ),
        ),
      ),
    );
  }

  ButtonStyle buildButtonStyle(BuildContext context) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(context.colorScheme.surface),
      elevation: MaterialStateProperty.all(0),
    );
  }

  Widget get buildBody {
    return Observer(builder: (_) {
      return viewModel.widgetOptions.elementAt(viewModel.selectedIndex);
    });
  }

  BoxDecoration buildBottomNavbarBorder(BuildContext context) {
    return BoxDecoration(
      border: Border(
        top: BorderSide(
          color: context.colorScheme.background,
          width: context.dynamicHeight(0.0001),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: SvgPicture.asset(
        AppConstants.LOGO_WHITE,
        height: context.dynamicHeight(0.04),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.cast)),
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: Icon(Icons.person)),
      ],
    );
  }
}
