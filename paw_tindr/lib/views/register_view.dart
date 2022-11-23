import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paw_tindr/database/firebase_storage.dart';
import 'package:paw_tindr/models/owner.dart';
import 'package:paw_tindr/models/pet.dart';
import 'package:uuid/uuid.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final _formKeyDog = GlobalKey<FormState>();

  // Owner Variables
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _password;
  String? _dateOfBirth;
  String? _address;
  String? _zipcode;

  //Dog variables
  String? _dogName;
  String? _dogBreed;
  String? _dogDescription;

  final TextEditingController _dateController = TextEditingController();

  List<Step> stepList() => [
        Step(
          isActive: _activeStepIndex >= 0,
          title: const Text('Owner'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      'Personal Information',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          letterSpacing: 0.5),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        hintText: "First Name",
                        prefixIcon: Icon(Icons.person),
                      ),
                      onSaved: (value) {
                        _firstName = value;
                      },
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        hintText: "Last Name",
                        prefixIcon: Icon(Icons.person),
                      ),
                      onSaved: (value) {
                        _lastName = value;
                      },
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    TextFormField(
                      controller: _dateController,
                      keyboardType: TextInputType.none,
                      decoration: const InputDecoration(
                        hintText: "Date of Birth",
                        prefixIcon: Icon(Icons.calendar_month),
                      ),
                      onTap: () async {
                        var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2023));
                        _dateController.text = date.toString().substring(0, 10);
                      },
                      onSaved: (value) {
                        _dateOfBirth = value;
                      },
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your date of birth.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.streetAddress,
                      decoration: const InputDecoration(
                        hintText: "Street Address",
                        prefixIcon: Icon(Icons.house),
                      ),
                      onSaved: (value) {
                        _address = value;
                      },
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: "Zip Code",
                        prefixIcon: Icon(Icons.location_on),
                      ),
                      onSaved: (value) {
                        _zipcode = value;
                      },
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your zip code.';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 48.0,
                ),
                const Text(
                  'Account Information',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      letterSpacing: 0.5),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: "E-mail Address",
                    prefixIcon: Icon(Icons.account_circle),
                  ),
                  onSaved: (value) {
                    _email = value;
                  },
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your desired username';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                  obscureText: _isObscure,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(
                          () {
                            _isObscure = !_isObscure;
                          },
                        );
                      },
                    ),
                  ),
                  onSaved: (value) {
                    _password = value;
                  },
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                  obscureText: _isObscure,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Re-enter Password",
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(
                          () {
                            _isObscure = !_isObscure;
                          },
                        );
                      },
                    ),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please re-enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24.0,
                ),
              ],
            ),
          ),
        ),
        Step(
          isActive: _activeStepIndex >= 1,
          title: const Text('Dog'),
          content: Form(
            key: _formKeyDog,
            child: Column(
              children: [
                const Text(
                  'Dog Information',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      letterSpacing: 0.5),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    hintText: "Full Name",
                    prefixIcon: Icon(Icons.pets),
                  ),
                  onSaved: (value) {
                    _dogName = value;
                  },
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your dog\'s name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: "Breed",
                    prefixIcon: Icon(Icons.account_tree),
                  ),
                  onSaved: (value) {
                    _dogBreed = value;
                  },
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your dog\'s breed';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  maxLength: 750,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white12, width: 3),
                    ),
                    hintText:
                        "Write a mini dog biography for your dog's profile...",
                  ),
                  onSaved: (value) {
                    _dogDescription = value;
                  },
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your dog\'s mini bio.';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        Step(
          state: StepState.complete,
          isActive: _activeStepIndex >= 2,
          title: const Text('Confirm'),
          content: const Center(
            child: Text('Confirm'),
          ),
        ),
      ];
  int _activeStepIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 48.0, bottom: 16.0),
        child: Stepper(
          steps: stepList(),
          type: StepperType.horizontal,
          currentStep: _activeStepIndex,
          onStepContinue: () {
            final isLastStep = _activeStepIndex == stepList().length - 1;

            if (isLastStep) {
              print('Completed');
            } else {
              setState(() {
                _activeStepIndex += 1;
              });
            }
          },
          onStepTapped: (index) => setState(() {
            if (index == stepList().length - 1) {
              if (_formKeyDog.currentState!.validate() &&
                  _formKey.currentState!.validate()) {
                _activeStepIndex = index;
              }
            } else {
              _activeStepIndex = index;
            }
          }),
          onStepCancel: _activeStepIndex == 0
              ? null
              : () => setState(() => _activeStepIndex -= 1),
          controlsBuilder: (context, details) {
            final isLastStep = _activeStepIndex == stepList().length - 1;

            return Container(
              margin: const EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: details.onStepCancel,
                      child: const Text('Back'),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        // Validate returns true if the form is valid, or false otherwise.
                        switch (_activeStepIndex) {
                          case 0:
                            if (_formKey.currentState!.validate()) {
                              details.onStepContinue!();
                              _formKey.currentState!.save();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Owner Information Saved')),
                              );
                            }
                            break;
                          case 1:
                            if (_formKeyDog.currentState!.validate()) {
                              details.onStepContinue!();
                              _formKeyDog.currentState!.save();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Dog Information Saved')),
                              );
                            }
                            break;
                          case 2:
                            if (_formKey.currentState!.validate() &&
                                _formKeyDog.currentState!.validate()) {
                              details.onStepContinue!();
                              _formKey.currentState!.save();
                              _formKeyDog.currentState!.save();
                              // Create firebase user
                              UserCredential user = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: _email!, password: _password!);
                              // Create owner in firebase
                              Owner owner = Owner(
                                  user.user!.uid,
                                  _firstName!,
                                  _lastName!,
                                  _email!,
                                  _password!,
                                  _dateOfBirth!,
                                  _address!,
                                  _zipcode!, []);

                              Pet pet = Pet(_dogName!, _dogBreed!, const Uuid().v1().toString(), owner.id, _dogDescription!, -1, {});
                              owner.addPet(pet);

                              registerOwnerAndPet(
                                  owner.firstName,
                                  owner.lastName,
                                  owner.email,
                                  owner.password,
                                  owner.birthDate,
                                  owner.address,
                                  owner.zipcode, owner.pets);

                              registerPet(pet.name, pet.breed, pet.id, pet.owner, pet.description, -1, {});

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Profile created')),
                              );
                              Navigator.pop(context);
                            }
                        }
                      },
                      child: Text(isLastStep ? 'Confirm' : 'Next'),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
