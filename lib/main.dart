import 'package:first_web_impression/data/business.dart';
import 'package:first_web_impression/data/entertainment.dart';
import 'package:first_web_impression/data/health.dart';
import 'package:first_web_impression/data/science.dart';
import 'package:first_web_impression/data/sports.dart';
import 'package:first_web_impression/data/technology.dart';
import 'package:flutter_web/material.dart';

void main()=>runApp(MaterialApp(home: MyApp(),debugShowCheckedModeBanner: false,));

// class MyApp extends StatelessWidget{

//   List<String> imageList = [
//     "https://www.niemanlab.org/images/nytimes-print-newspaper-cc-990x500.jpg",
//     "https://fair.org/wp-content/uploads/2013/01/nyt-inauguration.jpg"
//   ];

//   @override
//   Widget build(BuildContext context){
//     return CustomScrollView(
//       slivers: <Widget>[
//         SliverAppBar(
//           backgroundColor: Colors.transparent,
//           floating: false,
//           pinned: true,
//           expandedHeight: MediaQuery.of(context).size.height,
//           flexibleSpace: FlexibleSpaceBar(
//             background: ImageLoader(),
//           ),
//         )
//       ],
//     );
//   }
// }

// class ImageLoader extends StatelessWidget{
//   List<String> imageList = [
//     "https://www.niemanlab.org/images/nytimes-print-newspaper-cc-990x500.jpg",
//     "https://fair.org/wp-content/uploads/2013/01/nyt-inauguration.jpg"
//   ];
//   @override
//   Widget build(BuildContext context){
//     return Container(
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: imageList.length,
//         itemBuilder: (_,i){
//           return Padding(
//             padding: EdgeInsets.all(0.0),
//             child: Image.network(imageList[i],fit: BoxFit.cover,),
//           );
//         },
//       ),
//     ); 
//   }
// }

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this,length: 6);
  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title:Text("Headlines India",
        style: TextStyle(fontSize: 60.0),),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          tabs: <Widget>[
            Tab(child: Text("Business",style: TextStyle(fontSize: 30.0),),),
            Tab(child: Text("Sports",style: TextStyle(fontSize: 30.0)),),
            Tab(child: Text("Science",style: TextStyle(fontSize: 30.0)),),
            Tab(child: Text("Technology",style: TextStyle(fontSize: 30.0)),),
            Tab(child: Text("Health",style: TextStyle(fontSize: 30.0)),),
            Tab(child: Text("Entertainment",style: TextStyle(fontSize: 30.0)),),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          BusinessNews(),
          SportsNews(),
          ScienceNews(),
          TechnologyNews(),
          HealthNews(),
          FashionNews(),
        ],
      ),
    );
  }
}