import 'dart:io';

void main() {
  Map<String, String> addressBook = {};

  while (true) {
    print('\nAddress Book');
    print('1. View Contacts');
    print('2. Add Contact');
    print('3. Update Contact');
    print('4. Remove Contact');
    print('5. Exit');
    stdout.write('Choose an option: ');
    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        print(addressBook);
        break;
      case '2':
        addContact(addressBook);
        break;
      case '3':
        updateContact(addressBook);
        break;
      case '4':
        removeContact(addressBook);
        break;
      case '5':
        exit(0);
      default:
        print('Invalid option!');
    }
  }
}

void addContact(Map<String, String> book) {
  stdout.write('Enter name: ');
  String? name = stdin.readLineSync();
  stdout.write('Enter phone: ');
  String? phone = stdin.readLineSync();

  if (name != null && phone != null) {
    book[name] = phone;
    print('Contact added!');
  }
}

void updateContact(Map<String, String> book) {
  stdout.write('Enter name to update: ');
  String? name = stdin.readLineSync();

  if (book.containsKey(name)) {
    stdout.write('Enter new phone: ');
    String? phone = stdin.readLineSync();
    if (phone != null) {
      book[name!] = phone;
      print('Contact updated!');
    }
  } else {
    print('Contact not found!');
  }
}

void removeContact(Map<String, String> book) {
  stdout.write('Enter name to remove: ');
  String? name = stdin.readLineSync();

  if (book.remove(name) != null) {
    print('Contact removed!');
  } else {
    print('Contact not found!');
  }
}