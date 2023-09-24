//made by maxiwee without heart 

#import <UIKit/UIKit.h>
#import <Preferences/Preferences.h>

@interface _UINavigationBarLargeTitleView : UIView
@end

@interface _UIPageControlIndicatorContentView : UIView
@end

@interface SBIconBadgeView : UIView
@end

@interface SBIconView : UIView
- (void)setLabelHidden:(BOOL)arg1;
@end

@interface SBDockView : UIView
@property (nonatomic, retain) UIView *backgroundView;
@end

@interface CSFocusActivityView : UIView
@end

@interface CSQuickActionsView : UIView
@end



%hook _UINavigationBarLargeTitleView

- (void)layoutSubviews {
    %orig;
    self.hidden = YES;
}

%end

%hook _UIPageControlIndicatorContentView

- (void)didMoveToWindow {
    %orig;
    self.hidden = YES;
}

%end


%hook SBIconView 
-(void)setLabelHidden:(BOOL)arg1 {
    return %orig(YES);
}
%end


%hook MTLumaDodgePillSettings

-(void)setMinWidth:(double)arg1  { 
	%orig(0);
}

%end

%hook CSFocusActivityView

- (void)didMoveToWindow {
    %orig;
    [self removeFromSuperview];
}

%end

%hook CSQuickActionsView

- (void)didMoveToWindow {
    %orig;
    self.hidden = YES;
}

%end

%hook SBDockView 

- (void) didMoveToWindow {

	%orig;

	UIView *bgView = MSHookIvar<UIView *>(self, "_backgroundView");

	bgView.hidden = YES;

}

%end
