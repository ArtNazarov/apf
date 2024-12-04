import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
 

Future<void> setExecutable(String filePath) async {
  var file = File(filePath);
  if (await file.exists()) {
    // Устанавливаем атрибут исполняемости с помощью команды chmod
    var result = await Process.run('chmod', ['+x', filePath]);

    if (result.exitCode == 0) {
      print('Атрибут исполняемости установлен для $filePath');
    } else {
      print('Ошибка при установке атрибута: ${result.stderr}');
    }
  } else {
    print('Файл не найден: $filePath');
  }
}
 

const String KONSOLE_SHELL_PATH = '/usr/bin/konsole';

class ProcessParams {
  String ExecuteFlag = '-e';
  String ShellPath = 'z';
  String Number = '0';
  String Name = ' ';
}

  const int ACT_ID_FILE_TOOLS = 0;
  const int ACT_ID_DEV_TOOLS = 1;
  const int ACT_ID_SYS_TOOLS = 2;
  const int ACT_ID_KEYS = 3;
  const int ACT_ID_MIRRORS = 4;
  const int ACT_ID_ZIP_TOOLS = 5;

   // Определяем строковые константы
  const String ACT_CAP_FILE_TOOLS = 'File tools';
  const String ACT_CAP_DEV_TOOLS = 'Dev tools';
  const String ACT_CAP_SYS_TOOLS = 'System tools';
  const String ACT_CAP_KEYS = 'Keys';
  const String ACT_CAP_MIRRORS = 'Mirrors';
  const String ACT_CAP_ZIP_TOOLS = 'Zip tools';

  Future<void> runProcessesSequentially(List<ProcessParams> processes) async {  


      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;

      final byteData = await rootBundle.load('assets/do_install.sh');
      final buffer = byteData.buffer;
      var filePath = tempPath + '/do_install.sh';  
      await File(filePath).writeAsBytes(buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

      await setExecutable(filePath);
    

  for (ProcessParams process in processes) {
    print("${process.Name}\t${process.Number}\t${filePath}\n");

    await Process.start(KONSOLE_SHELL_PATH, [process.ExecuteFlag,  filePath, process.Number, process.Name]).then((Process process) async {
      // Ждем завершения процесса
      int exitCode = await process.exitCode;
      print('Process finished with exit code: $exitCode');
    }).catchError((error) {
      print('Error starting process $error');
    });
  }
}

void main() async {
  
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
  
  List<ProcessParams> ppScripts = [];
   // Создаем карту, связывающую идентификаторы с их описаниями
  final Map<int, String> strCaptions = {
    ACT_ID_FILE_TOOLS: ACT_CAP_FILE_TOOLS,
    ACT_ID_DEV_TOOLS: ACT_CAP_DEV_TOOLS,
    ACT_ID_SYS_TOOLS: ACT_CAP_SYS_TOOLS,
    ACT_ID_KEYS : ACT_CAP_KEYS,
    ACT_ID_MIRRORS : ACT_CAP_MIRRORS,
    ACT_ID_ZIP_TOOLS : ACT_CAP_ZIP_TOOLS
  };

  List<bool> _checked =  List<bool>.filled(5, false);
 

  void _install(int index) async {
    ProcessParams pp = new ProcessParams();
    pp.Number = (index + 1).toString();
    pp.Name =  strCaptions[index] as String;
    ppScripts.add(pp);
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
              Text(
                'Install ${strCaptions[i]}',
                style: TextStyle(
                    fontWeight: _checked[i] ? FontWeight.bold : FontWeight.normal
              )),
            ],
          ),
        ElevatedButton(
          onPressed: () async{
      
            ppScripts = [];

            for (int i = 0; i < _checked.length; i++) {
              
              if (_checked[i]) {
                _install(i);
              };
              
            };

          await runProcessesSequentially(ppScripts);

          },
          child: Text('Install'),
        ),
      ],
    );
  }
}
