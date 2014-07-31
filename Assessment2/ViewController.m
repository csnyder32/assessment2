//
//  ViewController.m
//  Assessment2
//
//  Created by Chris Snyder on 7/31/14.
//  Copyright (c) 2014 Chris Snyder. All rights reserved.
//

#import "ViewController.h"
#import "City.h"
#import "cityViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *cityTableView;

@property (weak, nonatomic) IBOutlet UIButton *onEditButtonPressed;

@end

@implementation ViewController
- (IBAction)onEditButtonSelected:(id)sender
{
    if([self.onEditButtonPressed.currentTitle isEqualToString:@"Edit"]){
        [self.onEditButtonPressed setTitle:@"Done" forState:UIControlStateNormal];
    }else{
        [self.onEditButtonPressed setTitle:@"Edit" forState:UIControlStateNormal];
    }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    City *chicago = [[City alloc]init];
    chicago.city = @"Chicago";
    chicago.state = @"Illinos";
    City *lasvegas = [[City alloc]init];
    lasvegas.city = @"Las Vegas";
    lasvegas.state = @"Nevada";
    City *milwaukee = [[City alloc]init];
    milwaukee.city = @"Milauwkee";
    milwaukee.state = @"Wisconsin";
    City *newyork = [[City alloc]init];
    newyork.city =@"New York";
    newyork.state = @"New York";
    self.cities = [NSMutableArray arrayWithObjects:chicago, lasvegas, milwaukee, newyork, nil];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    City *cityList=[self.cities objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = cityList.city;
    cell.detailTextLabel.text = cityList.state;
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cities.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    if([self.onEditButtonPressed.currentTitle isEqualToString:@"Done"])
    {
        [self.cities removeObject:cell.textLabel.text];
        [self.cities removeObject:cell.detailTextLabel.text];
        [self.cityTableView reloadData];
    }

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *selectedIndexPath = self.cityTableView.indexPathForSelectedRow;
    City *city = [self.cities objectAtIndex:selectedIndexPath.row];
    cityViewController *nextViewController = segue.destinationViewController;
    nextViewController.city = city;

}
@end
