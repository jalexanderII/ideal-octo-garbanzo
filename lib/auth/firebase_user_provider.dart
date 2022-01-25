import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ZeroFirebaseUser {
  ZeroFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

ZeroFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ZeroFirebaseUser> zeroFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<ZeroFirebaseUser>((user) => currentUser = ZeroFirebaseUser(user));
