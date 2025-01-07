import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dio = Dio();


  Map<String, dynamic>? imagem;

  Future<Map<String, dynamic>> getHttp() async {
    final response = await dio.get('https://dog.ceo/api/breeds/image/random');
    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text('Dogs aleatórios'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            Text('Clique para sortear uma imagem:'),

            SizedBox(
              height: 16,
            ),

            Container(
              height: 300,
              width: 300,
              child: Image.network('${imagem? ['message'] ?? 'https://p2.trrsf.com/image/fget/cf/774/0/images.terra.com/2023/03/27/1705862623-vira-lata-caramelo.jpg' }'),
            ),

            SizedBox(
              height: 16,
            ),

            ElevatedButton(
              onPressed: () async {
                Map<String, dynamic>? img = await getHttp();
                setState(() {
                  imagem = img;
                });
              },
              child: Text('Sortear'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
