import 'dart:io';

import 'package:boilerplate/common/http/api_provider.dart';
import 'package:boilerplate/common/http/http_multi_part.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/file.dart';

class FilePickScreen extends StatefulWidget {
  const FilePickScreen({super.key});

  @override
  State<FilePickScreen> createState() => _FilePickScreenState();
}

class _FilePickScreenState extends State<FilePickScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () async {
              final result = await FilePicker.platform.pickFiles();

              if (result == null) {
                return;
              }
              final List<PlatformFile> files = result.files;

              final PlatformFile firstFile = files.first;

              print(firstFile.name);
              print(firstFile.path);

              upload(firstFile.path!);
            },
            child: Text("Pick Files")),
      ),
    );
  }
}
