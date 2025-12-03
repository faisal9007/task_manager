import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class PhotoPicker extends StatelessWidget {
  const PhotoPicker({
    super.key, required this.onTap, this.selectedPhoto,
  });

  final VoidCallback onTap;
  final XFile ? selectedPhoto;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
      
        height: 50,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
            children: [
              Container(
                  child:
                  Text('Photo',
                    style: TextStyle(
                      color: Colors.brown,
                    ),
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      )
                  ),
                  width: 80, height: 50),
              Expanded(
                child: Text(selectedPhoto == null? 'No Photo Selected': selectedPhoto!.name,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
                  maxLines: 1,
                ),
              )
            ]),
      ),
    );
  }
}