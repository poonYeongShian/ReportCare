import 'package:flutter/material.dart';

class NutritionInfoWidget extends StatefulWidget {
  const NutritionInfoWidget({super.key});

  @override
  State<NutritionInfoWidget> createState() => _NutritionInfoWidgetState();
}

class _NutritionInfoWidgetState extends State<NutritionInfoWidget> {
  void _handleRecommendedFoodsTap() {
    print("Recommended Foods Tapped");
    Navigator.pushNamed(context, '/recommended_food');
  }

  void _handleProhibitedFoodsTap() {
    print("Prohibited Foods Tapped");
    Navigator.pushNamed(context, '/prohibited_food');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          // top: BorderSide(color: Colors.grey, width: 1.0),
          bottom: BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
      child: Column(children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: Text(
              'Your Nutrition Information',
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        //Padding(padding: EdgeInsets.only(bottom: 5.0)),
        Padding(
          padding: const EdgeInsets.only(bottom: 3.0),
          child: Card(
            elevation: 10,
            child: ListTile(
              leading: const Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.green,
              ),
              title: const Text('Recommended Foods'),
              trailing: const Icon(
                Icons.navigate_next_rounded,
              ),
              onTap: _handleRecommendedFoodsTap,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Card(
            elevation: 10,
            child: ListTile(
              leading: const Icon(
                Icons.block_rounded,
                color: Colors.red,
              ),
              title: const Text('Prohibited Foods'),
              trailing: const Icon(
                Icons.navigate_next_rounded,
              ),
              onTap: _handleProhibitedFoodsTap,
            ),
          ),
        ),
      ]),
    );
  }
}
