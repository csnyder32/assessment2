//
//  cityViewController.m
//  Assessment2
//
//  Created by Chris Snyder on 7/31/14.
//  Copyright (c) 2014 Chris Snyder. All rights reserved.
//

#import "cityViewController.h"


@interface cityViewController ()
@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *state;

@end

@implementation cityViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.name.text = self.city.city;
    self.state.text = self.city.state;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
