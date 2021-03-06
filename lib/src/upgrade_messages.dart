/*
 * Copyright (c) 2020 Larry Aasen. All rights reserved.
 */

import 'package:flutter/material.dart';

/// The message identifiers used in upgrader.
enum UpgraderMessage {
  /// Body of the upgrade message
  body,

  /// Ignore button
  buttonTitleIgnore,

  /// Later button
  buttonTitleLater,

  /// Update Now button
  buttonTitleUpdate,

  /// Prompt message
  prompt,

  /// Title
  title,
}

/// The default localized messages used for display in upgrader. Extend this
/// class to provide custom values and new localizations for languages.
/// An example to replace the Ignore button with a custom value would be:
///
/// ```dart
/// class MyUpgraderMessages extends UpgraderMessages {
///   @override
///   String get buttonTitleIgnore => 'My Ignore';
/// }
///
/// UpgradeAlert(messages: MyUpgraderMessages());
/// ```
///
class UpgraderMessages {
  /// The primary language subtag for the locale, which defaults to the
  /// system-reported default locale of the device.
  final String languageCode;

  /// Provide a [code] to override the system-reported default locale.
  UpgraderMessages({String code}) : languageCode = code ?? findLanguageCode();

  /// Override the message function to provide custom language localization.
  String message(UpgraderMessage messageKey) {
    switch (messageKey) {
      case UpgraderMessage.body:
        return body;
      case UpgraderMessage.buttonTitleIgnore:
        return buttonTitleIgnore;
      case UpgraderMessage.buttonTitleLater:
        return buttonTitleLater;
      case UpgraderMessage.buttonTitleUpdate:
        return buttonTitleUpdate;
      case UpgraderMessage.prompt:
        return prompt;
      case UpgraderMessage.title:
        return title;
      default:
    }
    return null;
  }

  /// Determine the current language code, either from the context, or
  /// from the system-reported default locale of the device.
  static String findLanguageCode({BuildContext context}) {
    Locale locale;
    if (context != null) {
      locale = Localizations.localeOf(context, nullOk: true);
    } else {
      // Get the system locale
      locale = WidgetsBinding.instance.window.locale;
    }
    final code = locale == null ? 'en' : locale.languageCode;
    return code;
  }

  /// The body of the upgrade message. This string supports mustache style
  /// template variables:
  ///   {{appName}}
  ///   {{currentAppStoreVersion}}
  ///   {{currentInstalledVersion}}
  /// Example:
  ///  'A new version of Upgrader is available! Version 1.2 is now available-you have 1.0.';

  /// Override this getter to provide a custom value. Values provided in the
  /// [message] function will be used over this value.
  String get body {
    String message;
    switch (languageCode) {
      case 'en':
        message =
            'A new version of {{appName}} is available! Version {{currentAppStoreVersion}} is now available-you have {{currentInstalledVersion}}.';
        break;
      case 'ar':
        message =
            'نسخة جديدة من {{appName}} متوفرة! النسخة {{currentAppStoreVersion}} متوفرة الآن, أنت تستخدم النسخة {{currentInstalledVersion}}.';
        break;
      case 'es':
        message =
            '¡Una nueva versión de {{appName}} está disponible! La versión {{currentAppStoreVersion}} ya está disponible-usted tiene {{currentInstalledVersion}}.';
        break;
      case 'fr':
        message =
            'Une nouvelle version de {{appName}} est disponible ! La version {{currentAppStoreVersion}} est maintenant disponible, vous avez la version {{currentInstalledVersion}}.';
        break;
      case 'pt':
        message =
            'Há uma nova versão do {{appName}} disponível! A versão {{currentAppStoreVersion}} já está disponível, você tem a {{currentInstalledVersion}}.';
        break;
      case 'pl':
        message =
            'Nowa wersja {{appName}} jest dostępna! Wersja {{currentAppStoreVersion}} jest dostępna, Ty masz {{currentInstalledVersion}}.';
        break;
    }
    return message;
  }

  /// The ignore button title.
  /// Override this getter to provide a custom value. Values provided in the
  /// [message] function will be used over this value.
  String get buttonTitleIgnore {
    String message;
    switch (languageCode) {
      case 'en':
        message = 'IGNORE';
        break;
      case 'ar':
        message = 'تجاهل';
        break;
      case 'es':
        message = 'IGNORAR';
        break;
      case 'fr':
        message = 'IGNORER';
        break;
      case 'pt':
        message = 'IGNORAR';
        break;
      case 'pl':
        message = 'IGNORUJ';
        break;
    }
    return message;
  }

  /// The later button title.
  /// Override this getter to provide a custom value. Values provided in the
  /// [message] function will be used over this value.
  String get buttonTitleLater {
    String message;
    switch (languageCode) {
      case 'en':
        message = 'LATER';
        break;
      case 'ar':
        message = 'لاحقاً';
        break;
      case 'es':
        message = 'MÁS TARDE';
        break;
      case 'fr':
        message = 'PLUS TARD';
        break;
      case 'pt':
        message = 'MAIS TARDE';
        break;
      case 'pl':
        message = 'PÓŹNIEJ';
        break;
    }
    return message;
  }

  /// The update button title.
  /// Override this getter to provide a custom value. Values provided in the
  /// [message] function will be used over this value.
  String get buttonTitleUpdate {
    String message;
    switch (languageCode) {
      case 'en':
        message = 'UPDATE NOW';
        break;
      case 'ar':
        message = 'حدث الآن';
        break;
      case 'es':
        message = 'ACTUALIZAR';
        break;
      case 'fr':
        message = 'MAINTENANT';
        break;
      case 'pt':
        message = 'ATUALIZAR';
        break;
      case 'pl':
        message = 'AKTUALIZUJ';
        break;
    }
    return message;
  }

  /// The call to action prompt message.
  /// Override this getter to provide a custom value. Values provided in the
  /// [message] function will be used over this value.
  String get prompt {
    String message;
    switch (languageCode) {
      case 'en':
        message = 'Would you like to update it now?';
        break;
      case 'ar':
        message = 'هل تفضل أن يتم التحديث الآن';
        break;
      case 'es':
        message = '¿Le gustaría actualizar ahora?';
        break;
      case 'fr':
        message = 'Voulez-vous mettre à jour maintenant?';
        break;
      case 'pt':
        message = 'Você quer atualizar agora?';
        break;
      case 'pl':
        message = 'Czy chciałbyś zaktualizować teraz?';
        break;
    }
    return message;
  }

  /// The alert dialog title.
  /// Override this getter to provide a custom value. Values provided in the
  /// [message] function will be used over this value.
  String get title {
    String message;
    switch (languageCode) {
      case 'en':
        message = 'Update App?';
        break;
      case 'ar':
        message = 'هل تريد تحديث التطبيق؟';
        break;
      case 'es':
        message = '¿Actualizar la aplicación?';
        break;
      case 'fr':
        message = 'Mettre à jour l\'application?';
        break;
      case 'pt':
        message = 'Atualizar aplicação?';
        break;
      case 'pl':
        message = 'Czy zaktualizować aplikację?';
        break;
    }
    return message;
  }
}
