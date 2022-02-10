import 'package:mail_app/models/contact_model.dart';

class MessageModel {
  final List<ContactModel> receiver;
  final String Subject;
  final String Body;

  MessageModel({
    required this.receiver,
    required this.Subject,
    required this.Body,
  });
}
