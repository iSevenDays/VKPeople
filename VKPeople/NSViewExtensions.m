
#import "NSObjectExtensions.h"


static const char *const MCViewControllerKey = "MCViewControllerKey";


@implementation NSView (MCExtensions)

- (NSViewController *)viewController {
    return objc_getAssociatedObject(self, MCViewControllerKey);
}

- (void)setViewController:(NSViewController *)newController {
    NSResponder *oldControllerNextResponder = self.viewController.nextResponder;
    NSViewController *oldController = self.viewController;

    // Set associated object to nil, so that the setNextResponder: method effectively just calls
    // the original implementation.
    objc_setAssociatedObject(self, MCViewControllerKey, nil, OBJC_ASSOCIATION_RETAIN);

    if( oldController ){
        [self setNextResponder:oldControllerNextResponder];
        [oldController setNextResponder:nil];
    }

    if( newController ){
        NSResponder *ownNextResponder = [self nextResponder];
        [self setNextResponder:newController];
        [newController setNextResponder:ownNextResponder];
    }

    objc_setAssociatedObject(self, MCViewControllerKey, newController, OBJC_ASSOCIATION_RETAIN);
}

- (void)setNextResponder:(NSResponder *)newNextResponder {
    if( self.viewController ){
        [self.viewController setNextResponder:newNextResponder];
        return;
    }

    invokeSupersequent(newNextResponder); // This calls the original setNextResponder: method
}

@end
