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
    ['Choice 1A', 'Choice 1B', 'Choice 1C', 'Choice 1D'],
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
  ];

  List<int> selectedAnswerIndices = List.generate(20, (index) => -1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome To QuizChamp!',
            style: TextStyle(
                fontFamily: 'Poppins', fontSize: 18, color: Colors.black)),
        backgroundColor: Color(0XFF53d2dc),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          color: Color(0xFF26648e),
          child: ListView.separated(
            itemCount: itemList.length + 1,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Color(0xFF53d2dc),
                height: 20,
                thickness: 4,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              if (index == itemList.length) {
                return Center(
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              'Review Answers',
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 16),
                            ),
                            content: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    List.generate(itemList.length, (index) {
                                  final String question = itemList[index];
                                  final List<String> choices =
                                      choicesList[index];
                                  final int selectedAnswerIndex =
                                      selectedAnswerIndices[index];
                                  return ListTile(
                                    title: Text(question),
                                    subtitle: selectedAnswerIndex != -1
                                        ? Text(
                                            'Answer: ${choices[selectedAnswerIndex]}')
                                        : const Text('Not answered'),
                                  );
                                }),
                              ),
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Close'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text('Submit Answers'),
                                            content: const Text(
                                                'Are you sure you want to submit your answers?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Cancel'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  // Perform submit action here
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Proceed'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: const Text('Submit'),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('Submit Answers'),
                  ),
                );
              } else {
                final String item = itemList[index];
                final List<String> choices = choicesList[index];
                final int selectedAnswerIndex = selectedAnswerIndices[index];

                return ListTile(
                  title: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFffe3b3),
                      borderRadius: BorderRadius.circular(
                          5), // Adjust the radius as needed
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            item,
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Poppins'),
                          ),
                        ),
                        Text(
                          selectedAnswerIndex != -1
                              ? 'Answer: ${choices[selectedAnswerIndex]}'
                              : '',
                          style: TextStyle(
                            fontStyle: selectedAnswerIndex != -1
                                ? FontStyle.italic
                                : FontStyle.normal,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        int? selectedChoiceIndex = selectedAnswerIndices[index];
                        return StatefulBuilder(
                          builder: (BuildContext context, setState) {
                            return AlertDialog(
                              title: Text(item),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(textQuestions[index]),
                                  const SizedBox(height: 10),
                                  ...List.generate(choices.length,
                                      (choiceIndex) {
                                    return RadioListTile(
                                      title: Text(choices[choiceIndex]),
                                      value: choiceIndex,
                                      groupValue: selectedChoiceIndex,
                                      onChanged: (int? value) {
                                        setState(() {
                                          selectedChoiceIndex = value;
                                        });
                                      },
                                    );
                                  }),
                                ],
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (selectedChoiceIndex != null) {
                                      setState(() {
                                        selectedAnswerIndices[index] =
                                            selectedChoiceIndex!;
                                      });
                                    }
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
                    ).then((_) {
                      setState(() {}); // Update the UI after closing the dialog
                    });
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
