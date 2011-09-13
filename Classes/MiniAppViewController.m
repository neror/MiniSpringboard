#import "MiniAppViewController.h"
#import "MiniSpringboardViewController.h"

@implementation MiniAppViewController

@synthesize appLabel;
@synthesize appName;
@synthesize springboard;

- (void)dealloc {
  [appName release];
  [appLabel release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.appLabel.text = self.appName;
  UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchClosed:)];
  [self.view addGestureRecognizer:pinch];
  [pinch release];
}

- (void)viewDidUnload {
  [self.view removeGestureRecognizer:[self.view.gestureRecognizers lastObject]];
  [super viewDidLoad];
}

- (void)pinchClosed:(UIPinchGestureRecognizer *)recognizer {
  switch (recognizer.state) {
    case UIGestureRecognizerStateBegan:
    case UIGestureRecognizerStateChanged: {
      recognizer.scale = fminf(recognizer.scale, 1.f);
      self.view.transform = CGAffineTransformMakeScale(recognizer.scale, recognizer.scale);
      for (UIView *icon in self.springboard.icons) {
        CGAffineTransform xform = [self.springboard offscreenQuadrantTransformForView:icon];
        xform.tx *= recognizer.scale;
        xform.ty *= recognizer.scale;
        icon.transform = xform;
        icon.alpha = 1.f - recognizer.scale;
      }
      break;
    }
    case UIGestureRecognizerStateEnded: {
      if(recognizer.scale < .5f) {
        [self.springboard quitActiveApp];
      } else {
        [UIView animateWithDuration:.3f animations:^{
          self.view.transform = CGAffineTransformIdentity;
          for (UIView *icon in self.springboard.icons) {
            icon.transform = [self.springboard offscreenQuadrantTransformForView:icon];
            icon.alpha = 0.f;
          }
        }];
      }
      break;
    }
    default:
      break;
  }
}

- (void)setAppName:(NSString *)name {
  [appName autorelease];
  appName = [name copy];
  self.appLabel.text = name;
}

- (void)quitApp {
  [self.springboard quitActiveApp];
}

@end
