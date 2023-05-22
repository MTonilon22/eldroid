import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> itemList = List.generate(20, (index) => 'Question ${index + 1}');
  List<List<String>> choicesList = [
    ['A. ', 'B. Jeremy', 'C. ampotin'],
    ['A. sir grew', 'gabuya ', ' krisha'],
    ['andrian ', 'paul', 'sedigo'],
    ['Choice 1A', 'Choice 1B', 'Choice 1C'],
    ['Choice 2A', 'Choice 2B', 'Choice 2C'],
    ['Choice 3A', 'Choice 3B', 'Choice 3C'],
    ['Choice 1A', 'Choice 1B', 'Choice 1C'],
    ['Choice 2A', 'Choice 2B', 'Choice 2C'],
    ['Choice 3A', 'Choice 3B', 'Choice 3C'],
    ['Choice 1A', 'Choice 1B', 'Choice 1C'],
    ['Choice 2A', 'Choice 2B', 'Choice 2C'],
    ['Choice 3A', 'Choice 3B', 'Choice 3C'],
    ['Choice 1A', 'Choice 1B', 'Choice 1C'],
    ['Choice 2A', 'Choice 2B', 'Choice 2C'],
    ['Choice 3A', 'Choice 3B', 'Choice 3C'],
    ['Choice 1A', 'Choice 1B', 'Choice 1C'],
    ['Choice 2A', 'Choice 2B', 'Choice 2C'],
    ['Choice 3A', 'Choice 3B', 'Choice 3C'],
    ['Choice 1A', 'Choice 1B', 'Choice 1C'],
    ['Choice 2A', 'Choice 2B', 'Choice 2C'],
  ];

  List<String> textQuestions = [
    'Who is your favorite artist?',
    'What is your favorite color?',
    'What is your dream vacation destination?',
    'Who is your favorite artist?',
    'What is your favorite color?',
    'What is your dream vacation destination?',
    'Who is your favorite artist?',
    'What is your favorite color?',
    'What is your dream vacation destination?',
    'Who is your favorite artist?',
    'What is your favorite color?',
    'What is your dream vacation destination?',
    'Who is your favorite artist?',
    'What is your favorite color?',
    'What is your dream vacation destination?',
    'Who is your favorite artist?',
    'What is your favorite color?',
    'What is your dream vacation destination?',
    'Who is your favorite artist?',
    'What is your favorite color?',

    // Add more text questions here
  ];

  List<int> selectedAnswerIndices = List.generate(20, (index) => -1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QuizChamp'),
      ),
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (BuildContext context, int index) {
          final String item = itemList[index];
          final List<String> choices = choicesList[index];
          final int selectedAnswerIndex = selectedAnswerIndices[index];

          return ListTile(
            title: Row(
              children: [
                Expanded(
                  child: Text(item),
                ),
                Text(
                  selectedAnswerIndex != -1
                      ? 'Answer: ${choices[selectedAnswerIndex]}'
                      : '',
                  style: TextStyle(
                    fontStyle: selectedAnswerIndex != -1
                        ? FontStyle.italic
                        : FontStyle.normal,
                  ),
                ),
              ],
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(item),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(textQuestions[index]), // Display the text question
                        const SizedBox(height: 10),
                        ...List.generate(choices.length, (choiceIndex) {
                          return RadioListTile(
                            title: Text(choices[choiceIndex]),
                            value: choiceIndex,
                            groupValue: selectedAnswerIndex,
                            onChanged: (int? value) {
                              setState(() {
                                selectedAnswerIndices[index] = value!;
                              });
                            },
                          );
                        }),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle answer submission here
                          print('Question: $item');
                          print(
                              'Selected answer index: ${selectedAnswerIndices[index]}');
                          Navigator.of(context).pop();
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
