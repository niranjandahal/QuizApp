import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

class DataAddScreen extends StatefulWidget {
  const DataAddScreen({Key? key}) : super(key: key);

  @override
  State<DataAddScreen> createState() => _DataAddScreenState();
}

class _DataAddScreenState extends State<DataAddScreen> {
  /////////////////////////////////// Astronomy section /////////////////////////////////////////////////////
  ///
  ///
  List<String> questions = [
    "What is the name of the largest moon of Saturn?",
    "Who is considered the father of modern observational astronomy?",
    "What is the name of the famous telescope launched by NASA in 1990?",
    "In astronomy, what is a 'stellar nursery'?",
    "Which spacecraft was the first to land on Mars?",
    "What is the name of the star system closest to our Solar System?",
    "What is the phenomenon where light is bent as it passes through a gravitational field?",
    "Which planet has the Great Red Spot, a massive storm system?",
    "What is the study of celestial bodies and their movements called?",
    "In the Hindu religion, what is the name of the chariot of the Sun god Surya?"
  ];

  List<List<String>> optionList = [
    ["Titan", "Europa", "Ganymede", "Callisto"],
    [
      "Galileo Galilei",
      "Nicolas Copernicus",
      "Johannes Kepler",
      "Isaac Newton"
    ],
    [
      "Hubble Space Telescope",
      "Kepler Space Telescope",
      "Chandra X-ray Observatory",
      "Spitzer Space Telescope"
    ],
    [
      "A region where new stars are formed",
      "A region where black holes are found",
      "A region with no stars",
      "A region with a dense asteroid belt"
    ],
    ["Viking 1", "Opportunity", "Curiosity", "Mars Express"],
    ["Alpha Centauri", "Proxima Centauri", "Sirius", "Betelgeuse"],
    [
      "Gravitational lensing",
      "Atmospheric refraction",
      "Light diffraction",
      "Aurora Borealis"
    ],
    ["Jupiter", "Saturn", "Neptune", "Mars"],
    ["Astronomy", "Cosmology", "Astrology", "Astrometry"],
    ["Arka", "Aruna", "Surya Ratha", "Ravichakra"]
  ];

  List<int> correctAnswers = [0, 0, 0, 0, 2, 1, 0, 0, 0, 2];

  ////////////////////////////////////// //Scienece section /////////////////////////////////////////////////////
  ///
  ///
  // List<String> questions = [
  //   "What is the chemical symbol for gold?",
  //   "Which gas do plants absorb from the atmosphere and use in photosynthesis?",
  //   "What is the smallest unit of matter?",
  //   "What causes the Earth's seasons?",
  //   "Who is known for the theory of relativity?",
  //   "What is the process by which plants make their food using sunlight?",
  //   "What is the study of the Earth's physical structure and substance called?",
  //   "What is the speed of light in a vacuum?",
  //   "What is the chemical formula for water?",
  //   "What is the force that pulls objects toward the center of the Earth?"
  // ];

  // List<List<String>> optionList = [
  //   ["Au", "Ag", "Fe", "Hg"],
  //   ["Oxygen", "Carbon Dioxide", "Nitrogen", "Hydrogen"],
  //   ["Atom", "Molecule", "Proton", "Cell"],
  //   [
  //     "Tilt of the Earth's axis",
  //     "Distance from the Sun",
  //     "Rotation of the Moon",
  //     "Atmospheric pressure"
  //   ],
  //   ["Albert Einstein", "Isaac Newton", "Galileo Galilei", "Marie Curie"],
  //   ["Photosynthesis", "Respiration", "Fermentation", "Transpiration"],
  //   ["Geology", "Biology", "Chemistry", "Physics"],
  //   [
  //     "299,792,458 meters per second",
  //     "186,282 miles per second",
  //     "300,000 kilometers per hour",
  //     "3 x 10^8 miles per second"
  //   ],
  //   ["H2O2", "CO2", "H2O", "CH4"],
  //   ["Gravity", "Magnetism", "Electricity", "Friction"]
  // ];

