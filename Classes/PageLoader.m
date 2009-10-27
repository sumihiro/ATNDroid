//
//  PageLoader.m
//  ATNDroid
//
//  Created by 上田 澄博 on 09/10/27.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PageLoader.h"
#import "XPathQuery.h"


@implementation PageLoader

@synthesize targetURL,contentData;

- (id) initWithURL:(NSURL*)URL {
	self = [super init];
	if (self != nil) {
		self.targetURL = URL;
	}
	return self;
}

- (void)loadAndParse {
	self.contentData = [NSData dataWithContentsOfURL:targetURL];
}

- (void) dealloc {
	[targetURL release];
	
	[super dealloc];
}


@end
