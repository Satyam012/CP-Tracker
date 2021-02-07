import 'package:flutter/material.dart';
import 'CCDATA.dart';
import 'CFDATA.dart';
import 'LCDATA.dart';
import '';
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
      appBar: AppBar(title: Text('CP-Tracker')),
      body: Detail(),
    );
  }
}

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool loading;
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

    setState(() {
      loading = false;
      //print(tagObjs);
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
        child: Column(

            children:[
              if(data1.length>0)CCcard(data1["rating"],data1["star"],data1["highest_rating"],data1["global_rank"],data1["country_rank"]),
              if(data2.length>0)CFcard(data2["rating"],data2["max_rating"],data2["rank"],data2["max_rank"]),
              if(data3.length>0)LCcard(data3["ranking"],data3["total_problems_solved"],data3["easy_questions_solved"],data3["medium_questions_solved"],data3["hard_questions_solved"],data3["contribution_points"]),
            ]
        ),
      ),
    );
  }
}


Widget CCcard(var rating,var star,var highest_rating,var global_rank, var country_rank){

  return Card(
    color: Colors.purple[50],
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          title: Text('\nCODECHEF'),
          subtitle: Text('\nSTAR: $star\n\nCurrent-Rating: $rating\n\nHighest Rating: $highest_rating\n\nCountry Rank: $country_rank\n\nGlobal Rank: $global_rank\n\n'),
        ),
      ],
    ),
  );
}

Widget CFcard(var rank,var highest_rank,var rating,var highest_rating){

  return Card(
    color: Colors.lightGreenAccent,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          title: Text('\nCODEFORCES'),
          subtitle: Text('\nCurrent-Rating: $rating\n\nHighest Rating: $highest_rating\n\nCurrent Rank: $rank\n\nHighest Rank: $highest_rank\n\n'),
        ),
      ],
    ),
  );
}

Widget LCcard(var ranking,var total_problems_solved,var easy_questions_solved,var medium_questions_solved,var hard_questions_solved,var contribution_points){

  return Card(
    color: Colors.amberAccent,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          title: Text('\nLEETCODE'),
          subtitle: Text('\nCurrent-Rank: $ranking\n\nTotal Problems Solved: $total_problems_solved\n\nEasy Questions Solved: $easy_questions_solved\n\nMedium Questions Solved: $medium_questions_solved\n\nHard Questions Solved: $hard_questions_solved\n\nTotal Point: $contribution_points\n\n'),
        ),
      ],
    ),
  );
}


