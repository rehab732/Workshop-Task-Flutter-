import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:workshop/mybloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: const Text(
          'My Feed',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
                  return state.myList.length == 0
                      ? Center(
                          child: Column(
                            children: const [
                              Center(child: CircularProgressIndicator()),
                            ],
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.myList.length,
                          itemBuilder: (context, index) => Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SingleChildScrollView(
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(40),
                                          child: Image.network(
                                            state.myList[index].urlToImage
                                                .toString(),
                                            width: 350,
                                            errorBuilder: (BuildContext context,
                                                Object exception,
                                                StackTrace? stackTrace) {
                                              return ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                child: Image.network(
                                                  state.myList[8].urlToImage
                                                      .toString(),
                                                  width: 350,
                                                ),
                                              );
                                              // const CircularProgressIndicator(
                                              //   color: Colors.black,
                                              // );
                                            },
                                            loadingBuilder: (BuildContext context,
                                                Widget child,
                                                ImageChunkEvent?
                                                    loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Center(
                                                child: CircularProgressIndicator(
                                                  value: loadingProgress
                                                              .expectedTotalBytes !=
                                                          null
                                                      ? loadingProgress
                                                              .cumulativeBytesLoaded /
                                                          loadingProgress
                                                              .expectedTotalBytes!
                                                      : null,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        flex: 6,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              state.myList[index].title
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                state.myList[index]!.content
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                )),
                                            Text(
                                              state.myList[index].author
                                                  .toString(),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Row(
                                        children: const [
                                          LikeButton(),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('Like'),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Icon(Icons.comment),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('Comment'),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Icon(Icons.save),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('Save'),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Icon(Icons.share),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text('Share'),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                              state.myList[index].publishedAt
                                                  .toString(),
                                              style: TextStyle(
                                                color: Colors.grey[350],
                                              )),
                                          const SizedBox(
                                            width: 25,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                }),
              ],
            ),
            BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                    backgroundColor: Colors.deepOrange),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Search',
                    backgroundColor: Colors.deepOrange),
                BottomNavigationBarItem(
                    icon: Icon(Icons.business),
                    label: 'Business',
                    backgroundColor: Colors.deepOrange),
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu_book_rounded),
                    label: 'My Feed',
                    backgroundColor: Colors.deepOrange)
              ],
            )
          ],
        ),
      ),
    );
  }
}
//replace null value with what?