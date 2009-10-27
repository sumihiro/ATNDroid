//
//  ATNDPageLoader.m
//  ATNDroid
//
//  Created by 上田 澄博 on 09/10/27.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ATNDPageLoader.h"
#import "NSDictionary+xmlNode.h"
#import "XPathQuery.h"

@implementation ATNDPageLoader

- (void)loadAndParse {
	[super loadAndParse];
	
}

-(ATNDEvent*)fetchEvent {
	
	ATNDEvent *event = [[[ATNDEvent alloc] init] autorelease];
	
	NSArray *array;
	array = PerformHTMLXPathQuery(contentData, @"//div[@id='main_title']/h1[@class='summary']");
	event.title = [[array objectAtIndex:0] nodeContent];
	
	array = PerformHTMLXPathQuery(contentData, @"//div[@id='main_title']/p");
	event.subtitle = [[array objectAtIndex:0] nodeContent];
	
	array = PerformHTMLXPathQuery(contentData, @"//div[@id='events_show_contents']/div[@class='description']");
	event.description = [[array objectAtIndex:0] nodeContent];
	
	array = PerformHTMLXPathQuery(contentData, @"//div[@class='info_layout']/dl[@class='heightLineParent']/dd");
	event.date = [[array objectAtIndex:0] nodeContentWithChild];
	event.limit = [[array objectAtIndex:1] nodeContent];
	event.place = [[array objectAtIndex:2] nodeContent];
	event.url = [[array objectAtIndex:3] nodeContent];
	event.admin = [[array objectAtIndex:4] nodeContent];
	
	array = PerformHTMLXPathQuery(contentData, @"//div[@class='comment_entry']");
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
	
	NSLog(@"comments: %@",comments);
	
	event.comments = comments;
	[comments release];
	
	array = PerformHTMLXPathQuery(contentData, @"//ul[@class='member_name member_go']/li");

	NSLog(@"memberGo array: %@",array);

	NSMutableArray *memberGo = [[NSMutableArray alloc] init];
	for (NSDictionary *member in array) {
		[memberGo addObject:[NSString stringWithFormat:@"%@%@",[[member childForTag:@"a"] nodeContent],[member nodeContent]]];
	}
	
	NSLog(@"memberGo: %@",memberGo);
	
	event.memberGo = memberGo;
	[memberGo release];
	
	array = PerformHTMLXPathQuery(contentData, @"//ul[@class='member_name member_over']/li");
	
	NSMutableArray *memberOut = [[NSMutableArray alloc] init];
	for (NSDictionary *member in array) {
	[memberOut addObject:[NSString stringWithFormat:@"%@%@",[[member childForTag:@"a"] nodeContent],[member nodeContent]]];	}
	
	NSLog(@"memberOut: %@",memberOut);
	
	event.memberOut = memberOut;
	[memberOut release];
	
	return event;
}

@end
