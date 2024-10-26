import 'package:flutter/cupertino.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      //   theme: CupertinoThemeData(
      //       textTheme: CupertinoTextThemeData(
      //           navLargeTitleTextStyle:
      //               TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0))),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book_solid), label: 'Articles'),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.eye_solid), label: 'Views'),
      ]),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle:
                    (index == 0) ? const Text('Articles') : const Text('Views'),
              ),
              child: Center(
                child: CupertinoButton(
                    child: Text(
                      'This is tab no: $index',
                      style: const TextStyle(fontSize: 30),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .push(CupertinoPageRoute(builder: (context) {
                        return DetailScreen(index == 0 ? 'Articles' : 'Views');
                      }));
                    }),
              ),
            );
          },
        );
      },
    );

    // for single page

    // const CupertinoPageScaffold(
    //     child: Center(
    //   child: Text('Cupertino App',
    //       style: TextStyle(
    //           fontSize: 50,
    //           fontWeight: FontWeight.bold,
    //           color: CupertinoColors.activeBlue)),
    // ));
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen(this.topic, {super.key});
  final String topic;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Details'),
        ),
        child: Center(
          child: Text(
            'Details for $topic',
            style: const TextStyle(fontSize: 30),
          ),
        ));
  }
}
