import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  static const _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDnBMrvl1LNFi2KpBh8zIlz1co3Es04Ipo';
  Future<void> signup(String email, String password) async {
    final response = await http.post(Uri.parse(_url),
        body: jsonEncode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ));
    print(jsonDecode(response.body));
  }
}

// Firebase Auth REST API --> https://firebase.google.com/docs/reference/rest/auth?hl=en