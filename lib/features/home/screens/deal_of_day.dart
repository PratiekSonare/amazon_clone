import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(
            top: 15,
          ),
          child: const Text(
            'Deal of the Day!',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Image.network(
          "https://unsplash.com/photos/a-group-of-people-walking-down-a-set-of-stairs-hsegBLx6tcQ",
          height: 235,
          fit: BoxFit.fitHeight,
        ),
        //product price
        Container(
          padding: const EdgeInsets.only(left: 15),
          child: const Text(
            '\$999',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),

        //product name
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(
            left: 50,
            top: 5,
            right: 40,
          ),
          child: const Text(
            'Pratiek',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        //extra product images
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                "https://unsplash.com/photos/a-group-of-people-walking-down-a-set-of-stairs-hsegBLx6tcQ",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://unsplash.com/photos/a-group-of-people-walking-down-a-set-of-stairs-hsegBLx6tcQ",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://unsplash.com/photos/a-group-of-people-walking-down-a-set-of-stairs-hsegBLx6tcQ",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://unsplash.com/photos/a-group-of-people-walking-down-a-set-of-stairs-hsegBLx6tcQ",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),

        //rest of the dod
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: Text(
            'See all deals',
            style: TextStyle(
              color: Colors.cyan[800],
            ),
          ),
        ),
      ],
    );
  }
}
