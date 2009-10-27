//
//  ATNDPageLoader.h
//  ATNDroid
//
//  Created by 上田 澄博 on 09/10/27.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PageLoader.h"
#import "ATNDEvent.h"

@interface ATNDPageLoader : PageLoader {

}

-(ATNDEvent*)fetchEvent;

@end
