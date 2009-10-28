//
//  ATNDEventUser.m
//  ATNDroid
//
//  Created by 上田 澄博 on 09/10/28.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ATNDEventUser.h"


@implementation ATNDEventUser

@synthesize user_id,nickname,comment,status;

-(NSString*)commentWithName {
	return [NSString stringWithFormat:@"%@: %@", self.nickname, self.comment];
}

@end
