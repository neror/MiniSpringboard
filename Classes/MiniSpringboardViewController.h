
@class MiniAppViewController;

@interface MiniSpringboardViewController : UIViewController {
}

@property (nonatomic, retain) IBOutlet MiniAppViewController *activeApp;
@property (nonatomic, retain) IBOutletCollection(UILabel) NSArray *icons;

- (void)quitActiveApp;
- (CGAffineTransform)offscreenQuadrantTransformForView:(UIView *)theView;

@end

