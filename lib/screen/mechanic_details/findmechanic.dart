import 'package:cardoctor/Models/mechanic.dart';
import 'package:cardoctor/res/color.dart';
import 'package:cardoctor/screen/mechanic_details/mechanicdetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FindMechanic extends StatefulWidget {
  final mechanic = Mechanic.mechanicmodel();
  FindMechanic({super.key});

  @override
  State<FindMechanic> createState() => _FindMechanicState();
}

class _FindMechanicState extends State<FindMechanic> {
  TextEditingController controller = TextEditingController();
  final mechanic = Mechanic.mechanicmodel();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.primaryColor, title: Text("Mechanic")),
        body: Container(
            child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {},
              controller: controller,
              decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search Mechanic by City",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)))),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 30),
                itemCount: mechanic.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        String id = mechanic[index].id;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MechanicDetail(id: int.parse(id))));
                        // Get.to(() => DetailScreen(id: int.parse(id)));
                      },
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: ClipOval(
                                child: Image.asset(
                                  mechanic[index].image,
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.fill,
                                ),
                                // )),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 10),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      mechanic[index].name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryTextTextColor,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      mechanic[index].profession,
                                      style: TextStyle(
                                          color: AppColors.primaryTextTextColor,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text("More",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 228, 21, 6),
                                            ))),
                                  ]),
                            )
                            // );
                          ])));
                }),
          )

              // ListView.separated(
              //     itemCount: mechanic.length,
              //     separatorBuilder: (BuildContext context, int index) =>
              //         Divider(color: AppColors.dividedColor),
              //     itemBuilder: (BuildContext context, int index) {
              //       return Column(
              //         children: [
              //           SizedBox(
              //             height: 10,
              //             width: 20,
              //           ),
              //           GestureDetector(
              //             onTap: () {
              //               String id = mechanic[index].id;
              //               Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                       builder: (context) =>
              //                           MechanicDetail(id: int.parse(id))));
              //               // Get.to(() => DetailScreen(id: int.parse(id)));
              //             },
              //             child: Row(children: [
              //               SizedBox(
              //                 width: 10,
              //               ),
              //               SizedBox(
              //                 height: 110,
              //                 width: 110,
              //                 child: CircleAvatar(
              //                   backgroundColor: Colors.black,
              //                   child: SizedBox(
              //                       width: 100,
              //                       height: 100,
              //                       child: ClipOval(
              //                         child: Image.asset(
              //                           mechanic[index].image,
              //                           fit: BoxFit.fill,
              //                         ),
              //                       )),
              //                 ),
              //               ),
              //               SizedBox(
              //                 width: 20,
              //               ),
              //               SizedBox(
              //                 width: 170,
              //                 height: 100,
              //                 child: Column(
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       Text(
              //                         mechanic[index].name,
              //                         style: TextStyle(
              //                           fontWeight: FontWeight.bold,
              //                           color: AppColors.secondaryTextColor,
              //                           fontSize: 18,
              //                         ),
              //                       ),
              //                       SizedBox(
              //                         height: 10,
              //                       ),
              //                       Text(
              //                         mechanic[index].profession,
              //                         style: TextStyle(
              //                             color: AppColors.secondaryTextColor,
              //                             fontSize: 16),
              //                       ),
              //                       SizedBox(
              //                         height: 20,
              //                       ),
              //                       Align(
              //                           alignment: Alignment.bottomRight,
              //                           child: Text("More",
              //                               style: TextStyle(
              //                                 color: Colors.red,
              //                               ))),
              //                       // );
              //                     ]),
              //               ),
              //             ]),
              //           )
              //         ],
              //       );
              //     }),
              ),
        ])));
  }
}
