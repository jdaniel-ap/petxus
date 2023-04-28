import 'package:camera/camera.dart';

class CameraController {
  static initializeCameras() async {
    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    final firstCamera = cameras.first;
  }
}
