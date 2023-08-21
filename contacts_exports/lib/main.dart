import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MaterialApp(home: ContactExportScreen()));
}

class ContactExportScreen extends StatefulWidget {
  const ContactExportScreen({super.key});
  @override
  State<ContactExportScreen> createState() => _ContactExportScreenState();
}

class _ContactExportScreenState extends State<ContactExportScreen> {
  List<Contact> _contacts = [];

  @override
  void initState() {
    super.initState();
    _requestPermissionAndFetchContacts();
  }

  Future<void> _requestPermissionAndFetchContacts() async {
    var status = await Permission.contacts.request();
    if (status.isGranted) {
      _fetchContacts();
    } else {
      // Handle permission denied
      print('Permission denied');
    }
  }

  Future<void> _fetchContacts() async {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Export Contacts'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _contacts.length,
          itemBuilder: (context, index) {
            var contact = _contacts[index];
            print(contact.phones!);
            return ListTile(
              title: Text(contact.displayName ?? ''),
              subtitle: Text(
                contact.phones!.map((phone) => phone.value).join('\n'),
              ),
            );
          },
        ),
      ),
    );
  }
}
