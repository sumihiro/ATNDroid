//
//  ATNDEvent.h
//  ATNDroid
//
//  Created by 上田 澄博 on 09/10/27.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ATNDEvent : NSObject {
	NSString *title;
	NSString *subtitle;
	NSString *description;
	
	NSString *date;
	NSString *limit;
	NSString *place;
	NSString *url;
	NSString *admin;
	
	NSMutableArray *comments;
	NSMutableArray *memberGo;
	NSMutableArray *memberOut;
}

@property (nonatomic,retain) NSString *title;
@property (nonatomic,retain) NSString *subtitle;
@property (nonatomic,retain) NSString *description;

@property (nonatomic,retain) NSString *date;
@property (nonatomic,retain) NSString *limit;
@property (nonatomic,retain) NSString *place;
@property (nonatomic,retain) NSString *url;
@property (nonatomic,retain) NSString *admin;

@property (nonatomic,retain) NSMutableArray *comments;
@property (nonatomic,retain) NSMutableArray *memberGo;
@property (nonatomic,retain) NSMutableArray *memberOut;

- (NSString*)getCommentWithNameAtIndex:(NSInteger)index;

@end
