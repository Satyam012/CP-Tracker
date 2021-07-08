import 'package:flutter/material.dart';
import 'CCDATA.dart';
import 'CFDATA.dart';
import 'LCDATA.dart';
import 'package:pie_chart/pie_chart.dart';
String cc,cf,lc;
class Progress extends StatelessWidget {
    final String codechef,codeforces,leetcode;
    Progress(this.codechef,this.codeforces,this.leetcode);
  @override
  Widget build(BuildContext context) {
    cc=codechef;
    cf=codeforces;
    lc=leetcode;
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(title: Row(
          children:[
            Text('CP',style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),),
            Text('-'),
            Text('Tracker',style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold
            )),
          ]
      ),),
      body: Detail(),
    );
  }
}

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool loading,show=false;
  var data1,data2,data3;

  void getcontest() async {
    CCdata object1 = CCdata(cc);
    await object1.getdata();
    data1 = object1.cc;

    CFdata object2 = CFdata(cf);
    await object2.getdata();
    data2 = object2.cf;

    LCdata object3 = LCdata(lc);
    await object3.getdata();
    data3 = object3.lc;
    show=object3.flag;

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    loading = true;
    super.initState();
    getcontest();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child:  loading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
        child: Container(

          child: Column(
              children:[
                if(show==true)
                Container(
                    color: Colors.black26,
                    child: Text('LeetCode Problem Solved:',style: TextStyle(fontSize: 20)),
                    margin: EdgeInsets.fromLTRB(40, 10, 40, 0),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                ),

                if(show==true)
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 15, 25, 5),
                  child: PieChart(dataMap: {
                     "Easy": double.parse(data3["easy_questions_solved"]),
                     "Medium": double.parse(data3["medium_questions_solved"]),
                     "Hard": double.parse(data3["hard_questions_solved"]),
                  }),
                ),
                if(data3.length>0)LCcard(data3["ranking"],data3["total_problems_solved"],data3["easy_questions_solved"],data3["medium_questions_solved"],data3["hard_questions_solved"],data3["contribution_points"]),
                if(data2.length>0)CFcard(data2["rating"],data2["max_rating"],data2["rank"],data2["max_rank"]),
                if(data1.length>0)CCcard(data1["rating"],data1["star"],data1["highest_rating"],data1["global_rank"],data1["country_rank"]),
                ]
          ),
        ),
      ),
    );
  }
}


Widget CCcard(var rating,var star,var highest_rating,var global_rank, var country_rank){

  return Card(
    margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
    color: Colors.cyan[50],
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(25, 5, 25, 0),
          child: ListTile(
            title: Text('\nCODECHEF',style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontWeight: FontWeight.bold,
            ),),
            subtitle: Text('\nSTAR: $star\n\nCurrent-Rating: $rating\n\nHighest Rating: $highest_rating\n\nCountry Rank: $country_rank\n\nGlobal Rank: $global_rank\n\n',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget CFcard(var rank,var highest_rank,var rating,var highest_rating){

  return Card(
    margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
    color: Colors.cyan[50],
    child: Column(
      // mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(25, 5, 25, 0),
          child: ListTile(
            title: Text('\nCODEFORCES',style: TextStyle(
              color: Colors.red[800],
              fontWeight: FontWeight.bold,
            ),),
            subtitle: Text('\nCurrent-Rating: $rating\n\nHighest Rating: $highest_rating\n\nCurrent Rank: $rank\n\nHighest Rank: $highest_rank\n\n',style: TextStyle(color: Colors.black),),
          ),
        ),
      ],
    ),
  );
}

Widget LCcard(String ranking,String total_problems_solved,String easy_questions_solved,String medium_questions_solved,String hard_questions_solved,String contribution_points){

  return Card(
    margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
    color: Colors.cyan[50],
    child: Column(
      // mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(25, 5, 25, 0),
          child: ListTile(
            title: Text('\nLEETCODE', style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),),
            subtitle: Text('\nCurrent-Rank: $ranking\n\nTotal Problems Solved: $total_problems_solved\n\nEasy Questions Solved: $easy_questions_solved\n\nMedium Questions Solved: $medium_questions_solved\n\nHard Questions Solved: $hard_questions_solved\n\nTotal Point: $contribution_points\n\n',style: TextStyle(color: Colors.black),),
          ),
        ),
      ],
    ),
  );
}
