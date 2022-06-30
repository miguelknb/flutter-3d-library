import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter3d/storage_service_file.dart';
import 'package:path/path.dart' as p;

class UploadFileButton extends StatelessWidget {
  const UploadFileButton({Key? key, required this.fileName, required this.title, this.onUpload}) : super(key: key);

  final String fileName;
  final String title;

  final Function? onUpload;

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();

    return MaterialButton(
          onPressed: () async {
            final results = await FilePicker.platform.pickFiles(
                allowMultiple: false,
                allowCompression: true,
                type: FileType.custom,
                allowedExtensions: ['png', 'jpeg', 'jpg']);

            if (results == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("No file selected"),
                ),
              );
            }

            final path = results?.files.single.path;
            final extension = p.extension(path!);
            storage.uploadImage(path, fileName + extension).then((value) => {});

            if(onUpload != null) onUpload!(fileName, extension);
          },
          child: Text(title),
        );
  }
}
