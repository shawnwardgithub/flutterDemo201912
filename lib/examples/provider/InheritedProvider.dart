
import 'package:flutter/material.dart';

class InheritedProvider<T> extends InheritedWidget{

  InheritedProvider({@required this.data,Widget child}):super(child:child);

  final T data;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    //在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。
  }
}