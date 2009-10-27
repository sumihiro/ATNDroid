//
//  EventCenter.m
//  ATNDroid
//
//  Created by 上田 澄博 on 09/10/27.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "EventCenter.h"


@implementation EventCenter

@synthesize events;


- (id) init {
	self = [super init];
	if (self != nil) {
		events = [[NSMutableArray alloc] init];
	}
	return self;
}

- (void) load {
	// dummy
}

- (void) dealloc {
	[events release];
	[super dealloc];
}

@end
