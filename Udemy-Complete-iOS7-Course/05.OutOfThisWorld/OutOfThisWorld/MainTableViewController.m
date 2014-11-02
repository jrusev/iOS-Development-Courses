//
//  MainTableViewController.m
//  OutOfThisWorld
//
//  Created by JR on 11/1/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "MainTableViewController.h"
#import "SpaceObject.h"
#import "AstronomicalData.h"

@implementation MainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.planets = [NSMutableArray array];
    for (NSDictionary *planetData in [AstronomicalData allKnownPlanets]) {
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", planetData[PLANET_NAME]];
        SpaceObject *planet = [[SpaceObject alloc] initWithData:planetData
                                                       andImage:[UIImage imageNamed:imageName]];
        [self.planets addObject:planet];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in a given section of a table view.
    return self.planets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    SpaceObject *planet = self.planets[indexPath.row];
    cell.textLabel.text = planet.name;
    cell.detailTextLabel.text = planet.nickName;
    cell.imageView.image = planet.image;
    
    if (indexPath.row % 2) {
        //cell.backgroundColor = [UIColor colorWithRed:0.9 green:0.3 blue:0.3 alpha:1];
    }
    
    /* Customize the appearence of the TableViewCells. */
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    
    return cell;
}

@end
