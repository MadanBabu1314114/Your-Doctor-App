import 'package:flutter/material.dart';
import '../services/shared_pref_service.dart';

class AuthProvider extends ChangeNotifier {
  final _prefs = SharedPrefService();
  bool _loading = true;
  bool _loggedIn = false;
  String? _username;

  bool get loading => _loading;
  bool get isLoggedIn => _loggedIn;
  String? get username => _username;

  Future<void> init() async {
    _loggedIn = await _prefs.isLoggedIn();
    if (_loggedIn) {
      _username = await _prefs.getUsername();
    }
    _loading = false;
    notifyListeners();
  }

  Future<void> login(String username, String password) async {
    // Dummy validation: accept any non-empty
    if (username.isNotEmpty && password.isNotEmpty) {
      await _prefs.saveLogin(username);
      _username = username;
      _loggedIn = true;
      notifyListeners();
    }
  }

  Future<void> register(String username, String password) async {
    // In real app, backend call here
    await login(username, password);
  }

  Future<void> logout() async {
    await _prefs.logout();
    _loggedIn = false;
    _username = null;
    notifyListeners();
  }
}
