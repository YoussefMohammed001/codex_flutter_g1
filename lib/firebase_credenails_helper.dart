import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:http/http.dart' as http;

Future<ServiceAccountCredentials> loadCredentials() async {
  final cred = await  rootBundle.loadString('assets/json/service_account.json');
  final mapCred = json.decode(cred);
return ServiceAccountCredentials.fromJson(mapCred);
}

Future<AccessCredentials> getAccessToken() async {
  final credentials = await loadCredentials();
  final scopes = ["https://www.googleapis.com/auth/firebase.messaging"];
  final httpClient = http.Client();
  return obtainAccessCredentialsViaServiceAccount(credentials, scopes, httpClient);
}