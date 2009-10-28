//
//  ATNDEvent.h
//  ATNDroid
//
//  Created by 上田 澄博 on 09/10/27.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

#import "ATNDEventUser.h"

@interface ATNDEvent : NSObject {
	NSString *title;
	NSString *subtitle;
	NSString *description;
	
	NSDate *start;
	NSDate *end;
	NSString *url;
	NSInteger limit;
	NSString *address;
	NSString *place;

	CLLocationDegrees latitude;
	CLLocationDegrees longitude;
	
	NSString *ownerID;
	NSString *ownerNickname;
	
	NSInteger accepted;
	NSInteger waiting;
	
	NSString *updated;
	
	NSMutableArray *comments;
	NSMutableArray *memberGo;
	NSMutableArray *memberOut;
}

@property (nonatomic,retain) NSString *title;
@property (nonatomic,retain) NSString *subtitle;
@property (nonatomic,retain) NSString *description;

@property (nonatomic,retain) NSDate *start;
@property (nonatomic,retain) NSDate *end;
@property (nonatomic,retain) NSString *url;
@property (readwrite) NSInteger limit;
@property (nonatomic,retain) NSString *address;
@property (nonatomic,retain) NSString *place;

@property (readwrite) CLLocationDegrees latitude;
@property (readwrite) CLLocationDegrees longitude;

@property (nonatomic,retain) NSString *ownerID;
@property (nonatomic,retain) NSString *ownerNickname;

@property (readwrite) NSInteger accepted;
@property (readwrite) NSInteger waiting;

@property (nonatomic,retain) NSString *updated;

@property (nonatomic,retain) NSMutableArray *comments;
@property (nonatomic,retain) NSMutableArray *memberGo;
@property (nonatomic,retain) NSMutableArray *memberOut;

- (NSString*)getCommentWithNameAtIndex:(NSInteger)index;

@end
