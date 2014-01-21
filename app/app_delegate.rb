class AppDelegate
  include CDQ
  include Seeds
  include ObserveEvents

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    if BITHockeyManagerLauncher.new.start
      BITHockeyManager.sharedHockeyManager.authenticator.authenticateInstallation
    end
    cdq.setup
    cdq.reset!
    observe_events(cdq.contexts.current)
    seed

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    @all_chat       = AllChatController.alloc.init
    @all_chat.title = "All Chat"
    @all_chat_nav   = UINavigationController.alloc.initWithRootViewController(@all_chat)

    @hourly       = HourlyController.alloc.init
    @hourly.title = "Hourly"
    @hourly_nav   = UINavigationController.alloc.initWithRootViewController(@hourly)

    @daily       = DailyController.alloc.init
    @daily.title = "Daily"
    @daily_nav   = UINavigationController.alloc.initWithRootViewController(@daily)

    @tab_controller = UITabBarController.alloc.initWithNibName(nil, bundle: nil)
    @tab_controller.viewControllers = [@all_chat_nav, @hourly_nav, @daily_nav]
    
    @window.rootViewController = @tab_controller

    true
  end
end