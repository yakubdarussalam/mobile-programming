import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(ProfileEditScreen());
}

class ProfileEditScreen extends StatelessWidget {
  ProfileEditScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {
    'name': '',
    'position': '',
    'email': '',
    'phoneNumber': '',
    'address': '',
    'country': '',
    'state': '',
    'bornDate': DateTime.now(),
  };

  final nameFocusNode = FocusNode();
  final positionFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final phoneNumberFocusNode = FocusNode();
  final addressFocusNode = FocusNode();
  final countryFocusNode = FocusNode();
  final stateFocusNode = FocusNode();

  onSubmit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Get.snackbar("Form Data",
          "Name: ${formData['name']}, Position: ${formData['position']}, Email: ${formData['email']}, Phone Number: ${formData['phoneNumber']}, Address: ${formData['address']}, Country: ${formData['country']}, State: ${formData['state']}, Born Date: ${formData['bornDate']}",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.blue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile Edit Screen",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Edit Profile"),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "Name"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Name is required!";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    formData['name'] = newValue;
                  },
                  textInputAction: TextInputAction.next,
                  focusNode: nameFocusNode,
                  onFieldSubmitted: (_) {
                    nameFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(positionFocusNode);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Position"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Position is required!";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    formData['position'] = newValue;
                  },
                  textInputAction: TextInputAction.next,
                  focusNode: positionFocusNode,
                  onFieldSubmitted: (_) {
                    positionFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(emailFocusNode);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Email"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email is required!";
                    }
                    if (!_isValidEmail(value)) {
                      return "Invalid email format!";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    formData['email'] = newValue;
                  },
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  focusNode: emailFocusNode,
                  onFieldSubmitted: (_) {
                    emailFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(phoneNumberFocusNode);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Phone Number"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Phone number is required!";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    formData['phoneNumber'] = newValue;
                  },
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  focusNode: phoneNumberFocusNode,
                  onFieldSubmitted: (_) {
                    phoneNumberFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(addressFocusNode);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Address"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Address is required!";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    formData['address'] = newValue;
                  },
                  textInputAction: TextInputAction.next,
                  focusNode: addressFocusNode,
                  onFieldSubmitted: (_) {
                    addressFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(countryFocusNode);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Country"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Country is required!";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    formData['country'] = newValue;
                  },
                  textInputAction: TextInputAction.next,
                  focusNode: countryFocusNode,
                  onFieldSubmitted: (_) {
                    countryFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(stateFocusNode);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "State"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "State is required!";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    formData['state'] = newValue;
                  },
                  textInputAction: TextInputAction.done,
                  focusNode: stateFocusNode,
                  onFieldSubmitted: (_) {
                    stateFocusNode.unfocus();
                    onSubmit();
                  },
                ),
                ListTile(
                  title: Text(
                    'Born Date',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  trailing: Icon(Icons.calendar_today),
                  onTap: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: formData['bornDate'],
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      formData['bornDate'] = pickedDate;
                    }
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: onSubmit,
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isValidEmail(String email) {
    String pattern =
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'; // Regular expression for email validation
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }
}
