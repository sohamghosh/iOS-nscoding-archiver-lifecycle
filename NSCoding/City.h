#import <Foundation/Foundation.h>

@interface City : NSObject <NSCoding>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *state;
@property (strong, nonatomic) NSString *population;
@property (strong, nonatomic) NSString *notes;

+ (City *) getCity;
+ (void) saveCity:(City *) aCity;

+ (NSString *) getPathToArchive;

@end
