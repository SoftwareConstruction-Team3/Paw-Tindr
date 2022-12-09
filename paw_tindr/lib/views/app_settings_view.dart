import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import '../models/owner.dart';

class AppSettings extends StatefulWidget {
  final Owner user;
  const AppSettings(this.user, {super.key});

  @override
  _AppSettingsState createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SettingsGroup(
          title: //'Test',
              const Text('User Settings',
                      style: TextStyle(color: Colors.orangeAccent))
                  .data,
          children: <Widget>[
            TextInputSettingsTile(
              title: 'Email',
              settingKey: 'key-user-email',
              initialValue: widget.user.email,
              validator: (String email) {
                if (email.length > 3) {
                  // widget.user.email = email;
                  return null;
                }
                return "User Name can't be smaller than 4 letters";
              },
              borderColor: Colors.orangeAccent,
              errorColor: Colors.deepOrangeAccent,
            ),
            TextInputSettingsTile(
              title: 'Edit Password',
              settingKey: 'key-user-password',
              obscureText: true,
              validator: (String password) {
                if (password.length > 6) {
                  // widget.user.password = password;
                  return null;
                }
                return "Password can't be smaller than 7 letters";
              },
              borderColor: Colors.orangeAccent,
              errorColor: Colors.deepOrangeAccent,
            ),
            TextInputSettingsTile(
              title: 'First Name',
              settingKey: 'key-user-name',
              initialValue: widget.user.firstName,
              validator: (String fname) {
                if (fname.length >= 2) {
                  // widget.user.firstName = fname;
                  return null;
                }
                return "Name can't be smaller than 2 letters";
              },
              borderColor: Colors.orangeAccent,
              errorColor: Colors.deepOrangeAccent,
            ),
            TextInputSettingsTile(
              title: 'Last Name',
              settingKey: 'key-user-name',
              initialValue: widget.user.lastName,
              validator: (String lname) {
                if (lname.length >= 2) {
                  // widget.user.lastName = lname;
                  return null;
                }
                return "Name can't be smaller than 2 letters";
              },
              borderColor: Colors.orangeAccent,
              errorColor: Colors.deepOrangeAccent,
            ),
            TextInputSettingsTile(
              title: 'Address',
              settingKey: 'key-user-address',
              initialValue: widget.user.address,
              validator: (String address) {
                if (address.length >= 6) {
                  // widget.user.address = address;
                  return null;
                }
                return "Enter Valid address";
              },
              borderColor: Colors.orangeAccent,
              errorColor: Colors.deepOrangeAccent,
            ),
            TextInputSettingsTile(
              title: 'Zip Code',
              settingKey: 'key-user-zip',
              initialValue: widget.user.zipcode,
              validator: (String zip) {
                if (zip.length == 5) {
                  // widget.user.zipcode = zip;
                  return null;
                }
                return "Zip code can't be smaller than 5 numbers";
              },
              borderColor: Colors.orangeAccent,
              errorColor: Colors.deepOrangeAccent,
            ),
          ],
        ),
      ],
    );
  }
}
