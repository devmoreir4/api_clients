import 'dart:io';

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
  });

  tearDown(() => p.kill());

  group('API Clients', () {
    test('deve conter content-type "application/json"', () async {
      final response = await get(Uri.parse('$host/clients'));
      expect(response.statusCode, 200);
      expect(response.headers['content-type'], 'application/json');
    });
  });
}
