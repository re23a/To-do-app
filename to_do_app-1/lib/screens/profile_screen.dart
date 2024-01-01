import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Color.fromARGB(68, 255, 193, 7),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: badges.Badge(
                    badgeContent: Icon(Icons.camera_alt),
                    badgeStyle: badges.BadgeStyle(badgeColor: Colors.amber),
                    position: badges.BadgePosition.topEnd(top: -10, end: 5),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                          "assets/c36a17fc5e252053dc332fe14cc8ec33.jpg",
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Container(
                        height: 350,
                        width: 380,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.75),
                              spreadRadius: 3,
                              blurRadius: 0,
                              offset:
                                  Offset(2, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: const Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.edit_note_rounded,
                                color: Colors.amber,
                              ),
                              title: Text(
                                'Edit Profile Name',
                              ),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(
                                Icons.lock_person_outlined,
                                color: Colors.amber,
                              ),
                              title: Text(
                                'Change Password',
                              ),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(
                                Icons.language,
                                color: Colors.amber,
                              ),
                              title: Text(
                                'Language',
                              ),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                            Divider(),
                            ListTile(
                              leading:
                                  Icon(Icons.exit_to_app, color: Colors.red),
                              title: Text(
                                'LogOut',
                              ),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
