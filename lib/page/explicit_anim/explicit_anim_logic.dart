import 'package:flutter_anim_example/common/route/route.dart';
import 'package:flutter_anim_example/page/explicit_anim/child/align_view.dart';
import 'package:flutter_anim_example/page/explicit_anim/child/decorated_box_view.dart';
import 'package:flutter_anim_example/page/explicit_anim/child/default_text_style.dart';
import 'package:flutter_anim_example/page/explicit_anim/child/fade_view.dart';
import 'package:flutter_anim_example/page/explicit_anim/child/positioned_view.dart';
import 'package:flutter_anim_example/page/explicit_anim/child/relative_positioned_view.dart';
import 'package:flutter_anim_example/page/explicit_anim/child/rotation_view.dart';
import 'package:flutter_anim_example/page/explicit_anim/child/scale_view.dart';
import 'package:flutter_anim_example/page/explicit_anim/child/size_view.dart';
import 'package:flutter_anim_example/page/explicit_anim/child/slide_view.dart';
import 'package:get/get.dart';

class ExplicitAnimLogic extends GetxController {
  startPageSize() async {
    RouteMgr.pushPage(const SizePage());
  }

  startPageFade() async {
    RouteMgr.pushPage(const FadePage());
  }

  startPageAlign() async {
    RouteMgr.pushPage(const AlignPage());
  }

  startPageScale() async {
    RouteMgr.pushPage(const ScalePage());
  }

  startPageSlide() async {
    RouteMgr.pushPage(const SlidePage());
  }

  startPageRotation() async {
    RouteMgr.pushPage(const RotationPage());
  }

  startPageDecoratedBox() async {
    RouteMgr.pushPage(const DecoratedBoxPage());
  }

  startPageDefaultTextStyle() async {
    RouteMgr.pushPage(const DefaultTextStylePage());
  }

  startPagePositioned() async {
    RouteMgr.pushPage(const PositionedPage());
  }

  startPageRelativePositioned() async {
    RouteMgr.pushPage(const RelativePositionedPage());
  }
}
