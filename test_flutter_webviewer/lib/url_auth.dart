import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'src/WebView/web_view.dart';
import 'src/components/form_error.dart';

class UrlAndAuth extends StatefulWidget {
  @override
  _UrlAndAuthState createState() => _UrlAndAuthState();
}

class _UrlAndAuthState extends State<UrlAndAuth> {
  final _formKey = GlobalKey<FormState>();
  late String emailHelpo;
  late String urlHelpo;
  final emailController = TextEditingController();
  final urlController = TextEditingController();

  // final List<String> errors = [];

  // void addError({required String error}) {
  //   if (!errors.contains(error))
  //     setState(() {
  //       errors.add(error);
  //     });
  // }

  // void removeError({required String error}) {
  //   if (errors.contains(error))
  //     setState(() {
  //       errors.remove(error);
  //     });
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 12, right: 12, top: 18, bottom: 0),
            child: buildEmailFormField(),
          ),
          // Padding(
          //   padding: EdgeInsets.only(left: 12, right: 12),
          //   child: FormError(errors: errors),
          // ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
            child: buildUrlFormField(),
          ),
          ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WebViewScreen(
                                emailHelpo: emailController.text,
                                urlHelpo: urlController.text,
                              )));
                }
              },
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              child: const Text('Test')),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailController,
      onSaved: (newValue) => emailHelpo = newValue!,
      onChanged: (value) {},
      validator: (value) {},
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Email",
        hintText: "Nhập Email Helpo",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildUrlFormField() {
    return TextFormField(
      controller: urlController,
      onSaved: (newValue) => urlHelpo = newValue!,
      onChanged: (value) {},
      validator: (value) {},
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Url",
        hintText: "Nhập url nếu đã từng đăng nhập (Nếu có)",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
