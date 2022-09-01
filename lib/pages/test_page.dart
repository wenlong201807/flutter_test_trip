// 参考【本地解析json】 https://segmentfault.com/a/1190000040554135

import 'dart:convert';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class testPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "列表",
      home: Scaffold(appBar: AppBar(title: Text('列表详情')), body: myList()),
    );
  }
}

// ignore: camel_case_types
class myList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      //1
      future: DefaultAssetBundle.of(context)
          .loadString('asserts/planTask.json'), //2
      builder: (context, snapshot) {
        var data = json.decode(snapshot.data.toString()); //3
        // List dataList = data['dataList'];//4
        print(data);
        return ListView.builder(
          itemCount: data.length, //5
          itemBuilder: (context, index) {
            print('$context $index');
            return Container(
              height: 200,
              child: Column(
                children: [
                  Text(
                    '${data[index]['title']}',
                    // '固定字符数据',//6 使用渲染每一项
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink),
                  ),
                  Text(
                    '${data[index]['date']}',
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
