//
//  ATNDEventLoader.h
//  ATNDroid
//
//  Created by 上田 澄博 on 09/10/28.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ATNDEvent.h"

@interface ATNDEventLoader : NSObject {

}

-(ATNDEvent*)loadEvent:(NSString*)eventID;

@end
