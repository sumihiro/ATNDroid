//
//  ATNDEventUser.h
//  ATNDroid
//
//  Created by 上田 澄博 on 09/10/28.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ATNDEventUser : NSObject {
	NSString *user_id;
	NSString *nickname;
	NSString *comment;
	BOOL status;
}

@property (nonatomic,retain) NSString *user_id;
@property (nonatomic,retain) NSString *nickname;
@property (nonatomic,retain) NSString *comment;
@property (readwrite) BOOL status;

-(NSString*)commentWithName;

@end
