//
//  NSDictionary+xmlNode.h
//  ATNDroid
//
//  Created by 上田 澄博 on 09/10/27.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary (xmlNode)

- (id)childForTag:(NSString*)key;
- (NSString*)attrForKey:(NSString*)key;
- (NSString*)nodeContent;
- (NSString*)nodeContentWithChild;

@end
