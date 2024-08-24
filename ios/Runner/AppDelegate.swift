import UIKit
import Flutter
import CoreLocation  // Import CoreLocation

@main
@objc class AppDelegate: FlutterAppDelegate, CLLocationManagerDelegate {  // Conform to CLLocationManagerDelegate
  var locationManager: CLLocationManager?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // Initialize and configure the CLLocationManager
    locationManager = CLLocationManager()
    locationManager?.delegate = self  // Set delegate to self
    locationManager?.requestWhenInUseAuthorization()  // Request appropriate authorization

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // Add CLLocationManagerDelegate methods here if needed, such as didUpdateLocations, etc.
}
