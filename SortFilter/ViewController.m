//
//  ViewController.m
//  SortFilter
//
//  Created by Matt Long on 5/2/15.
//  Copyright (c) 2015 SkyeMark, LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, retain) NSDictionary *items;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.items = @{ @"Veggies" : @[@"Cucumbers", @"Carrots", @"Celery", @"Romain"],
                    @"Fruits" : @[@"Apples", @"Bananas", @"Cherries", @"Pomagranate"] };


    NSArray *veggies = self.items[@"Veggies"];

    NSArray *fruits = self.items[@"Fruits"];

    NSArray *filtered = [veggies filteredArrayUsingPredicate:
                         [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] %@", @"c"]];
    
    NSArray *sorted = [filtered sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES]]];

    NSLog(@"%@", sorted);
    
    NSArray *combined = @[veggies, veggies.copy];
 
    NSArray *unionOfObjects = [combined valueForKeyPath:@"@unionOfArrays.self"];
    
    NSArray *distinctUnionOfObjects = [combined valueForKeyPath:@"@distinctUnionOfArrays.self"];
    
    NSArray *max = [veggies valueForKeyPath:@"@max.self"];
    
    NSLog(@"Union: %@", unionOfObjects);
    NSLog(@"Distinct Union: %@", distinctUnionOfObjects);
    NSLog(@"Max: %@", max);
    
}

@end
