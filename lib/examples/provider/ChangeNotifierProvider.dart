
import 'package:flutter/material.dart';
import 'package:flutterdemo201912/examples/provider/ChangeNotifierMy.dart';
import 'package:flutterdemo201912/examples/provider/InheritedProvider.dart';

Type _typeof<T>()=>T;

class ChangeNotifierProvider<T extends ChangeNotifierMy> extends StatefulWidget{

  ChangeNotifierProvider({Key key,this.data,this.widgetchild });
  final T data;
  final Widget widgetchild;

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static T of<T>(BuildContext context){
    final type = _typeof<InheritedProvider<T>>();
    final provider = context.inheritFromWidgetOfExactType(type) as InheritedProvider<T>;
    return provider.data;
  }


  @override
  State createState() {

  }
}

class _ChangeNotifierProviderState<T extends ChangeNotifierMy> extends State<ChangeNotifierProvider<T>>{
     void update(){
       //如果数据发生变化（model类调用了notifyListeners），重新构建InheritedProvider
       setState(() {
       });
     }

     @override
     Widget build(BuildContext context) {

     }


}


