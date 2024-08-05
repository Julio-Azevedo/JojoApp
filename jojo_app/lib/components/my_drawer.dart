import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> chapters = [
      'Phantom Blood',
      'Battle Tendency',
      'Stardust Crusaders',
      'Diamond is Unbreakable',
      'Vento Aureo',
      'Stone Ocean',
      'Steel Ball Run',
      'Jojolion',
    ];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.grey[300]),
            child: const Center(
              child: Text(
                'JoJo Wiki',
                style: TextStyle(
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          // ROTAS DO APLICATIVO
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home Page'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ExpansionTile(
            leading: const Icon(Icons.person),
            title: const Text("Characters"),
            children: [
              ListTile(
                title: const Text("All"),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/personagens');
                },
              ),
              ...chapters
                  .map(
                    (chapter) => ListTile(
                      title: Text(chapter),
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          '/personagens',
                          arguments: {
                            'category': 'chapter',
                            'query': chapter,
                          },
                        );
                      },
                    ),
                  )
                  .toList(),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.psychology),
            title: const Text('Stands'),
            children: [
              ListTile(
                title: const Text("All"),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/stands');
                },
              ),
              ...chapters
                  .map(
                    (chapter) => ListTile(
                      title: Text(chapter),
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          '/stands',
                          arguments: {
                            'category': 'chapter',
                            'query': chapter,
                          },
                        );
                      },
                    ),
                  )
                  .toList(),
            ],
          ),
        ],
      ),
    );
  }
}
