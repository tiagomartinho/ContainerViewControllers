import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let navigationVC = UINavigationController(rootViewController: ParentViewController())
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
        return true
    }
}
