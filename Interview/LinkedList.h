//
//  LinkedList.h
//
//  Created by Stephen Lardieri on 9/2/15.
//  Copyright © 2015 Stephen Lardieri. All rights reserved.
//
#import <Foundation/Foundation.h>

@class LinkedListNode;

@protocol SettableNodePointer <NSObject>

@property (strong, nonatomic, readwrite) LinkedListNode * node;

@end

@interface LinkedListNode : NSObject <SettableNodePointer>

@property (strong, nonatomic) id value;
@property (strong, nonatomic) LinkedListNode * next;

- (instancetype) initWithValue: (id) value;

@end

@interface LinkedList : NSObject

- (void) addValueToHead: (id) value;
- (void) addValueToTail: (id) value;
- (void) removeValue: (id) value;

+ (void) testList;

@end

