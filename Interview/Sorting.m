//
//  Sorting.m
//  Interview
//
//  Created by Zeeshan Khan on 5/5/16.
//  Copyright © 2016 Zeeshan. All rights reserved.
//

#import "Sorting.h"

@implementation Sorting

+ (void)bubbleSort {

    NSMutableArray *array = [@[@6, @5, @3, @1, @8, @7, @2, @4] mutableCopy];
    BOOL isSwaped = YES;
    while (isSwaped) {
        isSwaped = NO;
        for (NSInteger x=1; x<array.count; x++) {
            NSNumber *last = array[x-1];
            NSNumber *first = array[x];
            if (last.integerValue > first.integerValue) {
                isSwaped = YES;
                [array exchangeObjectAtIndex:x withObjectAtIndex:x-1];
            }
        }
    }
}

+ (void)selectionSort {

    NSMutableArray *array = [@[@6, @5, @3, @1, @8, @7, @2, @4] mutableCopy];
    NSInteger smallest = 0;
    NSInteger smallIndex = 0;

    for (int x=0; x<array.count; x++) {

        smallest = [array[x] integerValue];
        smallIndex = x;

        for (int y=x+1; y<array.count; y++) {

            NSInteger next = [array[y] integerValue];
            if (smallest > next) {
                smallest = next;
                smallIndex = y;
            }
        }

        if (smallIndex != x)
            [array exchangeObjectAtIndex:smallIndex withObjectAtIndex:x];
    }
}

+ (void)mergeSort {

    NSArray *array = @[@6, @5, @3, @1, @8, @7, @67, @2, @4, @0, @9, @12, @9, @16, @88];

    NSMutableArray *arrGroup = [NSMutableArray new];
    for (int a=0; a< array.count; a++) {
        NSMutableArray *group = [NSMutableArray new];
        [group addObject:array[a]];
        [arrGroup addObject:group];
    }

    while (arrGroup.count > 1) {

        NSMutableArray *arrNewGroup = [NSMutableArray new];
        for (int x=0; x<arrGroup.count; x = x+2) { //(x+2 < arrGroup.count) ? x+2 : x+1) {

            NSArray *group = [[self class] mergeSortedArray:arrGroup[x] stortedArray:arrGroup.count > x+1 ? arrGroup[x+1] : nil];
            [arrNewGroup addObject:group];

        }
        arrGroup = arrNewGroup;
    }

    NSLog(@"%@", arrGroup);
}

+ (NSArray*)mergeSortedArray:(NSArray*)arr1 stortedArray:(NSArray*)arr2 {
    NSMutableArray *group = [NSMutableArray new];

    NSMutableArray *val1 = arr1.mutableCopy;
    NSMutableArray *val2 = arr2 ? arr2.mutableCopy : nil;

    for (int y=0; y < val1.count; y++) {

        NSNumber *p = val1[y];
        BOOL isPAdded = NO;
        BOOL isDone = NO;

        while (!isDone) {

            if (val2.count > 0) {
                NSNumber *q = val2[0];
                if (p.integerValue < q.integerValue) {
                    isPAdded = YES;
                    isDone = YES;
                    [group addObject:p];
                }
                else {
                    [group addObject:q];
                    [val2 removeObject:q];
                    if (val2.count == 0) isDone = YES;
                }
            }
            else {
                isDone = YES;
            }
        }

        if (!isPAdded) {
            [group addObject:p];
        }
    }

    for (NSNumber *q2 in val2) {
        [group addObject:q2];
    }

    return group.copy;
}

+ (void)quickSort {}
+ (void)insertionSort {}

@end
