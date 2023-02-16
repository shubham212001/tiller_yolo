# tiller_yolo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Flutter YOLOv5 Tiller Detector
This is a sample Flutter project that uses the YOLOv5 model to detect tillers in real-time using the camera feed. The app displays the camera feed with bounding boxes around the detected tillers.

Getting Started
To run this app on your local machine, follow these steps:

Clone the repository:

bash
Copy code
git clone https://github.com/<your-username>/flutter-yolov5-tiller-detector.git
Navigate to the project directory:

bash
Copy code
cd flutter-yolov5-tiller-detector
Install the dependencies:

csharp
Copy code
flutter pub get
Download the YOLOv5 model:

You can download the YOLOv5 model for tiller detection from the following link: https://github.com/ultralytics/yolov5/releases/download/v5.0/yolov5s.tflite

Once you have downloaded the model, place it in the assets directory of the project.

Run the app:

You can run the app on an emulator or a physical device using the following command:

Copy code
flutter run
Implementation Details
The app uses the following libraries:

camera: This library is used to display the camera feed and capture images from the camera.
tflite: This library is used to load the YOLOv5 model and run inference on camera images.
path_provider: This library is used to get the path to the YOLOv5 model file.
flutter_custom_paint: This library is used to draw bounding boxes on the camera screen.
The app has the following components:

CameraScreen: This is the main screen of the app that displays the camera feed and the bounding boxes around detected tillers. It uses the camera library to capture camera images, the tflite library to detect tillers in the images, and the flutter_custom_paint library to draw bounding boxes on the screen.

TillerDetector: This is a helper class that uses the tflite library to load the YOLOv5 model and run inference on camera images. It has a method called detectTillers that takes a camera image as input and returns a list of Rect objects that represent the bounding boxes around detected tillers.

BoundingBoxPainter: This is a custom painter that draws bounding boxes on the camera screen. It takes a list of Rect objects as input and draws a red rectangle around each object.
