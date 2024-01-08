import 'package:flutter/material.dart';
import 'package:patient_app_fit4002/common/values/values.dart';

class ProhibitedFoodPage extends StatefulWidget {
  const ProhibitedFoodPage({Key? key}) : super(key: key);

  @override
  State<ProhibitedFoodPage> createState() => _ProhibitedFoodPageState();
}

class _ProhibitedFoodPageState extends State<ProhibitedFoodPage> {
  // Implements a button so that the user can open the Eat Smart with food nutrition labels guide
  Widget _learnMore() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      width: 370,
      height: 60,
      child: Row(
        children: [
          const SizedBox(width: 20),
          const Icon(
            Icons.info,
            size: 40,
            color: Colors.black,
          ),
          const SizedBox(width: 20),
          Flexible(
            child: Text(
              "Find out here on how to read food labels",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 12.0,
                height: 1.2,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 20),
          IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/label_guide');
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: MediaQuery.of(context).orientation == Orientation.portrait
            ? const Size.fromHeight(42)
            : const Size.fromHeight(96),
        child: AppBar(
          title: const Text(
            'Prohibited Food',
            style: TextStyle(
              color: AppColors.primaryElementText,
              fontFamily: "Righteous",
              fontWeight: FontWeight.normal,
              fontSize: 24,
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(width: double.infinity, height: 30),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                width: 370,
                height: 410,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Six Steps to Avoid Unhealthy Food',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          height: 1.0,
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Choose',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Biryani",
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        height: 1.0,
                        color: const Color(0xff0d8ca8),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'processed foods carefully',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        height: 1.1725,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Avoid',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Biryani",
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        height: 1.0,
                        color: const Color(0xff0d8ca8),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'items that have sugar added, excess sodium and fat',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        height: 1.1725,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Read',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Biryani",
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        height: 1.0,
                        color: const Color(0xff0d8ca8),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'the provided food labels',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        height: 1.1725,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Plan Ahead',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Biryani",
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        height: 1.0,
                        color: const Color(0xff0d8ca8),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'and prepare healthy meals and snacks at home',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        height: 1.1725,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Choose',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Biryani",
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        height: 1.0,
                        color: const Color(0xff0d8ca8),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'lean meats with less than 10 percent of fat',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        height: 1.1725,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Do Not Skip Meals',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Biryani",
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        height: 1.0,
                        color: const Color(0xff0d8ca8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: _learnMore(),
            ),
            SizedBox(height: 15),
            Text(
              'Food and Beverages to Avoid',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Biryani",
                fontSize: 26,
                fontWeight: FontWeight.w900,
                height: 1.0,
                color: const Color(0xff0d8ca8),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 160,
                  height: 134,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/meat.png',
                          width: 60,
                          height: 60,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Processed and\nRed Meats',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Biryani",
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          height: 1.0,
                          color: const Color(0xff0d8ca8),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 160,
                  height: 134,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/processed-food.png',
                          width: 60,
                          height: 60,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Fried and Fast\nFood',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Biryani",
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          height: 1.0,
                          color: const Color(0xff0d8ca8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 160,
                  height: 134,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/salt.png',
                          width: 60,
                          height: 60,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'High Sodium\nContent',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Biryani",
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          height: 1.0,
                          color: const Color(0xff0d8ca8),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 160,
                  height: 134,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/wine.png',
                          width: 60,
                          height: 60,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Alcohol and\nEnergy Drinks',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Biryani",
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          height: 1.0,
                          color: const Color(0xff0d8ca8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
