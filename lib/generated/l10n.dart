// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Model List`
  String get modelList {
    return Intl.message(
      'Model List',
      name: 'modelList',
      desc: 'Home page title',
      args: [],
    );
  }

  /// `Sign Up`
  String get register {
    return Intl.message(
      'Sign Up',
      name: 'register',
      desc: 'Register button label',
      args: [],
    );
  }

  /// `Sign In`
  String get login {
    return Intl.message(
      'Sign In',
      name: 'login',
      desc: 'Login button label',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: 'Password button label',
      args: [],
    );
  }

  /// `by`
  String get by {
    return Intl.message(
      'by',
      name: 'by',
      desc: 'By text',
      args: [],
    );
  }

  /// `The password is too weak.`
  String get weakPassword {
    return Intl.message(
      'The password is too weak.',
      name: 'weakPassword',
      desc: 'Weak password error message',
      args: [],
    );
  }

  /// `Email already registered.`
  String get emailAlreadyInUse {
    return Intl.message(
      'Email already registered.',
      name: 'emailAlreadyInUse',
      desc: 'Email already in use error message',
      args: [],
    );
  }

  /// `Invalid email.`
  String get invalidEmail {
    return Intl.message(
      'Invalid email.',
      name: 'invalidEmail',
      desc: 'Invalid email error message',
      args: [],
    );
  }

  /// `Internal error`
  String get internalError {
    return Intl.message(
      'Internal error',
      name: 'internalError',
      desc: 'Internal error message',
      args: [],
    );
  }

  /// `User not found.`
  String get userNotFound {
    return Intl.message(
      'User not found.',
      name: 'userNotFound',
      desc: 'User not found error message',
      args: [],
    );
  }

  /// `Invalid credentials.`
  String get wrongPassword {
    return Intl.message(
      'Invalid credentials.',
      name: 'wrongPassword',
      desc: 'Wrong password error message',
      args: [],
    );
  }

  /// `Unable to sign in.`
  String get unableToSignIn {
    return Intl.message(
      'Unable to sign in.',
      name: 'unableToSignIn',
      desc: 'Unable to sign in error message',
      args: [],
    );
  }

  /// `You need to enter a display name.`
  String get displayNameMissing {
    return Intl.message(
      'You need to enter a display name.',
      name: 'displayNameMissing',
      desc: 'Display name missing error message',
      args: [],
    );
  }

  /// `display name`
  String get displayName {
    return Intl.message(
      'display name',
      name: 'displayName',
      desc: '',
      args: [],
    );
  }

  /// `profile photo url`
  String get photoURL {
    return Intl.message(
      'profile photo url',
      name: 'photoURL',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
