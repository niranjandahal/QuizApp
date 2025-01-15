import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r14firebasequizapp/screens/HomePage/HomePage.dart';
import 'package:r14firebasequizapp/provider/UserProvider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //show the user data and update the user data from provider file

      appBar: AppBar(
        title: const Text("User Profile"),
        backgroundColor: Colors.deepPurple,
      ),

      body: Consumer<UserProvider>(
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const CircleAvatar(
                      radius: 80,
                      child: Icon(
                        Icons.person,
                        size: 80,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      value.currenuseremail,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Text(
                      'Phone Number:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Unverified',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/phoneverify', (route) => false);
                        },
                        child: const Text("verify your phone number")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.email),
                          onPressed: () {
                            // Add action for email link
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.phone),
                          onPressed: () {
                            // Add action for phone link
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.web),
                          onPressed: () {
                            // Add action for website link
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        // Add sign-out logic here
                      },
                      child: const Text('Sign Out'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                },
                child: const Text(
                  "Go to Home Page",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  value.getUserData();
                },
                child: const Text(
                  "Update Profile",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
