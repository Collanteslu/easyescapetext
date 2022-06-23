import 'package:flutter/material.dart';

class EscapeTextPage extends StatefulWidget {
  const EscapeTextPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<EscapeTextPage> createState() => _EscapeTextPageState();
}

class _EscapeTextPageState extends State<EscapeTextPage> {
  late TextEditingController _controllerEscapeText;

  @override
  void initState() {
    super.initState();
    _controllerEscapeText = TextEditingController(text: '');
  }

  void _escapeText(String value) {
    String escapedText = RegExp.escape(value);

    setState(() {
      _controllerEscapeText = TextEditingController(text: escapedText);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(100),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Entrada',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Card(
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: 8,
                      onChanged: (String value) {
                        _escapeText(value);
                      },
                    ),
                  )),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Resultado',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Card(
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      readOnly: true,
                      controller: _controllerEscapeText,
                      maxLines: 8,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
