//
//  ViewController.m
//  MansBestFriend
//
//  Created by JR on 11/1/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import "ViewController.h"
#import "MBFDog.h"

@interface ViewController ()

@end

@implementation ViewController {
    int _currentDogIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
    NSArray *data = @[
                     [MBFDog dogWithName:@"Nana"
                                   breed:@"St. Bernard"
                                   image:[UIImage imageNamed:@"St.Bernard.JPG"]],
                     [MBFDog dogWithName:@"Wishborne"
                                   breed:@"Jack Russel Terrier"
                                   image:[UIImage imageNamed:@"JRT.jpg"]],
                     [MBFDog dogWithName:@"Lassie"
                                   breed:@"Collie"
                                   image:[UIImage imageNamed:@"BorderCollie.jpg"]],
                     [MBFDog dogWithName:@"Angel"
                                   breed:@"Greyhound"
                                   image:[UIImage imageNamed:@"ItalianGreyhound.jpg"]]
                     
                     ];
 
    self.dogs = [NSMutableArray arrayWithArray:data];
    _currentDogIndex = 0;
    
    MBFDog *myDog = self.dogs[_currentDogIndex];
    self.nameLabel.text = myDog.name;
    self.breedLabel.text = myDog.breed;
    self.myImageView.image = myDog.image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextDogButtonPressed:(id)sender {
    _currentDogIndex = (_currentDogIndex + 1) >= self.dogs.count ? 0 : _currentDogIndex + 1;
    MBFDog *newDog = self.dogs[_currentDogIndex];
    
//    self.myImageView.image = newDog.image;
//    self.nameLabel.text = newDog.name;
//    self.breedLabel.text = newDog.breed;
    
    [UIView transitionWithView:self.view
                      duration:0.5
                       options:UIViewAnimationOptionTransitionCrossDissolve
     animations:^{
         self.myImageView.image = newDog.image;
         self.nameLabel.text = newDog.name;
         self.breedLabel.text = newDog.breed;
    } completion:^(BOOL finished) {
    }];
}

@end
