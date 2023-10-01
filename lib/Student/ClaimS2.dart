import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lostfound/main.dart';

class ClaimS2 extends StatefulWidget {
  const ClaimS2({super.key});

  @override
  State<ClaimS2> createState() => _ClaimS2State();
}

class _ClaimS2State extends State<ClaimS2> {

  var cumailCtrl = TextEditingController();

  String? blockListSelected = null;
  var blockList = [
    'D1',
    'B3',
    'B1',
    'B4',
    'B6',
  ];

  String? colorListSelected = null;
  var colorList = [
    'black',
    'blue',
    'green',
    'pink',
    'yellow',
  ];

  var colorCtrl = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent, // Make the AppBar background transparent
          leading: BackButton(color: Color(0xffffffff)),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff0B69FF), Color(0xff418AFF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xff0B69FF),
                  Color(0xff418AFF),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Text("Claim", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, color: Colors.white, fontSize: 40, height: 1.2),),
                Text("Your Item", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, color: Colors.white, fontSize: 40, height: 1.2),),

                SizedBox(height: 30,),
                Text("  Item Name *", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
                SizedBox(height: 5,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: cumailCtrl,
                          decoration: InputDecoration(
                            prefixText: "   ",
                            hintText: "Item Name",
                            hintStyle: TextStyle(
                              fontFamily: "Poppins",
                              color: Color(0xff468DFF), // Change this color to your desired hint text color
                            ),
                            border: InputBorder.none,
                          ),
                          maxLines: 1,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter CU Mail Id";
                            }
                            if (!(value.endsWith("@gmail.com") || value.endsWith('@cuchd.in'))) {
                              return "Enter CU Mail Id only";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20,),
                Text("  Description *", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
                SizedBox(height: 5,),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: cumailCtrl,
                          decoration: InputDecoration(
                            prefixText: "   ",
                            hintText: "Description",
                            hintStyle: TextStyle(
                              fontFamily: "Poppins",
                              color: Color(0xff468DFF), // Change this color to your desired hint text color
                            ),
                            border: InputBorder.none,
                          ),
                          maxLines: 1,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter CU Mail Id";
                            }
                            if (!(value.endsWith("@gmail.com") || value.endsWith('@cuchd.in'))) {
                              return "Enter CU Mail Id only";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("  Type", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
                        SizedBox(height: 5,),
                        Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: cumailCtrl,
                                  decoration: InputDecoration(
                                    hintText: "Type",
                                    prefixText: "   ",
                                    hintStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      color: Color(0xff468DFF), // Change this color to your desired hint text color
                                    ),
                                    border: InputBorder.none,
                                    counterText: "",
                                  ),
                                  maxLines: 1,
                                  maxLength: 5,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter Cabin No.";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("   Color", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
                        SizedBox(height: 5,),
                        Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 15,),
                              AutoDropdown(ctrl: colorCtrl, list: colorList, listSelected: colorListSelected, widths: 135, hint: "Colors",)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 20,),
                Text("  Unique Identifier", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
                SizedBox(height: 10,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: cumailCtrl,
                          decoration: InputDecoration(
                            prefixText: "   ",
                            hintText: "Unique Identifier",
                            hintStyle: TextStyle(
                              fontFamily: "Poppins",
                              color: Color(0xff468DFF), // Change this color to your desired hint text color
                            ),
                            border: InputBorder.none,
                          ),
                          maxLines: 1,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter CU Mail Id";
                            }
                            if (!(value.endsWith("@gmail.com") || value.endsWith('@cuchd.in'))) {
                              return "Enter CU Mail Id only";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20,),
                Text("  Lost Location", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
                SizedBox(height: 10,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: cumailCtrl,
                          decoration: InputDecoration(
                            prefixText: "   ",
                            hintText: "Lost Location",
                            hintStyle: TextStyle(
                              fontFamily: "Poppins",
                              color: Color(0xff468DFF), // Change this color to your desired hint text color
                            ),
                            border: InputBorder.none,
                          ),
                          maxLines: 1,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter CU Mail Id";
                            }
                            if (!(value.endsWith("@gmail.com") || value.endsWith('@cuchd.in'))) {
                              return "Enter CU Mail Id only";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20,),
                Text("  Lost Date", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
                SizedBox(height: 10,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: cumailCtrl,
                          decoration: InputDecoration(
                            prefixText: "   ",
                            hintText: "Lost Date",
                            hintStyle: TextStyle(
                              fontFamily: "Poppins",
                              color: Color(0xff468DFF), // Change this color to your desired hint text color
                            ),
                            border: InputBorder.none,
                          ),
                          maxLines: 1,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter CU Mail Id";
                            }
                            if (!(value.endsWith("@gmail.com") || value.endsWith('@cuchd.in'))) {
                              return "Enter CU Mail Id only";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20,),
                Text("  Image Upload", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
                SizedBox(height: 10,),
                Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Icon(CupertinoIcons.game_controller_solid, size: 50,)
                ),

                SizedBox(height: 30,),
                InkWell(
                  onTap: () {

                  },
                  child: Center(
                    child: Container(
                      height: 60,
                      width: 240,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(21)),
                      child: Center(
                        child: Text(
                          'Send',
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),

              ],
            ),
          ),
        )
    );
  }
}
