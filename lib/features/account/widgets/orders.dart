import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/features/account/widgets/single_product.dart';
import 'package:flutter/material.dart';

List list = [
  "https://unsplash.com/photos/a-group-of-people-walking-down-a-set-of-stairs-hsegBLx6tcQ",
  "https://unsplash.com/photos/a-group-of-people-walking-down-a-set-of-stairs-hsegBLx6tcQ",
  "https://unsplash.com/photos/a-group-of-people-walking-down-a-set-of-stairs-hsegBLx6tcQ",
  "https://unsplash.com/photos/a-group-of-people-walking-down-a-set-of-stairs-hsegBLx6tcQ",
];

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: const Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: const Text(
                'See All',
                style: TextStyle(
                  color: GlobalVariable.unselectedNavBarColor,
                ),
              ),
            ),
            //order display
          ],
        ),
        Container(
          height: 170,
          padding: const EdgeInsets.only(
            left: 10,
            top: 20,
            right: 0,
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return SingleProduct(
                image: list[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
