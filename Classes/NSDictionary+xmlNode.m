//
//  NSDictionary+xmlNode.m
//  ATNDroid
//
//  Created by 上田 澄博 on 09/10/27.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NSDictionary+xmlNode.h"


@implementation NSDictionary (xmlNode)

- (id)childForTag:(NSString*)key {
	NSArray *children = [self objectForKey:@"nodeChildArray"];
	for (NSDictionary *child in children) {
		if([[child objectForKey:@"nodeName"] isEqualToString:key]) {
			return child;
		}
	}
	return nil;
}

- (NSString*)attrForKey:(NSString*)key {
	NSArray *children = [self objectForKey:@"nodeAttributeArray"];
	for (NSDictionary *child in children) {
		if([[child objectForKey:@"attributeName"] isEqualToString:key]) {
			return [child objectForKey:@"nodeContent"];
		}
	}
	return nil;
}

- (NSString*)nodeContent {
	return [self objectForKey:@"nodeContent"];
}

- (NSString*)nodeContentWithChild {
	NSString *str = @"";
	
	NSArray *keys = [self allKeys];
	for (NSString *key in keys) {
		if([key isEqualToString:@"nodeContent"]) {
			str = [NSString stringWithFormat:@"%@%@",str,[self objectForKey:@"nodeContent"]];
		} else if([key isEqualToString:@"nodeChildArray"]) {
			for (NSDictionary *node in [self objectForKey:@"nodeChildArray"]) {
				str = [NSString stringWithFormat:@"%@%@",str,[node nodeContentWithChild]];
			}
		}
	}
	return str;
}


@end
