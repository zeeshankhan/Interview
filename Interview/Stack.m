//
//  Stack.m
//  Interview
//
//  Created by Zeeshan Khan on 5/4/16.
//  Copyright © 2016 Zeeshan. All rights reserved.
//

#import "Stack.h"

@implementation StackItem
@end

@interface Stack()
@property (nonatomic, strong) NSMutableArray <StackItem*> *items;
@end

@implementation Stack

- (instancetype)init {
    self = [super init];
    if (self) {
        self.items = [NSMutableArray new];
    }
    return self;
}

- (void)pop {
    StackItem *object = self.items.lastObject;
    if (object)
        [self.items removeObject:object];
}

- (void)push:(StackItem*)item {
    [self.items addObject:item];
}

- (StackItem*)peek {
    return self.items.lastObject;
}

- (BOOL)isEmpty {
    return !self.items.count;
}

@end

@implementation StackIQ

+ (Stack*)sortStack:(Stack*)stack {
    return nil;
}

@end