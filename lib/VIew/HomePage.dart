import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsheading/Data/Model.dart';
import 'package:newsheading/Utilities.dart';

import '../Data/Service.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NewsLetter>? news;
  var isloaded = false;

  @override
  void initState() {
    super.initState();
    getCategory();
  }

  getCategory() async {
    news = (await ApiDemo().getNews())?.cast<NewsLetter>();
    if (news != null) {
      setState(() {
        isloaded = true;
        for (int i = 0; i <= news!.length - 1; i++) {
          Utilities.Images.add("${news![i].images}");
          print('****************** ${news![i].images?.main}');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Colors.white54,
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white24,
        title: Text('News App',style: TextStyle(color: Colors.black),),
      ),
      body: Visibility(
        visible: isloaded,
        replacement: const Center(child: CircularProgressIndicator()),
        child: Padding(
            padding: const EdgeInsets.only(top: 10,right: 10,left: 10,bottom: 20),
            child: ListView.builder(
              itemCount: news?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Card(
                    elevation: 10,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black,width: 1),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 250.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              //let's add the height
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Image.network('${news![index].images?.main}',fit: BoxFit.contain,),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Text(
                                '${news![index].occupation}',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              '${news![index].species}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5,left: 10),
                            child: Text(
                              '${news![index].name?.first} ${news![index].name?.middle} ${news![index].name?.last}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${news![index].sayings}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }
}
