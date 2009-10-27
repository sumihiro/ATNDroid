//
//  EventLoaderIDM.m
//  ATNDroid
//
//  Created by 上田 澄博 on 09/10/27.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "EventCenterIDM.h"
#import "ATNDPageLoader.h"

@implementation EventCenterIDM

- (void) load {
	ATNDPageLoader *loader = [[ATNDPageLoader alloc] initWithURL:[NSURL URLWithString:@"http://atnd.org/events/1920"]];
	[loader loadAndParse];
	self.events = [NSArray arrayWithObject:[loader fetchEvent]];
	[loader release];
}

@end
