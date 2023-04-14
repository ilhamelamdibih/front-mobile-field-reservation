//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon( Icons.ac_unit/*LineAwesomeIcons.angle_left*/)),
        title: Text('tEditProfile', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20/*tDefaultSize*/),
          child: Column(
            children: [
              // -- IMAGE with ICON
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(image: AssetImage('assets/images/login2.png'))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.blueGrey/*tPrimaryColor*/),
                      child: const Icon(Icons.access_alarm,//LineAwesomeIcons.camera,
                          color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // -- Form Fields
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text('tFullName'),
                          prefixIcon: Icon(Icons.abc//LineAwesomeIcons.user
                          )),
                    ),
                    const SizedBox(height: /*tFormHeight*/ 100 - 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text('tEmail'),
                          prefixIcon: Icon(Icons.abc//LineAwesomeIcons.envelope_1
                          )),
                    ),
                    const SizedBox(height: /*tFormHeight*/ 100 - 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text('tPhoneNo'),
                          prefixIcon: Icon(Icons.abc//LineAwesomeIcons.phone
                          )),
                    ),
                    const SizedBox(height: /*tFormHeight*/ 100 - 20),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        label: const Text('tPassword'),
                        prefixIcon: const Icon(Icons.fingerprint),
                        suffixIcon: IconButton(
                            icon: const Icon(Icons.abc//LineAwesomeIcons.eye_slash
                            ),
                            onPressed: () {}),
                      ),
                    ),
                    const SizedBox(height: 50/*tFormHeight*/),

                    // -- Form Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () =>
                            Get.to(() => const UpdateProfileScreen()),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, //tPrimaryColor,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text('tEditProfile',
                            style: TextStyle(color:Colors.red /*tDarkColor*/)),
                      ),
                    ),
                    const SizedBox(height: 50/*tFormHeight*/),

                    // -- Created Date and Delete Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text.rich(
                          TextSpan(
                            text:'tJoined',
                            style: TextStyle(fontSize: 12),
                            children: [
                              TextSpan(
                                  text: 'tJoinedAt',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12))
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.redAccent.withOpacity(0.1),
                              elevation: 0,
                              foregroundColor: Colors.red,
                              shape: const StadiumBorder(),
                              side: BorderSide.none),
                          child: const Text('tDelete'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
