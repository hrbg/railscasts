class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = MainController.alloc.init
    rootViewController.title = 'railscasts'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    true
  end
end
