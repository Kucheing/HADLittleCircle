import 'dart:typed_data';
import 'package:complete/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:complete/resources/add_data.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Uint8List? _image;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void saveProfile() async {
    String username = usernameController.text;
    String fullname = fullnameController.text;
    String dob = dobController.text;
    String address = addressController.text;

    if (_image == null) {
      print('No image selected');
      return;
    }

    String resp = await StoreData().saveData(
        username: username,
        fullname: fullname,
        dob: dob,
        address: address,
        file: _image!);
    print('Save Profile Response: $resp');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              'https://png.pngitem.com/pimgs/s/421-4212266_transparent-default-avatar-png-default-avatar-images-png.png'),
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  )
                ],
              ), //Username
              const SizedBox(height: 24),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  hintText: 'Enter Userame',
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(),
                ),
              ), //Username
              //Fullname
              const SizedBox(height: 24),
              TextField(
                controller: fullnameController,
                decoration: const InputDecoration(
                  hintText: 'Enter Fullname',
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(),
                ),
              ), //Fullname
              //dob
              const SizedBox(height: 24),
              TextField(
                controller: dobController,
                decoration: const InputDecoration(
                  hintText: 'Enter Date of Birth',
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(),
                ),
              ), //dob
              //address
              const SizedBox(height: 24),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  hintText: 'Enter your Address (Optional)',
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(),
                ),
              ), //address
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: saveProfile,
                child: const Text('Save Profile'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
