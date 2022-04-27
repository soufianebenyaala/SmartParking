import 'package:flutter/material.dart';
import 'package:flutter_auth/components/button_widget.dart';
import 'package:flutter_auth/components/profile_widget.dart';
import 'package:flutter_auth/components/textfield_widget.dart';
import 'package:flutter_auth/models/user.dart';
import 'package:flutter_auth/utils/user.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.user;
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        ProfileWidget(
          imagePath: user.photo,
          onClicked: () {
            openPhotoDialog(context, user);
          },
        ),
        const SizedBox(height: 24),
        buildName(user),
        const SizedBox(height: 24),
        Center(
            child: ButtonWidget(
          text: 'Edit profile',
          onClicked: () {
            openDialog(context, user);
          },
        )),
        const SizedBox(height: 24),
        //const SizedBox(height: 48),
        Row(
          children: [
            BuildContent(data: user.address, label: "address"),
            BuildContent(data: user.phone, label: "phone"),
          ],
        )
      ],
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );
  Future openPhotoDialog(context, user) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
          scrollable: true,
          title: Text("chose un option"),
          actions: [TextButton(onPressed: () {}, child: Text("submit"))],
          content: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.image,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.image,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    "Camera",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  )
                ],
              ),
            ],
          )));
  Future openDialog(context, user) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          scrollable: true,
          title: Text("Edit Profile"),
          actions: [TextButton(onPressed: () {}, child: Text("Edit"))],
          content: Form(
            child: Column(
              children: [
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Name',
                  text: user.name,
                  onChanged: (name) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Phone',
                  text: user.phone,
                  onChanged: (phone) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Address',
                  text: user.address,
                  onChanged: (address) {},
                ),
              ],
            ),
          ),
        ),
      );
}

class BuildContent extends StatelessWidget {
  final data;
  final label;
  BuildContent({
    Key key,
    this.data,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            data,
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
        ],
      ),
    );
  }
}
