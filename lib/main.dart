import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}): super(key:key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget{
  const HomeScreen({Key?key}):super(key: key);
  @override
  _HomeScreenState createState()=> _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
  final List<Widget> _screens =[
    Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.pink.shade100,
            Colors.deepPurple.shade100,
          ]
        )
      ),
      //color: Colors.blue.shade100,
      alignment: Alignment.center,
      child: const Text('HOME',
        style: TextStyle(fontSize: 40),
      ),
///////////////////////////////////////
    ),
    Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.lightGreenAccent.shade100,
                Colors.tealAccent.shade100,
              ]
          )
      ),
      alignment: Alignment.center,
      child: const Text('Feed',style: TextStyle(fontSize: 40),
      ),
    ),
    Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.orange.shade100,
                Colors.blue.shade100,
              ]
          )
      ),
//////////////////////////////////
        alignment: Alignment.center,
        child: const Text('Settings',style: TextStyle(fontSize: 40),
        ),
    ),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent.shade100,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              print('Searching searching ........');
            },
          ),
          PopupMenuButton(itemBuilder: (context){
            /////////
            return[
              PopupMenuItem<int>(
                value: 0,
                child:ListTile(
                  leading: Icon(Icons.access_time_rounded),
                  title:
                  Text("Complain history"),
                ),
              ),
              PopupMenuItem<int>(
                value: 1,
                child:ListTile(
                  leading: Icon(Icons.settings),
                  title:
                  Text("Account settings"),),
              ),
              PopupMenuItem<int>(
                value: 2,
                child:ListTile(
                  leading: Icon(Icons.logout),
                  title:
                  Text("Logout"),),
              ),
            ];
          },

          ),
        ],

        leading: CircleAvatar(backgroundImage: NetworkImage("https://thumbs.dreamstime.com/b/businessman-icon-vector-male-avatar-profile-image-profile-businessman-icon-vector-male-avatar-profile-image-182095609.jpg"),backgroundColor: Colors.black,),
        title: const Text("PROFILE"),
      ),
      bottomNavigationBar: MediaQuery.of(context).size.width<640?
      BottomNavigationBar(
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.amber.shade100,
        onTap: (int index){
          setState(() {
            _selectedIndex= index;
          });
    },
    items:const [
      BottomNavigationBarItem(icon: Icon(Icons.home),
    label: 'Home'
    ),
    BottomNavigationBarItem(icon: Icon(Icons.feed),label: 'Feed'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favourite'),
    BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),

    ]):null,
    body: Row(
    children: [
      if(MediaQuery.of(context).size.width>=640)
        NavigationRail(onDestinationSelected: (int index){
    setState(() {
    _selectedIndex=index;});
    },
            selectedIndex: _selectedIndex,destinations:const[
              NavigationRailDestination(icon: Icon(Icons.home), label:Text('HOME')),
            NavigationRailDestination(icon: Icon(Icons.feed), label:Text('Feed')),
            NavigationRailDestination(icon: Icon(Icons.favorite), label:Text('Favorite')),
            NavigationRailDestination(icon: Icon(Icons.settings), label:Text('Settings')),

            ],
    labelType: NavigationRailLabelType.all,
    selectedLabelTextStyle: const TextStyle(
    color: Colors.teal,
    ),
    unselectedLabelTextStyle: const TextStyle(),
    leading: Column(
    children: const[
      SizedBox(
    height: 8,
    ),

    ],
    ),
          ),
    Expanded(child: _screens[_selectedIndex])
    ],
    ),

      );


  }
}