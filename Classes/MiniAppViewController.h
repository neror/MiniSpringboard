
@class MiniSpringboardViewController;

@interface MiniAppViewController : UIViewController {
}

@property (nonatomic, copy) NSString *appName;
@property (nonatomic, retain) IBOutlet UILabel *appLabel;

@property (assign) IBOutlet MiniSpringboardViewController *springboard;

- (IBAction)quitApp;

@end
