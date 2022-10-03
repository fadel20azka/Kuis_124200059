import 'package:flutter/material.dart';

import 'books_data.dart';
import 'detail.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Halaman Utama"),
        ),
        body: GridView.builder(
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2) ,

            itemBuilder: (context, index) {
              final BooksData books = booksData[index];
              return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(books : books)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Container(

                      child: Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.blueAccent
                            ),
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(books.imageLinks, width: 100, height: 135,),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(books.title, style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(books.authors[0]),
                            Text(books.publishedDate,  style: TextStyle(fontSize: 10)),
                          ],
                        ),
                      ),
                    ),
                  )
              );
            }
        )
    );
  }
}