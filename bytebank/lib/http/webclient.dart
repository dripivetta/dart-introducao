import 'dart:convert';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:teste/http/interceptors/logging_interceptor.dart';
import 'package:teste/models/contact.dart';
import 'package:teste/models/transaction.dart';



final Client client =
    InterceptedClient.build(interceptors: [LoggingInterceptor()]);

const String baseUrl = 'http://192.168.1.19:8080/transactions';

