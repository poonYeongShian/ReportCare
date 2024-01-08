import 'package:flutter/material.dart';

class MenuIdeaWidget extends StatefulWidget {
  const MenuIdeaWidget({super.key});

  @override
  State<MenuIdeaWidget> createState() => _MenuIdeaWidgetState();
}

class _MenuIdeaWidgetState extends State<MenuIdeaWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Text(
                "Today's Menu Idea",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
                elevation: 10,
                clipBehavior: Clip.antiAlias,
                child: Column(children: [
                  Image.asset('assets/recipes/guacamole_image.jpg'),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.restaurant),
                        title: Text('Guacamole'),
                        trailing: Text('Recipe >')
                      ),
                    ),
                  )
                ])),
          ),
        ],
      ),
    );
  }
}
