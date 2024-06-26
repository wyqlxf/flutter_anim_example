import 'package:flutter_anim_example/common/route/route.dart';
import 'package:flutter_anim_example/common/util/log_util.dart';
import 'package:get/get.dart';

class HomePageLogic extends GetxController {
  List data = [];

  @override
  void onInit() {
    data.add({'id': '1', 'name': '隐式动画'});
    data.add({'id': '2', 'name': '显示动画'});
    data.add({'id': '3', 'name': '补间动画'});
    data.add({'id': '4', 'name': 'Hero动画'});
    data.add({'id': '5', 'name': '交织动画'});
    data.add({'id': '6', 'name': '列表动画'});
    data.add({'id': '7', 'name': '转场动画'});
    data.add({'id': '8', 'name': '物理动画'});
    data.add({'id': '9', 'name': '预置动画'});
    data.add({'id': '10', 'name': '场景案例'});
    super.onInit();
  }

  clickItem(String id) {
    LogUtil.log('HomePageLogic.clickItem id = $id');
    switch (id) {
      case '1':
        RouteMgr.pushNamed(RouteMgr.implicit);
        break;
      case '2':
        RouteMgr.pushNamed(RouteMgr.explicit);
        break;
      case '3':
        RouteMgr.pushNamed(RouteMgr.tween);
        break;
      case '4':
        RouteMgr.pushNamed(RouteMgr.hero);
        break;
      case '5':
        RouteMgr.pushNamed(RouteMgr.staggered);
        break;
      case '6':
        RouteMgr.pushNamed(RouteMgr.listAnim);
        break;
      case '7':
        RouteMgr.pushNamed(RouteMgr.transition);
        break;
      case '8':
        RouteMgr.pushNamed(RouteMgr.physics);
        break;
      case '9':
        RouteMgr.pushNamed(RouteMgr.internal);
        break;
      case '10':
        RouteMgr.pushNamed(RouteMgr.caseDemo);
        break;
    }
  }
}
