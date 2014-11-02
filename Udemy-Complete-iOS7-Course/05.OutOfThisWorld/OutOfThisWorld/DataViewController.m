//
//  DataViewController.m
//  OutOfThisWorld
//
//  Created by JR on 11/2/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "DataViewController.h"

@implementation DataViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

#pragma mark - UITableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DataCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    /* Use a switch statement to update the cell's properties based on the current row in the TableView. */
    switch (indexPath.row)
    {
        case 0:
            cell.textLabel.text = @"Nickname :";
            cell.detailTextLabel.text = self.planet.nickname;
            break;
        case 1:
            cell.textLabel.text = @"Diameter (km):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.2f", self.planet.diameter];
            break;
        case 2:
            cell.textLabel.text = @"Gravitational Force:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.2f", self.planet.gravitationalForce];
            break;
        case 3:
            cell.textLabel.text = @"Length of a Year (days):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.2f", self.planet.yearLength];
            break;
        case 4:
            cell.textLabel.text = @"Length of a Day (hours):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.2f", self.planet.dayLength];
            break;
        case 5:
            cell.textLabel.text = @"Temperature(celsius):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%.2f", self.planet.temperature];
            break;
        case 6:
            cell.textLabel.text = @"Number of Moons";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%i", self.planet.numberOfMoons];
            break;
        case 7:
            cell.textLabel.text = @"Interesting Fact:";
            cell.detailTextLabel.text = self.planet.interestFact;
            break;
        default:
            break;
    }
    
    return cell;
}

@end
