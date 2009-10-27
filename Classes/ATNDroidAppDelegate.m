//
//  ATNDroidAppDelegate.m
//  ATNDroid
//
//  Created by 上田 澄博 on 09/10/27.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "ATNDroidAppDelegate.h"
#import "RootViewController.h"
#import "ATNDPageLoader.h"


@implementation ATNDroidAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
	
	
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

