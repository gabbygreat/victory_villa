import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:victory_villa/model/enum.dart' as enums;
import 'package:victory_villa/utils/colors.dart';

class ImageRadio extends StatefulWidget {
  final enums.UploadType radioValue;
  final Function uploadPath;
  final ValueChanged valueChanged;
  const ImageRadio({
    Key? key,
    required this.uploadPath,
    required this.radioValue,
    required this.valueChanged,
  }) : super(key: key);

  @override
  State<ImageRadio> createState() => _ImageRadioState();
}

class _ImageRadioState extends State<ImageRadio> {
  enums.UploadType _uploadValue = enums.UploadType.camera;

  Future pickImageToCrop(enums.UploadType uploadType) async {
    final _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
      source: uploadType == enums.UploadType.photo
          ? ImageSource.gallery
          : ImageSource.camera,
    );

    if (image == null) return null;

    widget.uploadPath(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Row(
              children: [
                Radio<enums.UploadType>(
                  value: enums.UploadType.camera,
                  groupValue: _uploadValue,
                  onChanged: (value) {
                    setState(
                      () {
                        _uploadValue = value!;
                        widget.valueChanged(value);
                      },
                    );
                  },
                ),
                GestureDetector(
                  onTap: () => setState(
                    () {
                      _uploadValue = enums.UploadType.camera;
                      widget.valueChanged(enums.UploadType.camera);
                    },
                  ),
                  child: Text(
                    'From Camera',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: VictoryColor.faintColor,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Radio<enums.UploadType>(
                  value: enums.UploadType.photo,
                  groupValue: _uploadValue,
                  onChanged: (value) {
                    setState(
                      () {
                        _uploadValue = value!;
                        widget.valueChanged(value);
                      },
                    );
                  },
                ),
                GestureDetector(
                  onTap: () => setState(
                    () {
                      _uploadValue = enums.UploadType.photo;
                      widget.valueChanged(enums.UploadType.photo);
                    },
                  ),
                  child: Text(
                    'From Photo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: VictoryColor.faintColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(
            _uploadValue == enums.UploadType.camera
                ? Icons.photo_camera
                : Icons.image,
            color: VictoryColor.primaryColor,
          ),
          onPressed: () {
            pickImageToCrop(_uploadValue);
          },
        ),
      ],
    );
  }
}
