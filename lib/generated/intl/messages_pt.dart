// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pt';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "by": MessageLookupByLibrary.simpleMessage("por"),
        "displayName": MessageLookupByLibrary.simpleMessage("nome de exibição"),
        "displayNameMissing": MessageLookupByLibrary.simpleMessage(
            "Escolha um nome de exibição."),
        "emailAlreadyInUse":
            MessageLookupByLibrary.simpleMessage("Email já cadastrado."),
        "internalError": MessageLookupByLibrary.simpleMessage("Erro interno."),
        "invalidEmail": MessageLookupByLibrary.simpleMessage("Email inválido."),
        "login": MessageLookupByLibrary.simpleMessage("Entrar"),
        "modelList": MessageLookupByLibrary.simpleMessage("Lista de Modelos"),
        "password": MessageLookupByLibrary.simpleMessage("Senha"),
        "photoURL":
            MessageLookupByLibrary.simpleMessage("url da foto de perfil"),
        "register": MessageLookupByLibrary.simpleMessage("Cadastrar-se"),
        "unableToSignIn":
            MessageLookupByLibrary.simpleMessage("Não foi possível entrar."),
        "userNotFound":
            MessageLookupByLibrary.simpleMessage("Usuário não encontrado."),
        "weakPassword":
            MessageLookupByLibrary.simpleMessage("A senha é muito fraca."),
        "wrongPassword":
            MessageLookupByLibrary.simpleMessage("Credenciais inválidas.")
      };
}
