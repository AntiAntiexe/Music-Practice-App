import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mysql_client/mysql_client.dart';
import 'package:http/http.dart' as http;


Future<void> main() async {
  // Make sure that DataBase is created before connecting

  final conn = await MySQLConnection.createConnection(
        host: "192.168.1.82", // Add your host IP address or server name
        port: 3306, // Add the port the server is running on
        userName: "root", // Your username
        password: "Dibat2009", // Your password
        databaseName: "practice_app", // Your DataBase name
      );

  conn.connect();
}