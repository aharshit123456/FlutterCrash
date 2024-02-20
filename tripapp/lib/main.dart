import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: HomePage(),
  )
);


class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  late PageController _pageController;
  int totalPage = 4;

  void _onScroll(){
    print('sss');
  }


  @override
  void initState() {
      _pageController = PageController(
        initialPage: 1,
      )..addListener(_onScroll);
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          makePage('assets/images/one.jpg', 'Nanami', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam pulvinar neque quam, sollicitudin bibendum nunc ornare at. Maecenas venenatis sapien id fermentum tincidunt. Nam vitae facilisis orci. Donec laoreet tristique dolor, a lacinia urna congue ut. Aenean a scelerisque risus. Vestibulum rutrum felis arcu, mattis pretium augue malesuada bibendum. Mauris varius tincidunt elementum.', 1),
          makePage('assets/images/two.jpg', 'Bear Grylls', '', 2),
          makePage('assets/images/three.jpg','A weird monkey', '', 3),

        ],
      ),
    );
  }

  Widget makePage(image, title, description, page){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(image)
        )
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.2),
            ]
          )
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(page.toString(), style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                Text('/'+ totalPage.toString(), style: TextStyle(color: Colors.white, fontSize: 15,))
              ],
            ),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 3),
                        child: Icon(Icons.star, color: Colors.yellow,size: 15,),
                      ),Container(
                        margin: EdgeInsets.only(right: 3),
                        child: Icon(Icons.star, color: Colors.yellow,size: 15,),
                      ),Container(
                        margin: EdgeInsets.only(right: 3),
                        child: Icon(Icons.star, color: Colors.yellow,size: 15,),
                      ),Container(
                        margin: EdgeInsets.only(right: 3),
                        child: Icon(Icons.star, color: Colors.yellow,size: 15,),
                      ),Container(
                        margin: EdgeInsets.only(right: 3),
                        child: Icon(Icons.star, color: Colors.grey,size: 15,),
                      ),
                      Padding(padding: EdgeInsets.only(left: 5)),
                      Text('4.0', style: TextStyle(color: Colors.white70),),
                      Padding(padding: EdgeInsets.only(left: 5)),
                      Text('(2300)', style: TextStyle(color: Colors.white70, fontSize: 12),),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  Padding(padding: const EdgeInsets.only(right: 25),
                    child: Text(description, style: TextStyle(color: Colors.white60, fontSize: 20, fontWeight: FontWeight.normal),)
              ),
                  SizedBox(height: 20,),
                  Text('Read More', style: TextStyle(color: Colors.white70),)
            ],
              ))
          ]),
        ),
      ),
    );
  }
}