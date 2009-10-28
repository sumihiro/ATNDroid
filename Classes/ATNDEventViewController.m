//
//  ATNDEventViewController.m
//  ATNDroid
//
//  Created by 上田 澄博 on 09/10/27.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ATNDEventViewController.h"


@implementation ATNDEventViewController

@synthesize event;

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) {
    }
    return self;
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	self.navigationItem.hidesBackButton = NO;
	self.navigationItem.title = [event title];
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 9;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	NSInteger rows = 0;
	switch (section) {
		case 0:
			rows = 2;
			break;
		case 1:
		case 2:
		case 3:
		case 4:
		case 5:
			rows = 1;
			break;

		case 6:
			rows = [[event comments] count];
			break;
			
		case 7:
			rows = [[event memberGo] count];
			break;
			
		case 8:
			rows = [[event memberOut] count];
			break;
			
		default:
			break;
	}
    return rows;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
	cell.textLabel.numberOfLines = 0;
    
    // Set up the cell...
	switch ([indexPath section]) {
		case 0: // title
			switch ([indexPath row]) {
				case 0:
					cell.textLabel.text = [event subtitle];
					break;
				case 1:
					cell.textLabel.text = [event description];
					break;
				default:
					break;
			}
			break;
		case 1: // date
			cell.textLabel.text = @"ここに日付が入る";
			break;
		case 2: // limit
			cell.textLabel.text = [NSString stringWithFormat:@"%d人",[event limit]];
			break;
		case 3: // place
			cell.textLabel.text = [event place];
			break;
		case 4: // url
			cell.textLabel.text = [event url];
			break;
		case 5: // admin
			cell.textLabel.text = [event ownerNickname];
			break;
		case 6: // comments
			cell.textLabel.text = [event getCommentWithNameAtIndex:[indexPath row]];
			break;
		case 7: // memberGo
			cell.textLabel.text = [[[event memberGo] objectAtIndex:[indexPath row]] commentWithName];
			break;
		case 8: // memberOut
			cell.textLabel.text = [[[event memberOut] objectAtIndex:[indexPath row]] commentWithName];
			break;
			
		default:
			break;
	}
	
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	NSString *header;
	switch (section) {
		case 0:
			header = @"イベント概要";
			break;
		case 1:
			header = @"日時";
			break;
		case 2:
			header = @"定員";
			break;
		case 3:
			header = @"会場";
			break;
		case 4:
			header = @"URL";
			break;
		case 5:
			header = @"管理者";
			break;
		case 6:
			header = @"コメント";
			break;
		case 7:
			header = [NSString stringWithFormat:@"%@ (%d人)",@"参加者",[[event memberGo] count]];
			break;
		case 8:
			header = [NSString stringWithFormat:@"%@ (%d人)",@"補欠",[[event memberOut] count]];
			break;
		default:
			header = @"";
			break;
	}
	return header;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
	cell.textLabel.numberOfLines = 0;

	NSString *contentString;
	switch ([indexPath section]) {
		case 0:
			switch ([indexPath row]) {
				case 0:
					contentString = [event subtitle];
					break;
				case 1:
					contentString = [event description];
					break;
				default:
					break;
			}
			break;
		case 1: // date
			contentString = @"ここに日付が入る";
			break;
		case 2: // limit
			contentString = [NSString stringWithFormat:@"%d人",[event limit]];
			break;
		case 3: // place
			contentString = [event place];
			break;
		case 4: // url
			contentString = [event url];
			break;
		case 5: // admin
			contentString = [event ownerNickname];
			break;
		case 6:
			contentString = [event getCommentWithNameAtIndex:[indexPath row]];
			break;
			
		case 7:
			contentString = [[[event memberGo] objectAtIndex:[indexPath row]] commentWithName];
			break;
		case 8:
			contentString = [[[event memberOut] objectAtIndex:[indexPath row]] commentWithName];
			break;
			
		default:
			break;
	}
	CGSize size = [contentString sizeWithFont:[UIFont systemFontOfSize:17.0f] constrainedToSize:CGSizeMake(280, 1000) lineBreakMode:UILineBreakModeWordWrap];
	//CGSize size = [contentString sizeWithFont:[UIFont systemFontOfSize:[UIFont systemFontSize]] constrainedToSize:CGSizeMake(320, 1000) lineBreakMode:UILineBreakModeWordWrap];
	
	
	[cell release];
	
	return size.height + 10;
}

- (void)dealloc {
    [super dealloc];
}


@end

