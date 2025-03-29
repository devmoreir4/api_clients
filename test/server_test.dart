import 'dart:convert';
import 'dart:io';

import 'package:api_clients/config/config.dart';
import 'package:http/http.dart';
import 'package:test/test.dart';

void main() {
  final port = '8080';
  final host = 'http://localhost:$port';
  late Process p;

  setUp(() async {
    p = await Process.start(
      'dart',
      ['run', 'bin/server.dart'],
      environment: {'PORT': port},
    );
    // Wait for server to start and print to stdout.
    await p.stdout.first;

    // reset database
    await connection.query("DELETE FROM clients");
  });

  tearDown(() => p.kill());

  group('API Clients', () {
    test('deve conter content-type "application/json"', () async {
      final response = await get(Uri.parse('$host/clients'));
      expect(response.headers['content-type'], 'application/json');
    });

    test('GET /clients 200', () async {
      final response = await get(Uri.parse('$host/clients'));
      expect(response.statusCode, 200);
    });

    test('GET /clients/{clientId} 404', () async {
      final response = await get(Uri.parse('$host/clients/-1'));
      expect(response.statusCode, 404);
    });

    test('GET /clients/{clientId} 200', () async {
      final response = await post(Uri.parse('$host/clients'),
          body: jsonEncode({
            "name": "nome test",
            "email": "email@email.com",
            "phone": "011 1111-1111"
          }));

      final client = jsonDecode(response.body);

      final responsePesquisa =
          await get(Uri.parse('$host/clients/${client["id"]}'));
      expect(responsePesquisa.statusCode, 200);
    });

    test('DELETE /clients/{clientId} 404', () async {
      final response = await delete(Uri.parse('$host/clients/-1'));
      expect(response.statusCode, 404);
    });

    test('DELETE /clients/{clientId} 204', () async {
      final response = await post(Uri.parse('$host/clients'),
          body: jsonEncode({
            "name": "nome test",
            "email": "email@email.com",
            "phone": "011 1111-1111"
          }));

      final client = jsonDecode(response.body);

      final responseDELETE =
          await delete(Uri.parse('$host/clients/${client["id"]}'));
      expect(responseDELETE.statusCode, 204);
    });

    test('PUT /clients/{clientId} 404', () async {
      final response = await put(Uri.parse('$host/clients/-1'),
          body: jsonEncode({
            "name": "nome test",
            "email": "email@email.com",
            "phone": "011 1111-1111"
          }));
      expect(response.statusCode, 404);
    });

    test('PUT /clients/{clientId} 200', () async {
      final response = await post(Uri.parse('$host/clients'),
          body: jsonEncode({
            "name": "nome test",
            "email": "email@email.com",
            "phone": "011 1111-1111"
          }));

      final client = jsonDecode(response.body);

      final responseUpdate = await put(
          Uri.parse('$host/clients/${client["id"]}'),
          body: jsonEncode({
            "name": "nome test 1",
            "email": "email1@email.com",
            "phone": "022 1111-1111"
          }));

      final clientUpdated = jsonDecode(responseUpdate.body);
      expect(responseUpdate.statusCode, 200);
      expect(clientUpdated["name"], "nome test 1");
      expect(clientUpdated["email"], "email1@email.com");
      expect(clientUpdated["phone"], "022 1111-1111");
    });

    test('POST /clients 201', () async {
      final response = await post(Uri.parse('$host/clients'),
          body: jsonEncode({
            "name": "nome test",
            "email": "email1@email1.com",
            "phone": "011 1111-1111"
          }));
      expect(response.statusCode, 201);
    });

    test('POST /clients 400', () async {
      await post(Uri.parse('$host/clients'),
          body: jsonEncode({
            "name": "nome test",
            "email": "email1@email1.com",
            "phone": "011 1111-1111"
          }));

      final response = await post(Uri.parse('$host/clients'),
          body: jsonEncode({
            "name": "nome test",
            "email": "email1@email1.com",
            "phone": "011 1111-1111"
          }));
      expect(response.statusCode, 400);
    });

    test('POST /clients 400 - A client with this email already exists', () async {
      await post(Uri.parse('$host/clients'),
          body: jsonEncode({
            "name": "nome test",
            "email": "email1@email1.com",
            "phone": "011 1111-1111"
          }));

      final response = await post(Uri.parse('$host/clients'),
          body: jsonEncode({
            "name": "nome test",
            "email": "email1@email1.com",
            "phone": "011 1111-1111"
          }));
      expect(jsonDecode(response.body)["message"],
          "A client with this email already exists");
    });
  });
}
