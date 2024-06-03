import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

// send message to email 
Future<void> sendEmail(String subject, String body) async {
     final smtpServer = SmtpServer(
        'smtp.mail.ru',
        port: 465,
        ssl: true,
        username: 'myxacyka3@mail.ru', // email 
        password: 'jvSpjb2LswRgqdmXegmN', // email password (in security settings)
      );


    final message = Message()
      ..from = const Address('myxacyka3@mail.ru', 'user') // send in this email
      ..recipients.add(const Address('myxacyka3@mail.ru', 'user'))
      ..subject = subject
      ..text = body;

    try {
      final sendReport = await send(message, smtpServer);
      // ignore: avoid_print
      print('Message sent: $sendReport');
    } catch (e) {
      // ignore: avoid_print
      print('Message not sent: ${e.toString()}');
    }
}
