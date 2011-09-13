#import "MiniSpringboardAppDelegate.h"
#import "MiniSpringboardViewController.h"

@implementation MiniSpringboardAppDelegate

@synthesize window;
@synthesize viewController;

- (void)dealloc {
  [viewController release];
  [window release];
  [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
  [self.window addSubview:viewController.view];
  [self.window makeKeyAndVisible];
  return YES;
}

@end
