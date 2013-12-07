#import "ViewController.h"
#import "City.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor grayColor];
    
    City *city = [[City alloc] init];
    NSLog(@"\nInitial city - %@", city);
    
    city.state = @"KA";
    
    [City saveCity:city];
    
    NSLog(@"\nUnarchived city - %@", [City getCity]);
}


@end