  // List<int> correctAnswers = [0, 1, 0, 0, 0, 0, 0, 0, 2, 0];

  //////////////////////////////////// //history section /////////////////////////////////////////////////////
  ///
  // ///
  // List<String> questions = [
  //   "Who was the first President of the United States?",
  //   "Which ancient civilization is known for building the Great Wall?",
  //   "What event marked the start of World War I?",
  //   "Who is the famous civil rights leader known for his 'I Have a Dream' speech?",
  //   "Which European explorer is credited with discovering the sea route to India?",
  //   "In which year did the Titanic sink?",
  //   "What ancient wonder was a massive tomb for an Egyptian pharaoh?",
  //   "What was the name of the ship that carried the Pilgrims to America in 1620?",
  //   "Who was the first female Prime Minister of India?",
  //   "What was the name of the political and military conflict between the United States and the Soviet Union during the 20th century?"
  // ];

  // List<List<String>> optionList = [
  //   ["George Washington", "Thomas Jefferson", "John Adams", "Abraham Lincoln"],
  //   ["Roman Empire", "Inca Empire", "Ming Dynasty", "Ancient China"],
  //   [
  //     "Assassination of Archduke Franz Ferdinand",
  //     "Bombing of Hiroshima",
  //     "Treaty of Versailles",
  //     "Russian Revolution"
  //   ],
  //   ["Martin Luther King Jr.", "Malcolm X", "Nelson Mandela", "Mahatma Gandhi"],
  //   [
  //     "Christopher Columbus",
  //     "Ferdinand Magellan",
  //     "Vasco da Gama",
  //     "Marco Polo"
  //   ],
  //   ["1912", "1915", "1917", "1920"],
  //   ["Pyramid of Giza", "Colosseum", "Hanging Gardens of Babylon", "Sphinx"],
  //   ["Mayflower", "Santa Maria", "Nina", "Speedwell"],
  //   [
  //     "Margaret Thatcher",
  //     "Benazir Bhutto",
  //     "Golda Meir",
  //     "Sirimavo Bandaranaike"
  //   ],
  //   ["Cold War", "Vietnam War", "Korean War", "World War II"]
  // ];

  // List<int> correctAnswers = [0, 3, 0, 0, 2, 0, 0, 0, 0, 0];

  ////////////////////////////////////////////////////////////////////////////////////////////

  // List<String> questions = [
  //   "What is the capital of France?",
  //   "Which planet is known as the Red Planet?",
  //   "Who wrote the play 'Romeo and Juliet'?",
  //   "What is the largest mammal in the world?",
  //   "What is the chemical symbol for water?",
  // ];

  // List<List<String>> optionList = [
  //   ["Paris", "Berlin", "London", "Madrid"],
  //   ["Mars", "Venus", "Jupiter", "Earth"],
  //   ["William Shakespeare", "Charles Dickens", "Leo Tolstoy", "Jane Austen"],
  //   ["Blue Whale", "African Elephant", "Giraffe", "Lion"],
  //   ["H2O", "CO2", "O2", "NaCl"],
  // ];

  // List<int> correctAnswers = [1, 2, 3, 0, 3];

  // Function to add data to Firestore
  void addDataToFirestore() {
    // Initialize Firestore
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    // Define the Firestore path
    String firestorePath = '/quiz/category/history';

    // Create a reference to the Firestore collection where you want to add data
    CollectionReference quizCollection = firestore.collection(firestorePath);

    // Loop through your data and add it to Firestore
    for (int i = 0; i < questions.length; i++) {
      Map<String, dynamic> data = {
        'question': questions[i],
        'options': optionList[i],
        'correctAnswer': correctAnswers[i],
      };

      // Add a document to the collection
      quizCollection.add(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Data to Firestore"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add a button to trigger data addition
            ElevatedButton(
              onPressed: () async {
                addDataToFirestore();
              },
              // Call the function to add data to Firestore
              child: Text("Add Data to Firestore"),
            ),
          ],
        ),
      ),
    );
  }
}
