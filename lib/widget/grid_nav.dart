import 'package:flutter/material.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/model/grid_nav_model.dart';
import 'package:flutter_trip/util/navigator_util.dart';
import 'package:flutter_trip/widget/webview.dart';

///网格卡片
class GridNav extends StatelessWidget {
  final gridNavModel = {
    'hotel': {
      "startColor": "fa5956",
      "endColor": "fa9b4d",
      "mainItem": {
        "title": "酒店",
        "icon":
            "https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-hotel.png",
        "url": "https://m.ctrip.com/webapp/hotel/",
        "statusBarColor": "4289ff"
      },
      "item1": {
        "title": "海外酒店",
        "url": "https://m.ctrip.com/webapp/hotel/oversea/?otype=1",
        "statusBarColor": "4289ff"
      },
      "item2": {
        "title": "特价酒店",
        "url": "https://m.ctrip.com/webapp/hotel/hotsale"
      },
      "item3": {
        "title": "爆款",
        "url": "https://m.ctrip.com/webapp/cw/gs/onsale/boomHome.html",
        "hideAppBar": true
      },
      "item4": {
        "title": "民宿 客栈",
        "url": "https://m.ctrip.com/webapp/inn/index",
        "hideAppBar": true
      }
    },
    "flight": {
      "startColor": "4b8fed",
      "endColor": "53bced",
      "mainItem": {
        "title": "机票",
        "icon":
            "https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-flight.png",
        "url": "https://m.ctrip.com/html5/flight/swift/index"
      },
      "item1": {
        "title": "火车票",
        "url":
            "https://m.ctrip.com/webapp/train/?secondwakeup=true&dpclickjump=true&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F#/index?VNK=4e431539",
        "hideAppBar": true
      },
      "item2": {
        "title": "特价机票",
        "url": "https://m.ctrip.com/html5/flight/swift/index"
      },
      "item3": {
        "title": "汽车票·船票",
        "url": "https://m.ctrip.com/webapp/bus/",
        "hideAppBar": true
      },
      "item4": {
        "title": "专车·租车",
        "url": "https://m.ctrip.com/webapp/cw/car/home/index.html",
        "hideAppBar": true
      }
    },
    "travel": {
      "startColor": "34c2aa",
      "endColor": "6cd557",
      "mainItem": {
        "title": "旅游",
        "icon":
            "https://pic.c-ctrip.com/platform/h5/home/grid-nav-items-travel.png",
        "url": "https://m.ctrip.com/webapp/vacations/tour/vacations",
        "hideAppBar": true,
        "statusBarColor": "19A0F0"
      },
      "item1": {
        "title": "门票",
        "url":
            "https://m.ctrip.com/tangram/ticket?ctm_ref=vactang_page_8349&isHideNavBar=YES&coords=1&secondwakeup=true&dpclickjump=true&allianceid=66672&sid=508670&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
        "statusBarColor": "19A0F0",
        "hideAppBar": true
      },
      "item2": {
        "title": "目的地攻略",
        "url":
            "https://m.ctrip.com/webapp/you/gsdestination/place/2.html?seo=0&ishideheader=true&secondwakeup=true&dpclickjump=true&allianceid=66672&sid=508670&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
        "statusBarColor": "19A0F0",
        "hideAppBar": true
      },
      "item3": {
        "title": "私家团",
        "url":
            "https://m.ctrip.com/tangram/minitour?isHideNavBar=YES&ctm_ref=vactang_page_800&secondwakeup=true&dpclickjump=true&allianceid=66672&sid=508670&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
        "hideAppBar": true
      },
      "item4": {
        "title": "定制旅行",
        "url":
            "https://m.ctrip.com/webapp/vacations/dingzhi/index?ctm_ref=C_vac_custom&secondwakeup=true&dpclickjump=true&allianceid=66672&sid=508670&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
        "hideAppBar": true
      }
    }
  };
  // final GridNavModel gridNavModel;

  // const GridNav({Key key, @required this.gridNavModel}) : super(key: key);
  GridNav({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.black,
      // color: Colors.transparent,
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.antiAlias,

      // child: Text(
      //   'item.title',
      //   textAlign: TextAlign.center,
      //   style: TextStyle(fontSize: 14, color: Colors.white),
      // ),

      child: Column(
        children: _gridNavItems(context),
      ),
    );
  }

