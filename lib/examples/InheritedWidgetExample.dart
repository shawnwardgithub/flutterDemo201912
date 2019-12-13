import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//本案例适用于组件传值，实际使用第三方库Provider;



void main()=>runApp(MaterialApp(home: Scaffold(
   body: _InheritedWidgetTestRoute(),
),));
class _TestWidget extends StatefulWidget{
  @override
  _TestWidgetStatus createState() => _TestWidgetStatus();
}

class _TestWidgetStatus extends State<_TestWidget>{
  @override
  Widget build(BuildContext context) {
    //使用InheritedWidget中的共享数据
    return Text(ShareDataWidget.of(context).data.toString());
  }

  //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
  //如果build中没有依赖InheritedWidget，则此回调不会被调用。
  @override
  void didChangeDependencies() {
     super.didChangeDependencies();
     print('调用了子节点树的回调didChangeDependencies');
  }
}



class ShareDataWidget extends InheritedWidget{
  final int data; //需要在子树中共享的数据，保存点击次数
  //:表明是未构建前初始化变量
  ShareDataWidget({@required this.data,Widget child}):super(child:child);

  static ShareDataWidget of(BuildContext context){
       return  context.ancestorWidgetOfExactType(ShareDataWidget);
  }
 //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    //如果返回true，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
    return oldWidget.data != this.data;
  }




}


class _InheritedWidgetTestRoute extends StatefulWidget{
  @override
  _InheritedWidgetTestRouteState createState()=>_InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<_InheritedWidgetTestRoute>{
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new ShareDataWidget(data: count,
        child: new Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(20),
              child: _TestWidget(),//子widget中依赖ShareDataWidget
            ),
            RaisedButton(
                onPressed: ()=>setState(()=>{ this.count+=1})
            ),
          ],
        ),),
    );
  }
}

