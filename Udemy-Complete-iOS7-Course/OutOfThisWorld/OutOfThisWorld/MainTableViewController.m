//
//  MainTableViewController.m
//  OutOfThisWorld
//
//  Created by JR on 11/1/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "MainTableViewController.h"

@implementation MainTableViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in a given section of a table view.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = @"My first table view controller";
    
    return cell;
}

@end
