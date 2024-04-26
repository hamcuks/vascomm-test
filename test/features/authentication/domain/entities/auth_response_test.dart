import 'package:flutter_test/flutter_test.dart';
import 'package:vascomm_test/features/authentication/domain/entities/auth_response.dart';

void main() {
  group('AuthResponse equality', () {
    test('Two auth response entity with same value are equal', () {
      const authRes1 = AuthResponse('token');
      const authRes2 = AuthResponse('token');

      expect(authRes1, equals(authRes2));
    });

    test('Two auth response entity with different value are not equal', () {
      const authRes1 = AuthResponse('token');
      const authRes2 = AuthResponse('tokenabc');

      expect(authRes1, isNot(equals(authRes2)));
    });
  });
}
