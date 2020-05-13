import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheet extends StatelessWidget {
  final Function(File) onImageSelected;

  ImageSourceSheet({this.onImageSelected});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height / 6,
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                    File image =
                        await ImagePicker.pickImage(source: ImageSource.camera);
                    selectImage(image);
                  },
                  child: Column(
                    children: <Widget>[
                      Expanded(child: Image.asset('images/camera.png')),
                      Expanded(
                          child: Text(
                        'Câmera',
                        style: TextStyle(fontSize: 20),
                      ))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                    File image = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                    selectImage(image);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(child: Image.asset('images/gallery.png')),
                      Expanded(
                          child: Text(
                        'Galeria',
                        style: TextStyle(fontSize: 20),
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void selectImage(File image) async {
    if(image != null){
      File croppedImg = await ImageCropper.cropImage(
          sourcePath: image.path,
          aspectRatioPresets: [CropAspectRatioPreset.ratio16x9, CropAspectRatioPreset.ratio7x5, CropAspectRatioPreset.ratio3x2, CropAspectRatioPreset.original]);

      onImageSelected(croppedImg);
    } else{
      onImageSelected(null);
    }
  }
}
