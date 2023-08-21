// import 'package:flutter/material.dart';
// import 'package:news/services/newsclient.dart';
// import 'package:news/services/newsmodel.dart';

// class homepage extends StatefulWidget {
//   const homepage({super.key});

//   @override
//   State<homepage> createState() => _homepageState();
// }

// class _homepageState extends State<homepage> {
//   NewsClient nClient = NewsClient();
//   List<dynamic> nlist = [];
//   Future<dynamic> getNEWS() async {
//     Map<String, dynamic> newsMap = await nClient.getNewsDataFromAPI();
//     List<dynamic> nlist = newsMap['articles'];
//     List<NewsModel> newslist = genericToSpecificObject(nlist);
//     return newslist;
//   }

//   genericToSpecificObject(List<dynamic> list) {
//     List<NewsModel> newslist = list.map((singleObject) {
//       NewsModel singleNews = NewsModel.extractFromJSON(singleObject);
//       return singleNews;
//     }).toList();
//     return newslist;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('news'),
//           centerTitle: true,
//           actions: [
//             IconButton(
//                 onPressed: () {
//                   setState(() {});
//                 },
//                 icon: Icon(Icons.replay))
//           ],
//         ),
//         body: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: FutureBuilder(
//               future: getNEWS(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else if (snapshot.hasError) {
//                   return Center(
//                     child: Text(snapshot.error.toString()),
//                   );
//                 } else if (snapshot.hasData) {
//                   return ListView.builder(
//                       itemCount: snapshot.data!.length,
//                       itemBuilder: ((context, index) {
//                         return Card(
//                           child: Column(
//                             children: [
//                               Image.network(snapshot.data![index].urlToImage),
//                               Text(snapshot.data![index].title),
//                             ],
//                           ),
//                         );
//                       }));
//                   // return Center(
//                   //   child: Text('success'),
//                   // );
//                 }
//                 return Container();
//               }),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:news/services/newsclient.dart';
import 'package:news/services/newsmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

NewsClient nClient = NewsClient();

Future<List<NewsModel>> getNEWS() async {
  Map<String, dynamic> newsMap =
      await nClient.getNewsDataFromAPI(); //complete news JSON/map
  List<dynamic> nList = newsMap['articles'];
  List<NewsModel> newsList = genericToSpecificObject(nList);
  return newsList;
}

genericToSpecificObject(List<dynamic> list) {
  List<NewsModel> newsList = list.map((singleObject) {
    NewsModel singleNews = NewsModel.extractFromJSON(singleObject);
    return singleNews;
  }).toList();

  return newsList;
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("NEWS APP"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: const Icon(Icons.replay))
          ],
        ),
        body: SizedBox(
            // color: Colors.amber,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder(
                future: getNEWS(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            // height: MediaQuery.of(context).size.width * 0.8,
                            child: Card(
                              color: const Color.fromARGB(255, 241, 239, 239),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.network(
                                        snapshot.data![index].urlToImage),
                                    Text(
                                      snapshot.data![index].title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      snapshot.data![index].description,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      snapshot.data![index].url,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      snapshot.data![index].author,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                          fontSize: 15),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                          // return ListTile(
                          //   tileColor: Colors.blue,
                          //   title: Text(snapshot.data![index].title),
                          // );
                        });
                    // return const Center(
                    //   child: Text("SUCCESS"),
                    // );
                  }
                  return Container();
                })),
      ),
    );
  }
}
