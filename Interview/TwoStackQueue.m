//
//  TwoStackQueue.m
//  Interview
//
//  Created by Zeeshan Khan on 5/4/16.
//  Copyright © 2016 Zeeshan. All rights reserved.
//

#import "TwoStackQueue.h"
#import "Stack.h"
#import "Queue.h"

@interface TwoStackQueue()

@property (nonatomic, strong) Stack *s1;
@property (nonatomic, strong) Stack *s2;

@end

@implementation TwoStackQueue

- (instancetype)init {

    self = [super init];
    if (self) {
    }
    return self;
}

- (void)pop {
}

- (void)push:(QueueItem *)item {
}

- (QueueItem *)peek {
    return nil;
}

- (BOOL)isEmpty {
    return YES;
}

@end
