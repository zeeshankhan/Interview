//
//  Queue.m
//  Interview
//
//  Created by Zeeshan Khan on 5/4/16.
//  Copyright © 2016 Zeeshan. All rights reserved.
//

#import "Queue.h"


@interface Queue()
@property (nonatomic, strong) NSMutableArray <QueueItem*> *items;
@end

@implementation QueueItem
@end

@implementation Queue

- (instancetype)init {

    self = [super init];
    if (self) {
        self.items = [NSMutableArray new];
    }
    return self;
}

- (void)pop {
    QueueItem *object = self.items.firstObject;
    if (object)
        [self.items removeObject:object];
}

- (void)push:(QueueItem *)item {
    if (item)
        [self.items addObject:item];
}

- (QueueItem *)peek {
    return self.items.firstObject;
}

- (BOOL)isEmpty {
    return !self.items.count;
}

@end