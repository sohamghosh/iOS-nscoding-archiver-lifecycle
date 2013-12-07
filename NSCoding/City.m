#import "City.h"

@implementation City

- (id)init
{
    self = [super init];
    if (self) {
        self.name = @"Bangalore";
        self.state = @"Karnataka";
        self.population = @"Four point three million";
        self.notes = @"Nice weather. Bad traffic.";
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.state = [aDecoder decodeObjectForKey:@"state"];
        self.population = [aDecoder decodeObjectForKey:@"population"];
        self.notes = [aDecoder decodeObjectForKey:@"notes"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.state forKey:@"state"];
    [aCoder encodeObject:self.population forKey:@"population"];
    [aCoder encodeObject:self.notes forKey:@"notes"];
}

+ (City *) getCity
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[City getPathToArchive]];
}

+ (void) saveCity:(City *) aCity
{
    [NSKeyedArchiver archiveRootObject:aCity toFile:[City getPathToArchive]];
}

+ (NSString *) getPathToArchive
{
    // Accessing the documents folder
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [paths objectAtIndex:0];
    return [docsDir stringByAppendingString:@"city.model"];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"City [\nName: %@,\n State: %@,\n Population: %@,\n Notes: %@\n]",
            self.name, self.state, self.population, self.notes];
}

@end
