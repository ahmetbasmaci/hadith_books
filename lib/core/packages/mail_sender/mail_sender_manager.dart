import 'package:url_launcher/url_launcher.dart';

abstract class IMailSenderManager {
  Future<bool> sendEmail(String email, String message);
}

class MailSenderManager implements IMailSenderManager {
  /// Sends an email using the `flutter_email_sender` package.
  ///
  /// This method creates an `Email` object with the provided parameters and sends it using the `FlutterEmailSender.send()` method.
  ///
  /// Parameters:
  /// - `email`: The email address to send the email to.
  /// - `message`: The message body of the email.
  ///
  /// Returns:
  /// - `true` if the email was sent successfully, `false` otherwise.
  @override
  Future<bool> sendEmail(String email, String message) async {
    try {
      final Uri url = Uri.parse('mailto:$email?subject=From User&body=$message');
      await launchUrl(url);

      return true;
    } catch (error) {
      print('Failed to send email: $error');
      return false;
    }
  }
}
