import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyScreenLayout(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyScreenLayout extends StatefulWidget {
  const MyScreenLayout({super.key});

  @override
  State<MyScreenLayout> createState() => _MyScreenLayoutState();
}

class _MyScreenLayoutState extends State<MyScreenLayout> {
  int _selectedIndex = 0; 
  final List<IconData> _icons = [
    Icons.home,
    Icons.search,
    Icons.favorite,
    Icons.settings,
    Icons.person,
  ];

  final List<String> _labels = [
    'Button 1',
    'Button 2',
    'Button 3',
    'Button 4',
    'Button 5',
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print('Выбрана кнопка: ${_labels[index]}');

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello!!'),
        centerTitle: true,
        backgroundColor: const Color(0xFF4a90e2),
        foregroundColor: Colors.white,
        elevation: 2.0,
      ),

      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [

                Center(
                  child: Container(
                    width: 250,
                    height: 150,
                    decoration: BoxDecoration(
                      color: const Color(0xFFe0e0e0), 
                      border: Border.all(
                        color: const Color(0xFFb0b0b0),
                        width: 2.0,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://avatars.mds.yandex.net/i?id=c3438815de943b30d11e8fa3497e5ca4_l-5270387-images-thumbs&n=13',
                        fit: BoxFit.cover, 
   
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                          return const Center(
                            child: Icon(Icons.error_outline, color: Colors.red, size: 40),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 16.0,
                  right: 16.0,
                  child: FloatingActionButton(
                    onPressed: () {
                      print('FAB clicked!');
                    },
                    backgroundColor: const Color(0xFFd9534f),
                    foregroundColor: Colors.white,
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: List.generate(_icons.length, (index) {
          return BottomNavigationBarItem(
            icon: Icon(_icons[index]),
            label: _labels[index],
          );
        }),
        currentIndex: _selectedIndex, кс
        selectedItemColor: const Color(0xFF4a90e2), 
        unselectedItemColor: Colors.grey[600], 
        onTap: _onItemTapped, 
        type: BottomNavigationBarType.fixed, 
        backgroundColor: const Color(0xFFf8f8f8), 
      ),
    );
  }
}