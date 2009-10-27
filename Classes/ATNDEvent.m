//
//  ATNDEvent.m
//  ATNDroid
//
//  Created by 上田 澄博 on 09/10/27.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ATNDEvent.h"


@implementation ATNDEvent

@synthesize title,subtitle,description,comments;
@synthesize date,limit,place,url,admin;
@synthesize memberGo,memberOut;

- (NSString*)getCommentWithNameAtIndex:(NSInteger)index {
	return [NSString stringWithFormat:@"%@ - %@ %@",[[comments objectAtIndex:index] objectForKey:@"comment"],[[comments objectAtIndex:index] objectForKey:@"user"],[[comments objectAtIndex:index] objectForKey:@"date"]];
}

@end
