import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/meal.dart';

class ListMealItem extends StatelessWidget {
  final Meal meal;

  const ListMealItem(
    this.meal, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    color: Colors.black54,
                    child: Text(
                      meal.title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 5,),
                      Text('${meal.duration} min')
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(width: 5,),
                      Text(toBeginningOfSentenceCase(meal.complexity.name)!),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 5,),
                      Text(toBeginningOfSentenceCase(meal.affordability.name)!),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void selectMeal() {}
}
