import 'package:flutter/material.dart';
import 'dart:io';

  const int ACT_ID_FILE_TOOLS = 0;
  const int ACT_ID_DEV_TOOLS = 1;
  const int ACT_ID_SYS_TOOLS = 2;

   // Определяем строковые константы
  const String ACT_CAP_FILE_TOOLS = 'File tools';
  const String ACT_CAP_DEV_TOOLS = 'Dev tools';
  const String ACT_CAP_SYS_TOOLS = 'System tools';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Apf Installer (c) Nazarov A.A., 2024-2025, Orenburg')),
        body: CheckboxList(),
      ),
    );
  }
}

class CheckboxList extends StatefulWidget {
  @override
  _CheckboxListState createState() => _CheckboxListState();
}

class _CheckboxListState extends State<CheckboxList> {
  List<bool> _checked = [false, false, false];
   // Создаем карту, связывающую идентификаторы с их описаниями
  Map<int, String> strCaptions = {
    ACT_ID_FILE_TOOLS: ACT_CAP_FILE_TOOLS,
    ACT_ID_DEV_TOOLS: ACT_CAP_DEV_TOOLS,
    ACT_ID_SYS_TOOLS: ACT_CAP_SYS_TOOLS,
  };

  void _install(int index) {
    // Запуск bash-скрипта с номером строки
    Directory current = Directory.current;
    Process.run('/usr/bin/konsole', ['-e', '${current.path}/do_install.sh', (index + 1).toString(), '\"${strCaptions[index]}\"']).then((result) {
      print(result.stdout);
      print(result.stderr);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < _checked.length; i++)
          Row(
            children: [
              Checkbox(
                value: _checked[i],
                onChanged: (bool? value) {
                  setState(() {
                    _checked[i] = value!;
                  });
                },
              ),
              Text('Install ${strCaptions[i]}'),
            ],
          ),
        ElevatedButton(
          onPressed: () {
            for (int i = 0; i < _checked.length; i++) {
              if (_checked[i]) {
                _install(i);
              }
            }
          },
          child: Text('Install'),
        ),
      ],
    );
  }
}
