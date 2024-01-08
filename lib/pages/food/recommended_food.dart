import 'package:flutter/material.dart';
import 'package:patient_app_fit4002/common/utils/utils.dart';
import 'package:patient_app_fit4002/common/values/values.dart';

class RecommendedFoodPage extends StatefulWidget {
  const RecommendedFoodPage ({super.key});

  @override
  State<RecommendedFoodPage> createState() => _RecommendedFoodPageState();
}

class _RecommendedFoodPageState extends State<RecommendedFoodPage>{

  //Displays the food diagram for the dietary information.
  Widget _foodImage() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(20), bottom: duSetHeight(20)),
      child: Container(
        width: 250,
        height: 250,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/food.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }

  //Tells the user the recommended servings for different food.
  Widget _dietInformation(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
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
      child: Column(
        children: [
          _foodImage(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: RichText(
                text: const TextSpan(
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 18.0,
                        height: 1.2,
                        color: Colors.black
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: '1/2 plate: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryText)
                      ),
                      TextSpan(text: 'fruits and vegetables\n'),
                      TextSpan(
                          text: '1/4 plate: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryText)
                      ),
                      TextSpan(text: 'whole grains (brown rice, bread, wholemeal and rolled oats)\n'),
                      TextSpan(
                          text: '1/4 plate: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryText)
                      ),
                      TextSpan(text: 'protein (chicken, meat, fish, eggs, legumes, nuts, and low-fat milk products)\n'),
                    ]
                )
            ),
          )
        ],
      ),
    );
  }

  //Implements a button so that the user can open the American Heart Association guide to cook healthfully.
  Widget _learnMore(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
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
      height: 100,
      child: Row(
        children: [
          const SizedBox(width: 20),
          const Icon(
            Icons.info,
            size: 40,
            color: AppColors.primaryText,
          ),
          const SizedBox(width: 60),
          const Text("Learn more about \nfood preparation",
            style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 18.0,
                height: 1.2,
                color: Colors.black
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(width: 55),
          IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/guide');
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
          preferredSize:
          MediaQuery.of(context).orientation == Orientation.portrait
          ? Size.fromHeight(duSetHeight(42))
          : Size.fromHeight(duSetHeight(96)),
          child: AppBar(
              title: const Text(
                  'Recommended Food',
                  style: TextStyle(
                      color: AppColors.primaryElementText,
                      fontFamily: "Righteous",
                      fontWeight: FontWeight.normal,
                      fontSize: 24
                  )
              ),
              centerTitle: true
          ),
        ),
        body: SingleChildScrollView(
            padding:
            const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Column(
              children: [
                const SizedBox(width: double.infinity),
                const SizedBox(height: 10),
                _dietInformation(),
                const SizedBox(height: 20),
                _learnMore()
              ],
            )
        )
    );
  }

}