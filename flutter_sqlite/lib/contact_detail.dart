// ignore_for_file: prefer_const_constructors, prefer_final_fields, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_sqlite/contact.dart';
import 'package:flutter_sqlite/contactdataaccess.dart';
import 'package:get/get.dart';

class ContactDetail extends StatelessWidget {
  int id;
  ContactDetail({super.key, required this.id});
  var dataAccess = ContactDataAccess();
  var _contact = Contact(id: 0, name: "", email: "", phone: "").obs;
  Contact get contact => _contact.value;
  var nameCtl = TextEditingController();
  var phoneCtl = TextEditingController();
  var emailCtl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  onSave() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var result = id == 0
          ? await dataAccess.insert(contact)
          : await dataAccess.update(contact);
      Get.back();
    }
  }

  onDelete() async {
    if (id > 0) {
      var result = await dataAccess.delete(id);
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (id > 0) {
      dataAccess.getByUd(id).then((value) {
        _contact(value);
        nameCtl.text = contact.name;
        phoneCtl.text = contact.phone;
        emailCtl.text = contact.email;
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Detail"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Obx(
          () => Form(
            key: formKey,
            child: ListView(
              children: [
                Text("ID: ${_contact.value.id}"),
                TextFormField(
                  controller: nameCtl,
                  decoration: InputDecoration(labelText: "Name"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nama tidak boleh kosong";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    contact.name = newValue!;
                  },
                ),
                TextFormField(
                  controller: phoneCtl,
                  decoration: InputDecoration(labelText: "Phone"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Telepon tidak boleh kosong";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    contact.phone = newValue!;
                  },
                ),
                TextFormField(
                  controller: emailCtl,
                  decoration: InputDecoration(labelText: "Email"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email tidak boleh kosong";
                    }
                    if (!value!.isEmail) {
                      return "Email tidak valid";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    contact.email = newValue!;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                      onPressed: onSave,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                      onPressed: onDelete,
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: Text(
                        "Delete",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
