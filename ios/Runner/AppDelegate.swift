import UIKit
import Flutter
import Firebase
import AuthenticationServices
import SwiftKeychainWrapper



@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    var  result: FlutterResult?
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
          let mlkitChannel = FlutterMethodChannel(name: "com.webkul.cscart_mobikul/channel",
                                                    binaryMessenger: controller.binaryMessenger)
      mlkitChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in                                                  if call.method == "appleSignin"{
                                                                          self.result = result
                                                                          if #available(iOS 13.0, *) {
                                                                              let request = ASAuthorizationAppleIDProvider().createRequest()
                                                                              request.requestedScopes = [.fullName, .email]
                                                                              let authorizationController = ASAuthorizationController(authorizationRequests: [request])
                                                                              authorizationController.delegate = self
                                                                              authorizationController.presentationContextProvider = self
                                                                              authorizationController.performRequests()
                                                                          }
                                                                      }

                                                          })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
  enum Keys: String {
      case fname
      case lname
      case email
      case userID
      case personID
  }
  @available(iOS 13.0, *)
  extension AppDelegate: ASAuthorizationControllerDelegate {
      private var fourDigitNumber: String {
          var result = ""
          repeat {
              // Create a string with a random number 0...9999
              result = String(format:"%04d", arc4random_uniform(10000) )
          } while Set<Character>(result).count < 4
          return result
      }
      func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
          guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential else {
              return
          }
          var socialParams = [String: Any]()
          if let _ = appleIDCredential.email, let _ = appleIDCredential.fullName {
              var status = false
              if KeychainWrapper.standard.set(appleIDCredential.email!, forKey: Keys.email.rawValue) {
                  status = true
              }
              if KeychainWrapper.standard.set(appleIDCredential.fullName?.givenName ?? "Test", forKey: Keys.fname.rawValue) {
                  status = true
              }
              if KeychainWrapper.standard.set(appleIDCredential.fullName?.familyName ?? "Test", forKey: Keys.lname.rawValue) {
                  status = true
              }
              if status {
                  socialParams["firstname"] = appleIDCredential.fullName?.givenName
                  socialParams["lastname"] = appleIDCredential.fullName?.familyName
                  let key = self.fourDigitNumber
                  KeychainWrapper.standard.set(key, forKey: Keys.personID.rawValue)
                  socialParams["email"] = appleIDCredential.email
                  socialParams["pictureURL"] = ""
                  self.result?(socialParams)
              }
          }else {
              //socialParams["wk_token"] = sharedPrefrence.object(forKey:"wk_token");
              socialParams["firstname"] = KeychainWrapper.standard.string(forKey: Keys.fname.rawValue)
              socialParams["lastname"] = KeychainWrapper.standard.string(forKey: Keys.lname.rawValue)
              // socialParams["personId"] = KeychainWrapper.standard.string(forKey: Keys.personID.rawValue)
              socialParams["email"] = KeychainWrapper.standard.string(forKey: Keys.email.rawValue)
              socialParams["pictureURL"] = ""
              self.result?(socialParams)
          }
      }
      
      
      func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
          //   NetworkManager.sharedInstance.showErrorSnackBar(msg: error.localizedDescription)
          print("AppleID Credential failed with error: \(error.localizedDescription)")
      }
  }

  @available(iOS 13.0, *)
  extension AppDelegate: ASAuthorizationControllerPresentationContextProviding {
      func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
          return self.window!
      }
}
