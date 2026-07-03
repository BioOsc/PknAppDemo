# PkmAppDemo

## App Demo Nativa for iOS
Examen Técnico – SR Android/iOS Nativo

#### Installation
+ Clone project
+ Go to Project Folder
```bash
  cd my-project
```
+ Install pods (podfile already in project)
```bash
  pod install
```

#### Deployment
+ Open .xcworkspace file from Xcode
+ Try to build and deploy target RMAppDemo, use the upper left icon 'Play' to build and Run.
+ You can deploy on Devices or Simulator as indicates in the upper bar, You must see:
```bash
  PkmAppDemo > iPhone Sim
```

#### Some pod dependencies may be not updated with Target version
+ Locate Pods Project under RMAppDemo, you can see the pods list in TARGETS left area
+ Locate Pod MDFInternationalization, Go to 'General' Tab and change Minimum Deployment to 15.6 or current RMAppDemo Minimum Deployment
+ Locate Pod Alamofire, Go to 'General' Tab and change Minimum Deployment to 15.6 or current RMAppDemo Minimum Deployment
+ Try to build and deploy target PkmAppDemo
