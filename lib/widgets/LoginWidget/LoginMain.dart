import 'package:flutter/material.dart';
import 'package:flutterdemo201912/cache/SharedPreferencesUtils.dart';
import 'package:flutterdemo201912/entity/CustomUserDo.dart';
import 'package:flutterdemo201912/enums/CommonEnums.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() =>
    runApp(new MaterialApp(home: new Scaffold(body: LoginMainHome())));

class LoginMainHome extends StatefulWidget {
  @override
  _LoginMainDetail createState() => _LoginMainDetail();
}

class _LoginMainDetail extends State<LoginMainHome> {
  TextEditingController _textEditingController = new TextEditingController();
  TextEditingController _passwordEditingController =
      new TextEditingController();
  FocusNode focusNode4username = new FocusNode();
  FocusNode focusNode4password = new FocusNode();
  FocusScopeNode loginScope;
  CustomUserDo _customUserDo = new CustomUserDo();
  
  //Form表单的唯一标识
  GlobalKey _globalFormKey = new GlobalKey<FormState>();

  void _sumbitFormData(){
    print(_globalFormKey);
    SharedPreferences sharepre = SharedPreferencesUtils.getSharedPreferences();
    sharepre.setString(CommonEnums.ENUM_USERNAME, _customUserDo.userName);
    sharepre.setString(CommonEnums.ENUM_PASSWORD, _customUserDo.passWord);
  }

  @override
  void initState() {
    _textEditingController.addListener(() {
      print(_textEditingController.text);
      //   AlertDialog(title: Text(_textEditingController.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _globalFormKey,
        autovalidate: true,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
             // autofocus: true,
              controller: _textEditingController,
              focusNode: focusNode4username,
              decoration: new InputDecoration(
                  icon: new Icon(Icons.people),
                  labelText: 'User',
                  hintText: 'User or Email'),
                  validator: (value){
                return value.trim().length>0?null:'the username can not empty';
              },
              onSaved: (value){
                print(value);
                _customUserDo.userName = value;
              },
            ),
            TextFormField(
              focusNode: focusNode4password,
              controller: _passwordEditingController,
              decoration: new InputDecoration(
                  icon: new Icon(Icons.lock), labelText: 'password',
               hintText: 'the password can not empty'),
              validator: (value){
                return value.trim().length>0?null:'the password can not empty';
              },
              obscureText: true,
              onSaved: (value){
                _customUserDo.passWord = value;
              },
            ),
            new Padding(
              padding: const EdgeInsets.all(20),
              child:new Row(
                children: <Widget>[
                  new Expanded(
                      child:
                      new RaisedButton(child: new Text('登录'),
                          onPressed: (){
                            FormState  formState =  _globalFormKey.currentState;
                            if(formState.validate()){
                              //校验通过
                              formState.save();
                              _sumbitFormData();
                            }
                          })),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
