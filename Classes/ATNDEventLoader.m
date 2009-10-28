//
//  ATNDEventLoader.m
//  ATNDroid
//
//  Created by 上田 澄博 on 09/10/28.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ATNDEventLoader.h"
#import "XPathQuery.h"
#import "NSDictionary+xmlNode.h"

@implementation ATNDEventLoader

-(ATNDEvent*)loadEvent:(NSString*)eventID {
	ATNDEvent *event = [[[ATNDEvent alloc] init] autorelease];
	
	NSData *eventData;
	
	// API経由 イベント情報
	NSString *eventAPIURL = [NSString stringWithFormat:@"http://api.atnd.org/events/?event_id=%@",eventID];
	eventData = [NSData dataWithContentsOfURL:[NSURL URLWithString:eventAPIURL]];
	NSDictionary *eventDict = [PerformXMLXPathQuery(eventData,@"//event") objectAtIndex:0];
	NSLog(@"Event: %@",eventDict);
	
	event.title = [[eventDict childForTag:@"title"] nodeContent]; 
	event.subtitle = [[eventDict childForTag:@"catch"] nodeContent]; 
	event.description = [[eventDict childForTag:@"description"] nodeContent]; 

	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setTimeStyle:NSDateFormatterFullStyle];
	[dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZ"];

	event.start = [dateFormatter dateFromString:[[eventDict childForTag:@"started-at"] nodeContent]]; 
	event.end = [dateFormatter dateFromString:[[eventDict childForTag:@"ended-at"] nodeContent]]; 
	event.url = [[eventDict childForTag:@"url"] nodeContent]; 
	event.limit = [[[eventDict childForTag:@"limit"] nodeContent] intValue]; 
	event.address = [[eventDict childForTag:@"address"] nodeContent]; 
	event.place = [[eventDict childForTag:@"place"] nodeContent]; 

	event.latitude = [[[eventDict childForTag:@"lat"] nodeContent] doubleValue]; 
	event.longitude = [[[eventDict childForTag:@"lon"] nodeContent] doubleValue]; 

	event.ownerID = [[eventDict childForTag:@"owner_id"] nodeContent]; 
	event.ownerNickname = [[eventDict childForTag:@"owner_nickname"] nodeContent]; 

	event.accepted = [[[eventDict childForTag:@"accepted"] nodeContent] intValue]; 
	event.waiting = [[[eventDict childForTag:@"waiting"] nodeContent] intValue]; 

	event.updated = [[eventDict childForTag:@"updated"] nodeContent]; 

	NSArray *array;
	
	// スクレイピングでコメント取得
	NSString *eventPageURL = [NSString stringWithFormat:@"http://atnd.org/events/%@",eventID];
	eventData = [NSData dataWithContentsOfURL:[NSURL URLWithString:eventPageURL]];

	array = PerformHTMLXPathQuery(eventData, @"//div[@class='comment_entry']");
	//NSLog(@"comments: %@",array);
	
	NSMutableArray *comments = [[NSMutableArray alloc] init];
	for (NSDictionary *comment in array) {
		NSMutableDictionary *com = [[NSMutableDictionary alloc] init];
		[com setObject:[[[comment childForTag:@"h4"] childForTag:@"a"] nodeContent] forKey:@"user"];
		[com setObject:[[comment childForTag:@"p"] nodeContent] forKey:@"comment"];
		[com setObject:[[[comment childForTag:@"h4"] childForTag:@"span"] nodeContent] forKey:@"date"];
		
		[comments addObject:com];
		[com release];
	}
	
	//NSLog(@"comments: %@",comments);
	
	event.comments = comments;
	[comments release];


#if 1
	// スクレイピングで参加者取得
	array = PerformHTMLXPathQuery(eventData, @"//ul[@class='member_name member_go']/li");
	
	NSMutableArray *memberGo = [[NSMutableArray alloc] init];
	for (NSDictionary *member in array) {
		ATNDEventUser *u = [[ATNDEventUser alloc] init];
		u.nickname = [[member childForTag:@"a"] nodeContent];
		NSString *comment = [member nodeContent];
		u.comment = [comment length] > 2 ? [comment substringFromIndex:2] : @"";
		[memberGo addObject:u];
		[u release];
	}
	
	event.memberGo = memberGo;
	[memberGo release];
	
	array = PerformHTMLXPathQuery(eventData, @"//ul[@class='member_name member_over']/li");
	
	NSMutableArray *memberOut = [[NSMutableArray alloc] init];
	for (NSDictionary *member in array) {
		ATNDEventUser *u = [[ATNDEventUser alloc] init];
		u.nickname = [[member childForTag:@"a"] nodeContent];
		NSString *comment = [member nodeContent];
		u.comment = [comment length] > 2 ? [comment substringFromIndex:2] : @"";
		[memberOut addObject:u];
		[u release];
	}
	
	event.memberOut = memberOut;
	[memberOut release];
	
#else

	// API経由 参加者情報
	// こっちはコメントが取れないのが残念
	NSString *eventUserAPIURL = [NSString stringWithFormat:@"http://api.atnd.org/events/users/?event_id=%@",eventID];
	eventData = [NSData dataWithContentsOfURL:[NSURL URLWithString:eventUserAPIURL]];
	NSArray *usersArray = PerformXMLXPathQuery(eventData,@"//users/user");
	
	NSLog(@"users: %@",usersArray);
	NSMutableArray *memberGo = [[NSMutableArray alloc] init];
	NSMutableArray *memberOut = [[NSMutableArray alloc] init];
	for (NSDictionary *user in usersArray) {
		ATNDEventUser *u = [[ATNDEventUser alloc] init];
		u.status = [[[user childForTag:@"status"] nodeContent] boolValue];
		u.nickname = [[user childForTag:@"nickname"] nodeContent];
		u.user_id = [[user childForTag:@"user_id"] nodeContent];
		if (u.status) {
			[memberGo addObject:u];
		} else {
			[memberOut addObject:u];
		}
		[u release];
	}
	event.memberGo = memberGo;
	event.memberOut = memberOut;
	
	[memberGo release];
	[memberOut release];

#endif
	
	
	
	return event;
}



@end
