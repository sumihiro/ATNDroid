//
//  ATNDroidAppDelegate.h
//  ATNDroid
//
//  Created by 上田 澄博 on 09/10/27.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

@interface ATNDroidAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

