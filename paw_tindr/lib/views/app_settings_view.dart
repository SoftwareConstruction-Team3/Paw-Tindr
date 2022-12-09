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
      //SettingsScreen(
      //title: '', //'Application Settings',
      children: [
        SettingsGroup(
          title: //'Test',
              const Text('User Settings',
                      style: TextStyle(color: Colors.orangeAccent))
                  .data,
          children: <Widget>[
            // SimpleSettingsTile(
            //   title: 'More Settings',
            //   subtitle: 'General App Settings',
            //   child: SettingsScreen(
            //     title: 'App Settings',
            //     children: <Widget>[
            //       CheckboxSettingsTile(
            //         leading: const Icon(Icons.adb),
            //         settingKey: 'key-is-developer',
            //         title: 'Developer Mode',
            //         onChange: (bool value) {
            //           debugPrint('Developer Mode ${value ? 'on' : 'off'}');
            //         },
            //       ),
            //       SwitchSettingsTile(
            //         leading: const Icon(Icons.usb),
            //         settingKey: 'key-is-usb-debugging',
            //         title: 'USB Debugging',
            //         onChange: (value) {
            //           debugPrint('USB Debugging: $value');
            //         },
            //       ),
            //     ],
            //   ),
            // ),
            TextInputSettingsTile(
              title: 'Email',
              settingKey: 'key-user-email',
              initialValue: widget.user.email,
              validator: (String email) {
                if (email.length > 3) {
                  widget.user.email = email;
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
                  widget.user.password = password;
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
                  widget.user.firstName = fname;
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
              initialValue: widget.user.firstName,
              validator: (String lname) {
                if (lname.length >= 2) {
                  widget.user.lastName = lname;
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
                  widget.user.address = address;
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
                  widget.user.zipcode = zip;
                  return null;
                }
                return "Zip code can't be smaller than 5 numbers";
              },
              borderColor: Colors.orangeAccent,
              errorColor: Colors.deepOrangeAccent,
            ),
            //   ExpandableSettingsTile(
            //     title: 'Quick setting 2',
            //     subtitle: 'Expandable Settings',
            //     expanded: true,
            //     children: <Widget>[
            //       CheckboxSettingsTile(
            //         settingKey: 'key-day-light-savings-2',
            //         title: 'Daylight Time Saving',
            //         enabledLabel: 'Enabled',
            //         disabledLabel: 'Disabled',
            //         leading: const Icon(Icons.timelapse),
            //         onChange: (value) {
            //           debugPrint('key-day-light-savings-2: $value');
            //         },
            //       ),
            //       SwitchSettingsTile(
            //         settingKey: 'key-dark-mode-2',
            //         title: 'Dark Mode',
            //         enabledLabel: 'Enabled',
            //         disabledLabel: 'Disabled',
            //         leading: const Icon(Icons.palette),
            //         onChange: (value) {
            //           debugPrint('key-dark-mode-2: $value');
            //         },
            //       ),
            //     ],
            //   ),
          ],
        ),
        // ExpandableSettingsTile(
        //   title: 'Expandable Group Settings',
        //   subtitle: 'Group of settings (expandable)',
        //   children: <Widget>[
        //     RadioSettingsTile<double>(
        //       title: 'Beauty Filter',
        //       settingKey: 'key-radio-beauty-filter-expandable',
        //       values: <double, String>{
        //         1.0: 'Simple',
        //         1.5: 'Normal',
        //         2.0: 'Little Special',
        //         2.5: 'Special',
        //         3.0: 'Extra Special',
        //         3.5: 'Bizarre',
        //         4.0: 'Horrific',
        //       },
        //       selected: 2.5,
        //       onChange: (value) {
        //         debugPrint('key-radio-beauty-filter-expandable: $value');
        //       },
        //     ),
        //     DropDownSettingsTile<int>(
        //       title: 'Preferred Sync Period',
        //       settingKey: 'key-dropdown-sync-period-2',
        //       values: <int, String>{
        //         0: 'Never',
        //         1: 'Daily',
        //         7: 'Weekly',
        //         15: 'Fortnight',
        //         30: 'Monthly',
        //       },
        //       selected: 0,
        //       onChange: (value) {
        //         debugPrint('key-dropdown-sync-period-2: $value');
        //       },
        //     )
        //   ],
        // ),

        // SettingsGroup(
        //   title: 'Other settings',
        //   children: <Widget>[
        //     SliderSettingsTile(
        //       title: 'Volume [Auto-Adjusting to 20]',
        //       settingKey: 'key-slider-volume',
        //       defaultValue: 20,
        //       min: 0,
        //       max: 100,
        //       step: 1,
        //       leading: Icon(Icons.volume_up),
        //       onChange: (value) {
        //         debugPrint('\n===== on change end =====\n'
        //             'key-slider-volume: $value'
        //             '\n==========\n');
        //         Future.delayed(Duration(seconds: 1), () {
        //           // Reset value only if the current value is not 20
        //           if (Settings.getValue('key-slider-volume', 0) != 20) {
        //             debugPrint('\n===== on change end =====\n'
        //                 'Resetting value to 20'
        //                 '\n==========\n');
        //             Settings.setValue('key-slider-volume', 20.0);
        //           }
        //         });
        //       },
        //     ),
        //     ColorPickerSettingsTile(
        //       settingKey: 'key-color-picker',
        //       title: 'Accent Color',
        //       defaultValue: Colors.blue,
        //       onChange: (value) {
        //         debugPrint('key-color-picker: $value');
        //       },
        //     )
        //   ],
        // ),
        // ModalSettingsTile(
        //   title: 'Other settings',
        //   subtitle: 'Other Settings in a Dialog',
        //   children: <Widget>[
        //     SliderSettingsTile(
        //       title: 'Custom Ratio',
        //       settingKey: 'key-custom-ratio-slider-2',
        //       defaultValue: 2.5,
        //       min: 1,
        //       max: 5,
        //       step: 0.1,
        //       leading: Icon(Icons.aspect_ratio),
        //       onChange: (value) {
        //         debugPrint('\n===== on change =====\n'
        //             'key-custom-ratio-slider-2: $value'
        //             '\n==========\n');
        //       },
        //       onChangeStart: (value) {
        //         debugPrint('\n===== on change start =====\n'
        //             'key-custom-ratio-slider-2: $value'
        //             '\n==========\n');
        //       },
        //       onChangeEnd: (value) {
        //         debugPrint('\n===== on change end =====\n'
        //             'key-custom-ratio-slider-2: $value'
        //             '\n==========\n');
        //       },
        //     ),
        //     ColorPickerSettingsTile(
        //       settingKey: 'key-color-picker-2',
        //       title: 'Accent Picker',
        //       defaultValue: Colors.blue,
        //       onChange: (value) {
        //         debugPrint('key-color-picker-2: $value');
        //       },
        //     )
        //   ],
        // )
      ],
    );
  }
}
