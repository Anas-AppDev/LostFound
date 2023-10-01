import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:lostfound/Admin/AddItemA2.dart';
import 'package:lostfound/Admin/DetailOfClaimA2.dart';
import 'package:smooth_corner/smooth_corner.dart';

class ClaimA1 extends StatefulWidget {

  String pid, iName, iType;
  ClaimA1({super.key, required this.pid, required this.iName, required this.iType});

  @override
  State<ClaimA1> createState() => _ClaimA1State();
}

class _ClaimA1State extends State<ClaimA1> {

  var searchCtrl = TextEditingController();
  var imgLink = "https://i.pinimg.com/564x/df/00/14/df001467ef17f34e505f54a7f60e4440.jpg";

  var auth = FirebaseAuth.instance;
  var firestore = FirebaseFirestore.instance.collection("LostFound");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black
        ),
      ),
      body: Stack(
        children: [
          Container(color: Colors.white,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                        width: 330,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(0xffF5F5F5),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: InkWell(
                                  onTap: (){

                                  },
                                  child: Icon(CupertinoIcons.search)),
                            ),
                            Expanded(
                              child: TextField(
                                controller: searchCtrl,
                                decoration: InputDecoration(
                                  hintText: "Search Item...",
                                  border: InputBorder.none,
                                ),
                                onChanged: (value){
                                  setState(() {

                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 40,),
                  Row(
                    children: [
                      SizedBox(width: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Claims", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, color: Colors.black, fontSize: 28, height: 1.2, letterSpacing: 1.2),),
                          Text("10 Results", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, color: Colors.black, fontSize: 28, height: 1.2, letterSpacing: 1.2),),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 20,),
                  StreamBuilder(
                    stream: firestore.doc("Inventory").collection("items").doc(widget.pid).collection("Claims Pending").snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                      if (snapshot.hasError){
                        return Center(child: Text("Something went wrong"));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting){
                        return Center(child: CupertinoActivityIndicator());
                      }
                      if (snapshot.data!.docs.isEmpty){
                        return Center(child: Text("No data found"));
                      }

                      if (snapshot!=null && snapshot.data!=null){
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index){
                            var iName = snapshot.data!.docs[index]['iName'];
                            var iDesc = snapshot.data!.docs[index]['iDesc'];
                            var iType = snapshot.data!.docs[index]['iType'];
                            var iColor = snapshot.data!.docs[index]['iColor'];
                            var iLoc = snapshot.data!.docs[index]['iLoc'];
                            var iUniq = snapshot.data!.docs[index]['iUniq'];
                            var studUid = snapshot.data!.docs[index]['studUid'];
                            var lostDate = snapshot.data!.docs[index]['lostDate'];
                            var lostTime = snapshot.data!.docs[index]['lostTime'];
                            var iImg = snapshot.data!.docs[index]['iImg'];
                            var iReqDate = snapshot.data!.docs[index]['iReqDate'];
                            return InkWell(
                              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailOfClaimA2(pid: widget.pid, studUid: studUid, iName: widget.iName, iType: widget.iType,))),
                              child: Container(
                                height: 180,
                                margin: EdgeInsets.only(bottom: 20),
                                width: MediaQuery.of(context).size.width,
                                decoration: ShapeDecoration(
                                  shape: SmoothRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    smoothness: 1,
                                  ),
                                  color: Colors.amber,
                                ),
                                child: Stack(
                                  children: [
                                    SmoothClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      smoothness: 1,
                                      child: Image.network(
                                        imgLink,
                                        fit: BoxFit.cover,
                                        height: MediaQuery.of(context).size.height,
                                        width: MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 30,),
                                        StreamBuilder(
                                          stream: firestore.doc('Users').collection('Students').where("studUid", isEqualTo: studUid).snapshots(),
                                          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){


                                            if (snapshot.hasError){
                                              return Center(child: Text("Something went wrong"));
                                            }
                                            if (snapshot.connectionState == ConnectionState.waiting){
                                              return Center(child: CupertinoActivityIndicator());
                                            }
                                            if (snapshot.data!.docs.isEmpty){
                                              return Center(child: Text("No data found"));
                                            }

                                            if (snapshot!=null && snapshot.data!=null){
                                              return ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: snapshot.data!.docs.length,
                                                  itemBuilder: (context, index) {
                                                    return Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          width: 8,
                                                          height: 55,
                                                          decoration: BoxDecoration(
                                                            color: Colors.black,
                                                            borderRadius: BorderRadius.only(
                                                              topRight: Radius.circular(20),
                                                              bottomRight: Radius.circular(20),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 15,),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(snapshot.data!.docs[index]['uniUid'], style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.normal, color: Colors.white, fontSize: 12, height: 1.2),),
                                                            Container(
                                                                width: 250,
                                                                child: Text("Description", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24, height: 1.2),)),
                                                          ],
                                                        ),
                                                        InkWell(
                                                          onTap: (){
                                                            showDialog(
                                                              context: context,
                                                              builder: (BuildContext context){
                                                                return CupertinoAlertDialog(
                                                                  title: Text("Remove Request"),
                                                                  content: Column(
                                                                    children: [
                                                                      SizedBox(height: 10,),
                                                                      Container(
                                                                        height: 88,
                                                                        width: 88,
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(18),
                                                                          color: Colors.green,
                                                                        ),
                                                                      ),
                                                                      Text("Are you sure you want to accept this request ?"),
                                                                    ],
                                                                  ),
                                                                  actions: [
                                                                    CupertinoDialogAction(
                                                                      onPressed: (){
                                                                        Navigator.pop(context);
                                                                      },
                                                                      child: Text("No"),
                                                                    ),
                                                                    CupertinoDialogAction(
                                                                      onPressed: (){
                                                                        print("object " + studUid);
                                                                        firestore.doc("Stud Requests").collection("Claims Accepted").doc(widget.pid+"_"+studUid).set(
                                                                            {
                                                                              "iName": iName ?? "",
                                                                              "iDesc": iDesc ?? "",
                                                                              "iType": iType ?? "",
                                                                              "iColor": iColor ?? "",
                                                                              "iLoc": iLoc ?? "",
                                                                              "iUniq": iUniq ?? "",
                                                                              "studUid": studUid ?? "",
                                                                              "lostDate": lostDate ?? "",
                                                                              "lostTime": lostTime ?? "",
                                                                              "iImg": iImg ?? "",
                                                                              "iReqDate": iReqDate ?? "",
                                                                              "iAcceptDate": DateFormat('d MMMM y').format(DateTime.now()),
                                                                              "pid": widget.pid,
                                                                              "adminUid": auth.currentUser!.uid,
                                                                            }
                                                                        );
                                                                        firestore.doc("Inventory").collection("items").doc(widget.pid).collection("Claims Pending").doc(studUid).delete();
                                                                        firestore.doc("Stud Requests").collection("Claims Pending").doc(widget.pid+"_"+studUid).delete();
                                                                        Navigator.pop(context);
                                                                      },
                                                                      child: Text("Yes"),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: Container(
                                                            height: 30,
                                                            width: 30,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(8),
                                                              color: Colors.black,
                                                            ),
                                                            child: Icon(CupertinoIcons.color_filter, color: Colors.white, size: 20,),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }
                                              );
                                            }
                                            return Container();
                                          },
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(width: 25,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 10,),
                                                Container(
                                                  width: 283,
                                                  child: Text(snapshot.data!.docs[index]['iDesc'], style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14, height: 1.3),),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return Container();
                    },
                  ),



                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