  _gridNavItems(BuildContext context) {
    // var items = [];
    List<Widget> items = [];
    var result1 = gridNavModel.putIfAbsent("hotel", () => ({}));
    var result2 = gridNavModel.putIfAbsent("flight", () => ({}));
    var result3 = gridNavModel.putIfAbsent("travel", () => ({}));

    items.add(_gridNavItem(context, result1, true));
    items.add(_gridNavItem(context, result2, false));
    items.add(_gridNavItem(context, result3, false));
    // if (gridNavModel == null) return items;
    if (!gridNavModel.containsKey('hotel')) {
      // if (gridNavModel.hotel != null) {
      items.add(_gridNavItem(context, result1, true));
      // items.add(_gridNavItem(context, gridNavModel['hotel'], true));
    }
    if (!gridNavModel.containsKey('flight')) {
      items.add(_gridNavItem(context, result2, false));
    }
    if (!gridNavModel.containsKey('travel')) {
      items.add(_gridNavItem(context, result3, false));
    }
    return items;
  }

  _gridNavItem(BuildContext context, gridNavItem, bool first) {
    print('=====');
    print(gridNavItem);
    var mainItem = gridNavItem.putIfAbsent("mainItem", () => ({}));
    var item1 = gridNavItem.putIfAbsent("item1", () => ({}));
    var item2 = gridNavItem.putIfAbsent("item2", () => ({}));
    var item3 = gridNavItem.putIfAbsent("item3", () => ({}));
    var item4 = gridNavItem.putIfAbsent("item4", () => ({}));
    // _gridNavItem(BuildContext context, GridNavItem gridNavItem, bool first) {
    List<Widget> items = [];
    items.add(_mainItem(context, mainItem));
    items.add(_doubleItem(context, item1, item2));
    items.add(_doubleItem(context, item3, item4));
    List<Widget> expandItems = [];
    items.forEach((item) {
      expandItems.add(Expanded(child: item, flex: 1));
    });
    Color startColor = Color(int.parse('0xff' + gridNavItem.startColor));
    Color endColor = Color(int.parse('0xff' + gridNavItem.endColor));
    return Container(
      height: 88,
      margin: first ? null : EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
          //线性渐变
          gradient: LinearGradient(colors: [startColor, endColor])),
      child: Row(children: expandItems),
    );
  }

  _mainItem(BuildContext context, model) {
    // _mainItem(BuildContext context, CommonModel model) {
    return _wrapGesture(
        context,
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Text(
              'model.icon',
              // model.title,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            // Image.network(
            //   model.icon,
            //   fit: BoxFit.contain,
            //   height: 88,
            //   width: 121,
            //   alignment: AlignmentDirectional.bottomEnd,
            // ),
            Container(
              margin: EdgeInsets.only(top: 11),
              child: Text(
                'model.title',
                // model.title,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            )
          ],
        ),
        model);
  }

  _doubleItem(
      BuildContext context, CommonModel topItem, CommonModel bottomItem) {
    return Column(
      children: <Widget>[
        Expanded(
          child: _item(context, topItem, true),
        ),
        Expanded(
          child: _item(context, bottomItem, false),
        )
      ],
    );
  }

  _item(BuildContext context, CommonModel item, bool first) {
    BorderSide borderSide = BorderSide(width: 0.8, color: Colors.white);
    return FractionallySizedBox(
      //撑满父布局的宽度
      widthFactor: 1,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          left: borderSide,
          bottom: first ? borderSide : BorderSide.none,
        )),
        child: _wrapGesture(
            context,
            Center(
              child: Text(
                item.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            item),
      ),
    );
  }

  _wrapGesture(BuildContext context, Widget widget, CommonModel model) {
    return GestureDetector(
      onTap: () {
        NavigatorUtil.push(
            context,
            WebView(
              url: model.url,
              statusBarColor: model.statusBarColor,
              title: model.title,
              hideAppBar: model.hideAppBar,
            ));
      },
      child: widget,
    );
  }
}
