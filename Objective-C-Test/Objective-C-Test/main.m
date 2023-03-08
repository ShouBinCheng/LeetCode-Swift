//
//  main.m
//  Objective-C-Test
//
//  Created by 程守斌 on 2023/3/2.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@end

@implementation Person

@end

@interface Person (Hello1)
@end
@implementation Person (Hello1)

- (void)hello01 {
    NSLog(@"Person hello01");
}
+ (void)hello01 {
    NSLog(@"Person hello01");
}

@end

@interface Person (Hello2)

@end
@implementation Person (Hello2)
- (void)hello02 {
    NSLog(@"Person hello02");
}
+ (void)hello02 {
    NSLog(@"Person hello02");
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] init];
    }
    return 0;
}
