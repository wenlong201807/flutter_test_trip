import 'package:flutter/material.dart';
import 'dart:core';
// import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_trip/dao/home_dao.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/model/grid_nav_model.dart';
import 'package:flutter_trip/model/home_model.dart';
import 'package:flutter_trip/model/sales_box_model.dart';
import 'package:flutter_trip/pages/search_page.dart';
import 'package:flutter_trip/pages/speak_page.dart';
import 'package:flutter_trip/util/navigator_util.dart';
import 'package:flutter_trip/widget/grid_nav.dart';
import 'package:flutter_trip/widget/loading_container.dart';
import 'package:flutter_trip/widget/local_nav.dart';
import 'package:flutter_trip/widget/sales_box.dart';
import 'package:flutter_trip/widget/search_bar.dart';
import 'package:flutter_trip/widget/sub_nav.dart';
import 'package:flutter_trip/widget/webview.dart';

const APPBAR_SCROLL_OFFSET = 100;
const SEARCH_BAR_DEFAULT_TEXT = '网红打卡地 景点 酒店 美食';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double appBarAlpha = 0;
  List localNavList = [];
  // List<CommonModel> localNavList = [];

  List bannerList = [];
  // List<CommonModel> bannerList = [];
  List subNavList = [];
  // List<CommonModel> subNavList = [];
  Map gridNavModel;
  // GridNavModel gridNavModel;
  Map salesBoxModel;
  // SalesBoxModel salesBoxModel;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _handleRefresh();
    Future.delayed(Duration(milliseconds: 600), () {
      // FlutterSplashScreen.hide();
    });
  }

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(appBarAlpha);
  }

  Future<Null> _handleRefresh() async {
    try {
      // HomeModel model = await HomeDao.fetch();
      setState(() {
        // localNavList = model.localNavList;
        // subNavList = model.subNavList;
        // gridNavModel = model.gridNav;
        // salesBoxModel = model.salesBox;
        // bannerList = model.bannerList;

        localNavList.addAll([
          {
            "icon": "http://www.devio.org/io/flutter_app/img/ln_ticket.png",
            "title": "攻略·景点",
            "url":
                "https://m.ctrip.com/webapp/you/place/2.html?ishideheader=true&secondwakeup=true&dpclickjump=true&allianceid=66672&sid=1693366&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
            "statusBarColor": "1070b8",
            "hideAppBar": true
          },
          {
            "icon": "http://www.devio.org/io/flutter_app/img/ln_weekend.png",
            "title": "周边游",
            "url":
                "https://m.ctrip.com/webapp/vacations/tour/around?&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
            "statusBarColor": "52149f",
            "hideAppBar": true
          },
          {
            "icon": "http://www.devio.org/io/flutter_app/img/ln_food.png",
            "title": "美食林",
            "url":
                "https://m.ctrip.com/webapp/gourmet/food/homeList/address.html?new=1&isHideNavBar=YES&ishideheader=true&seo=0&secondwakeup=true&dpclickjump=true&allianceid=66672&sid=508670&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
            "statusBarColor": "19A0F0",
            "hideAppBar": true
          },
          {
            "icon": "http://www.devio.org/io/flutter_app/img/ln_oneday.png",
            "title": "一日游",
            "url": "https://dp.ctrip.com/webapp/activity/daytour",
            "hideAppBar": true
          },
          {
            "icon": "http://www.devio.org/io/flutter_app/img/ln_guide.png",
            "title": "当地攻略",
            "url":
                "https://m.ctrip.com/webapp/you/gsdestination/place/2.html?seo=0&ishideheader=true&secondwakeup=true&dpclickjump=true&allianceid=66672&sid=508670&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
            "statusBarColor": "19A0F0",
            "hideAppBar": true
          }
        ]);
        subNavList = [];
        gridNavModel = {
          "hotel": {
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
        salesBoxModel = {
          "icon":
              "http://www.devio.org/io/flutter_app/img/sales_box_huodong.png",
          "moreUrl":
              "https://contents.ctrip.com/activitysetupapp/mkt/index/moreact",
          "bigCard1": {
            "icon":
                "https://dimg04.c-ctrip.com/images/700t0y000000m71h523FE_375_260_342.png",
            "url":
                "https://contents.ctrip.com/buildingblocksweb/special/membershipcard/index.html?sceneid=1&productid=14912&ishidenavbar=yes&pushcode=act_svip_hm31",
            "title": "活动"
          },
          "bigCard2": {
            "icon":
                "https://dimg04.c-ctrip.com/images/700a10000000portu2BAD_375_260_342.jpg",
            "url":
                "https://m.ctrip.com/webapp/you/livestream/plan/crhHotelList.html?liveAwaken=true&isHideHeader=true&isHideNavBar=YES&mktcrhcode=hotevent",
            "title": "活动"
          },
          "smallCard1": {
            "icon":
                "https://dimg04.c-ctrip.com/images/700b0z000000neoth8688_375_160_345.jpg",
            "url":
                "https://contents.ctrip.com/activitysetupapp/mkt/index/nbaafs?pushcode=IP_nbaafs004",
            "title": "活动"
          },
          "smallCard2": {
            "icon":
                "https://dimg04.c-ctrip.com/images/700w0z000000mogkyEF78_375_160_345.jpg",
            "url": "https://smarket.ctrip.com/webapp/promocode/add?source=5",
            "title": "活动"
          },
          "smallCard3": {
            "icon":
                "https://dimg04.c-ctrip.com/images/700a0t000000im512AB2C_375_160_345.jpg",
            "url": "https://smarket.ctrip.com/webapp/promocode/add?source=5",
            "title": "活动"
          },
          "smallCard4": {
            "icon":
                "https://dimg04.c-ctrip.com/images/700d0s000000htvwo16C4_375_160_345.jpg",
            "url": "https://smarket.ctrip.com/webapp/promocode/add?source=5",
            "title": "活动"
          }
        };
        bannerList.addAll([
          {
            "icon":
                "http://www.devio.org/io/flutter_app/img/banner/100h10000000q7ght9352.jpg",
            "url":
                "https://gs.ctrip.com/html5/you/travels/1422/3771516.html?from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F"
          },
          {
            "icon":
                "https://dimg04.c-ctrip.com/images/300h0u000000j05rnD96B_C_500_280.jpg",
            "url":
                "https://m.ctrip.com/webapp/vacations/tour/detail?productid=3168213&departcityid=2&salecityid=2&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F"
          },
          {
            "icon": "http://pages.ctrip.com/hotel/201811/jdsc_640es_tab1.jpg",
            "url":
                "https://m.ctrip.com/events/jiudianshangchenghuodong.html?disable_webview_cache_key=1"
          },
          {
            "icon":
                "https://dimg03.c-ctrip.com/images/fd/tg/g1/M03/7E/19/CghzfVWw6OaACaJXABqNWv6ecpw824_C_500_280_Q90.jpg",
            "url":
                "https://m.ctrip.com/webapp/vacations/tour/detail?productid=53720&departcityid=2&salecityid=2&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F"
          }
        ]);
        _loading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _loading = false;
      });
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: LoadingContainer(
          isLoading: _loading,
          child: Stack(
            children: <Widget>[
              MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: RefreshIndicator(
                    onRefresh: _handleRefresh,
                    child: NotificationListener(
                      onNotification: (scrollNotification) {
                        if (scrollNotification is ScrollUpdateNotification &&
                            scrollNotification.depth == 0) {
                          //滚动且是列表滚动的时候
                          _onScroll(scrollNotification.metrics.pixels);
                        }
                      },
                      child: _listView,
                    )),
              ),
              _appBar
            ],
          )),
    );
  }

  Widget get _listView {
    return ListView(
      children: <Widget>[
        _banner,

        Padding(
          padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
          child: LocalNav(localNavList: localNavList),
        ),

        Padding(padding: EdgeInsets.fromLTRB(7, 0, 7, 4), child: GridNav()),
        // child: GridNav(gridNavModel: gridNavModel)),

        // Padding(
        //     padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
        //     child: SubNav(subNavList: subNavList)),

        // Padding(
        //     padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
        //     child: SalesBox(salesBox: salesBoxModel)),
      ],
    );
  }

  Widget get _appBar {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              //AppBar渐变遮罩背景
              colors: [Color(0x66000000), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            height: 80.0,
            decoration: BoxDecoration(
              color: Color.fromARGB((appBarAlpha * 255).toInt(), 255, 255, 255),
            ),
            child: SearchBar(
              searchBarType: appBarAlpha > 0.2
                  ? SearchBarType.homeLight
                  : SearchBarType.home,
              inputBoxClick: _jumpToSearch,
              speakClick: _jumpToSpeak,
              defaultText: SEARCH_BAR_DEFAULT_TEXT,
              leftButtonClick: () {},
            ),
          ),
        ),
        Container(
            height: appBarAlpha > 0.2 ? 0.5 : 0,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 0.5)]))
      ],
    );
  }

  Widget get _banner {
    return Container(
      height: 160,
      child: Swiper(
        itemCount: bannerList.length,
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              final model = bannerList[index];
              // CommonModel model = bannerList[index];
              NavigatorUtil.push(
                  context,
                  WebView(
                      url: model.url,
                      title: model.title,
                      hideAppBar: model.hideAppBar));
            },
            child: Image.asset(
              'images/banpic1.png',
              // bannerList[index].icon,
              fit: BoxFit.cover,
            ),
            // child: Image.network(
            //   'https://www.devio.org/io/flutter_app/img/banner/100h10000000q7ght9352.jpg',
            //   // bannerList[index].icon,
            //   fit: BoxFit.fill,
            // ),
          );
        },
        pagination: SwiperPagination(),
      ),
    );
  }

  _jumpToSearch() {
    NavigatorUtil.push(
        context,
        SearchPage(
          hint: SEARCH_BAR_DEFAULT_TEXT,
        ));
  }

  _jumpToSpeak() {
    NavigatorUtil.push(context, SpeakPage());
  }
}
