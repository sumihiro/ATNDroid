//
//  EventCenter.h
//  ATNDroid
//
//  Created by 上田 澄博 on 09/10/27.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface EventCenter : NSObject {
	NSMutableArray *events;
}

@property (nonatomic,retain) NSMutableArray *events;

- (void) load;

@end
