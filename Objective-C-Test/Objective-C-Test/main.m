//
//  main.m
//  Objective-C-Test
//
//  Created by 程守斌 on 2023/3/2.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

@interface Person : NSObject {
    @public
    int _age;
    double no;  /// <- 长类型夹中间
    int _a1;
    double no1;  /// <- 长类型夹中间
    int _a2;
    double no2;  /// <- 长类型夹中间
    int _a3;
    double no3;  /// <- 长类型夹中间
    int _a4;
    double no4;  /// <- 长类型夹中间
    int _a5;
    double no5;  /// <- 长类型夹中间
    int _a6;
}
@end
@implementation Person
@end
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] init];
        p->_age = 1; p->_a1 = 1; p->_a2 = 1; p->_a3 = 1; p->_a4 = 1; p->_a5 = 1; p->_a6 = 1;
        p->no = 2; p->no1 = 2; p->no2 = 2; p->no3 = 2; p->no4 = 2; p->no5 = 2;
        /// 获得 obj 指针指向内存的大小
        /// (__bridge const void *) (obj )
        NSLog(@"malloc size:%zd", malloc_size((__bridge const void *)(p)));
        /// 获取 NSObject 累的实例对象的大小
        NSLog(@"use size:%zd", class_getInstanceSize([Person class]));
    }
    return 0;
}
