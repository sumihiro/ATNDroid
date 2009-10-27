//
//  PageLoader.h
//  ATNDroid
//
//  Created by 上田 澄博 on 09/10/27.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PageLoader : NSObject {
	NSURL *targetURL;
	NSData *contentData;
}

@property (nonatomic,retain) NSURL *targetURL;
@property (nonatomic,retain) NSData *contentData;

- (void)loadAndParse;

@end
