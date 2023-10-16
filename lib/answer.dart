import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Model/filteredquiz.dart';

class Answer extends StatelessWidget {
  const Answer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quiz = Provider.of<Filteredquiz>(context).quiz;
    final isSelected = Provider.of<Isselected>(context).selected;
    return Scaffold(
      appBar: AppBar(
        title: Text('Answer'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: quiz.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.grey.shade300,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "(" + (index + 1).toString() + ")",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              quiz[index].question,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            quiz[index].optionc.isEmpty
                                ? SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        answer(
                                            answer: quiz[index].answer,
                                            order: 'a',
                                            option: quiz[index].optiona,
                                            selected: isSelected[index]),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        answer(
                                            answer: quiz[index].answer,
                                            order: 'b',
                                            option: quiz[index].optionb,
                                            selected: isSelected[index]),
                                      ],
                                    ),
                                  )
                                : SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        answer(
                                            answer: quiz[index].answer,
                                            order: 'a',
                                            option: quiz[index].optiona,
                                            selected: isSelected[index]),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        answer(
                                            answer: quiz[index].answer,
                                            order: 'b',
                                            option: quiz[index].optionb,
                                            selected: isSelected[index]),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        answer(
                                            answer: quiz[index].answer,
                                            order: 'c',
                                            option: quiz[index].optionc,
                                            selected: isSelected[index]),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        answer(
                                            answer: quiz[index].answer,
                                            order: 'd',
                                            option: quiz[index].optiond,
                                            selected: isSelected[index]),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget answer(
      {required String answer,
      required String order,
      required String option,
      required String selected}) {
    if (selected == "e" && answer == order) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                child: Text(
                  option,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'correct',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      );
    } else if (answer == order && answer == selected) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                child: Text(
                  option,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Correct',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      );
    } else if (answer == order) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                child: Text(
                  option,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.check,
              size: 20,
              color: Colors.blue,
            ),
          ],
        ),
      );
    } else if (selected == order) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                child: Text(
                  option,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Wrong',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      );
    } else {
      return Container(
        child: Text(
          option,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      );
    }
  }
}
