import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:r14firebasequizapp/provider/signoutprovider.dart';
import 'package:provider/provider.dart';
import 'package:r14firebasequizapp/provider/quizscreenprovier.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<QuizScreenProvider>(context, listen: false).fetchcategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Provider.of<SignoutProvider>(context, listen: false)
                    .signOut(context);
              },
              child: const Text(
                "logout",
                style: TextStyle(color: Colors.white),
              )),
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/profile', (route) => false);
            },
            icon: const Icon(Icons.person),
          ),
        ],
        automaticallyImplyLeading: false,
        title:
            const Text('Quiz Category', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: WillPopScope(
        onWillPop: () async {
          return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Are you sure?"),
              content: const Text("Do you want to exit the app?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No"),
                ),
                TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: const Text("Yes"),
                ),
              ],
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 24),
              Expanded(
                child: Consumer<QuizScreenProvider>(
                  builder: (context, value, child) => GridView.builder(
                    itemCount: value.categorylist.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      print("categotyakjshfjhasjkfhjhsdakjfhjhsdfh");
                      print(value.categoryimages[index]); // Image URL
                      return GestureDetector(
                        onTap: () async {
                          value
                              .updatecurrentcategory(value.categorylist[index]);
                          value.restartquiz();
                          await value
                              .fetchQuestionsForCurrentCategory(context)
                              .then((value) => null);
                          // Navigator.pushNamedAndRemoveUntil(
                          //     context, '/quizscreen', (route) => false);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.deepPurple.withOpacity(0.5),
                                  blurRadius: 6,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                Image.network(
                                  value.categoryimages[index], // Image URL
                                  width: double.infinity, // Full width
                                  height: 200, // Adjust the height as needed
                                  fit: BoxFit
                                      .cover, // Make sure the image covers the container
                                ),
                                Positioned(
                                  bottom: 0, // Position at the bottom
                                  left: 0, // Align to the left
                                  right: 0, // Align to the right
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    color: Colors.black
                                        .withOpacity(0.5), // Dark overlay
                                    child: Text(
                                      value.categorylist[index],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            )

                            // child: Column(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Icon(
                            //       Icons.school,
                            //       size: 64,
                            //       color: Colors.white,
                            //     ),
                            //     SizedBox(height: 16),
                            //     Text(
                            //       value.categorylist[index],
                            //       style: TextStyle(
                            //         color: Colors.white,
                            //         fontSize: 20,
                            //         fontWeight: FontWeight.bold,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
