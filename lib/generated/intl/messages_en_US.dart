// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en_US locale. All the
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
  String get localeName => 'en_US';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "baseStatsText": MessageLookupByLibrary.simpleMessage("Base Stats"),
        "genericErrorPokedexText":
            MessageLookupByLibrary.simpleMessage("AN ERROR HAS OCCURRED :("),
        "heightPropertyText": MessageLookupByLibrary.simpleMessage("Height"),
        "movesPropertyText": MessageLookupByLibrary.simpleMessage("Moves"),
        "networkErrorPokedexText":
            MessageLookupByLibrary.simpleMessage("INTERNET ERROR :("),
        "notFoundPokemonErrorPokedexText":
            MessageLookupByLibrary.simpleMessage("POKEMON NOT FOUND :("),
        "pageTitle": MessageLookupByLibrary.simpleMessage("ioasys pokedex"),
        "snackBarText": MessageLookupByLibrary.simpleMessage(
            "FAVORITES SCREEN NOT IMPLEMENTED YET!"),
        "textFieldPokedexTitle":
            MessageLookupByLibrary.simpleMessage("Search Pokemon"),
        "weightPropertyText": MessageLookupByLibrary.simpleMessage("Weight")
      };
}
