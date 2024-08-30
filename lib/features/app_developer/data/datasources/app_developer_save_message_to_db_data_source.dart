import 'package:hadith_books/core/packages/mail_sender/mail_sender_manager.dart';

abstract class IAppDeveloperSaveMessageToDbDataSource {
  Future<void> saveMessageToDb(String name, String message);
}

class AppDeveloperSaveMessageToDbDataSource implements IAppDeveloperSaveMessageToDbDataSource {
  final IMailSenderManager mailManager;

  AppDeveloperSaveMessageToDbDataSource(this.mailManager);

  @override
  Future<void> saveMessageToDb(String name, String message) async {

    bool isSuccess = await mailManager.sendEmail(name, message);
    if (!isSuccess) throw Exception('eror when sending email!!');
  }
}
