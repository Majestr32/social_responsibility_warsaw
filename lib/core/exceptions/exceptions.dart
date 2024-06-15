import 'package:flashcards/presentation/blocs/locale/locale_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Map<String, Map<LocaleEnum, String>> _localizedExceptionsKeys = {
  'max-file-size-5mb': {
    LocaleEnum.english: "File is too big, maximum 5 mb",
    LocaleEnum.german: "Die Datei ist zu groß, maximal 5 MB",
    LocaleEnum.poland: "Plik jest za duży, maksymalnie 5 MB"
  },
  'failed-upload-pdf': {
    LocaleEnum.english: "Failed to upload pdf",
    LocaleEnum.german: "PDF-Datei konnte nicht hochgeladen werden",
    LocaleEnum.poland: "Nie udało się przesłać pliku PDF"
  },
  'failed-find-pdfs': {
    LocaleEnum.english: "Failed to find pdf files",
    LocaleEnum.german: "PDF-Dateien konnten nicht gefunden werden",
    LocaleEnum.poland: "Nie udało się znaleźć plików PDF"
  },
  'user-already-exists': {
    LocaleEnum.english: "User with such email already exists",
    LocaleEnum.german: "Benutzer mit dieser E-Mail existiert bereits",
    LocaleEnum.poland: "Użytkownik z takim adresem email już istnieje"
  },
  'email-or-password-wrong': {
    LocaleEnum.english: "Email or password is wrong",
    LocaleEnum.german: "E-Mail oder Passwort ist falsch",
    LocaleEnum.poland: "Email lub hasło jest nieprawidłowe"
  },
  'user-disabled': {
    LocaleEnum.english: 'User corresponding to the given email has been disabled.',
    LocaleEnum.german: "Der Benutzer, der der angegebenen E-Mail entspricht, wurde deaktiviert.",
    LocaleEnum.poland: "Użytkownik odpowiadający podanemu adresowi email został wyłączony."
  },
  'user-not-found': {
    LocaleEnum.english: 'There is no user corresponding to the given email',
    LocaleEnum.german: "Es gibt keinen Benutzer, der der angegebenen E-Mail entspricht",
    LocaleEnum.poland: "Nie ma użytkownika odpowiadającego podanemu adresowi email"
  },
  'account-exists-with-different-credential': {
    LocaleEnum.english: 'There already exists an account with the email address asserted by the credential',
    LocaleEnum.german: "Es existiert bereits ein Konto mit der E-Mail-Adresse, die durch das Anmeldeinformationen beansprucht wird",
    LocaleEnum.poland: "Istnieje już konto z adresem email podanym przez poświadczenia"
  },
  'invalid-credential': {
    LocaleEnum.english: 'The credential is malformed or has expired',
    LocaleEnum.german: "Das Anmeldeinformationen ist fehlerhaft oder abgelaufen",
    LocaleEnum.poland: "Poświadczenia są nieprawidłowe lub wygasły"
  },
  'weak-password': {
    LocaleEnum.english: 'The password provided is too weak.\nMust be more than 6 digits',
    LocaleEnum.german: "Das eingegebene Passwort ist zu schwach.\nEs müssen mehr als 6 Ziffern sein",
    LocaleEnum.poland: "Podane hasło jest zbyt słabe.\nMusi mieć więcej niż 6 znaków"
  },
  'email-already-in-use': {
    LocaleEnum.english: 'The account already exists for that email',
    LocaleEnum.german: "Das Konto existiert bereits für diese E-Mail-Adresse",
    LocaleEnum.poland: "Konto z tym adresem email już istnieje"
  },
};


class LocalizedException implements Exception {
  final String message;
  final String? localizationKey;
  final String? attribute;

  String localizedMessageOrDefault(BuildContext context) =>
      _localizedExceptionsKeys[localizationKey]
          ?[context.read<LocaleCubit>().state] ??
      message;

  LocalizedException({
    required this.message,
    this.localizationKey,
    this.attribute,
  });
}
