//
//  ATNDEventViewController.h
//  ATNDroid
//
//  Created by 上田 澄博 on 09/10/27.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATNDEvent.h"

@interface ATNDEventViewController : UITableViewController {
	ATNDEvent *event;
}

@property (nonatomic,retain) ATNDEvent *event;
@end
