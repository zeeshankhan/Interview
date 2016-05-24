//
//  Arrays.m
//  Interview
//
//  Created by Zeeshan Khan on 5/4/16.
//  Copyright © 2016 Zeeshan. All rights reserved.
//

#import "Arrays.h"

@implementation Arrays

+ (void)maxProductSubarray {

//    NSArray *array = @[@6, @(-3), @(-10), @0, @2];  //@5, @0, @6, @7, @8, @8];
//    NSArray *array = @[@(-1), @(-3), @(-10), @0, @60];
//    NSArray *array = @[@(-2), @(-3), @(0), @(-2), @(40)];
//    NSArray *array = @[@(-2), @(0), @(-1)];
    NSArray *array = @[@(-2), @(1)];
    NSInteger maxProduct = 0;
    NSInteger currentProduct = 0;

    for (NSInteger x=0; x<array.count; x++) {

        currentProduct = [array[x] integerValue];
        if (x==0)
            maxProduct = currentProduct;
        else if (currentProduct == 0) {
            maxProduct = currentProduct > maxProduct ? currentProduct : maxProduct;
            continue;
        }
        else {
            maxProduct = currentProduct > maxProduct ? currentProduct : maxProduct;
        }

        for (NSInteger y=x+1; y<array.count; y++) {

            NSInteger nextVal = [array[y] integerValue];
            if (nextVal == 0)
                break;
            else {
                currentProduct = currentProduct * nextVal;
                maxProduct = currentProduct > maxProduct ? currentProduct : maxProduct;
            }
        }
    }

    NSLog(@"Max Product: %d", (int)maxProduct);
}

+ (void)pascalTriangle {

    NSInteger count = 7;

    NSMutableArray *fullArray = [NSMutableArray new];
    NSArray *lastArray = nil;

    for (NSInteger i=0; i < count; i++) {

        NSMutableArray *temp = [NSMutableArray new];

        NSInteger lastVal = 0;
        if (lastArray) {
            for (NSInteger j=0; j < lastArray.count; j++) {
                NSInteger val = [lastArray[j] integerValue];
                [temp addObject:@(lastVal + val)];
                lastVal = val;
            }
        }

        [temp addObject:@1];

        lastArray = [NSArray arrayWithArray:temp];
        [fullArray addObject:temp];
    }

    NSLog(@"Pascal Triangle: %@", fullArray);
}

+ (void)largestNumber {

    NSArray *array = @[@54, @546, @549, @60];
    NSString *last = 0;
    for (NSNumber *num in array) {
        if (!last)
            last = num.stringValue;
        else {
            NSInteger new = num.integerValue;
            NSInteger old = last.integerValue;
            NSString *str1 = [NSString stringWithFormat:@"%ld%ld", (long)new, (long)old];
            NSString *str2 = [NSString stringWithFormat:@"%ld%ld", (long)old, (long)new];
            if (str1.integerValue > str2.integerValue)
                last = str1;
            else
                last = str2;
        }
    }

    NSLog(@"Largest num: %@", last);
}

+ (void)matrixZeros {

    NSArray *row1 = @[@1, @1, @1];
    NSArray *row2 = @[@0, @1, @1];
    NSArray *row3 = @[@1, @1, @1];

    NSArray *arrRows = @[row1, row2, row3];

    NSMutableArray *final = [arrRows mutableCopy];
    NSInteger rowCount = arrRows.count;
    //    NSInteger columnCount = row1.count;


    //    NSMutableArray *newRows = [NSMutableArray new];
    NSInteger colIndx = -1;
    for (NSInteger i=0; i<rowCount; i++) {

        NSArray *row = arrRows[i];
        NSInteger newRowVal = 1;
        for (NSInteger j=0; j<row.count; j++) {
            newRowVal = newRowVal * [row[j] integerValue];
            if ([row[j] integerValue] == 0) colIndx = j;
        }

        NSMutableArray *newRo = [NSMutableArray new];
        for (NSInteger j=0; j<row.count; j++) {
            if (colIndx == j) {
                [newRo addObject:@0];
            }
            else
                [newRo addObject:@(newRowVal)];
        }
        [final replaceObjectAtIndex:i withObject:newRo];

    }

    NSLog(@"%@", final);
    //    for (NSInteger i=0; i<column; i++) {
    //
    //        for (NSInteger j=0; j<rows; j++) {
    //            // M[i][j] = M[i][j] * row[i] * column[j];
    //
    ////            NSInteger r = arrRows[i]
    //        }
    //
    //    }

    //    for (NSInteger i=0; i<rows.count; i++) {
    //        NSArray *row = rows[i];
    //
    //        NSMutableArray *rowNew = [row mutableCopy];
    //        NSInteger colIndex = -1;
    //        for (NSInteger j=0; j<row.count; j++) {
    //
    //            NSInteger val = [row[j] integerValue];
    //            if (val == 0) {
    //                colIndex = j;
    //                [rowNew removeAllObjects];
    //                for (int x=0; x<row.count; x++) {
    //                    [rowNew addObject:@0];
    //                }
    //                break;
    //            }
    //        }
    //        [final addObject:rowNew];
    //
    //    }

}

+ (void)missingAndRepeatingElement {

    NSArray *array = @[@4, @1, @2, @5, @3, @6, @7, @8, @8];
    NSMutableDictionary *dict = [@{} mutableCopy];

    NSInteger repeat = 0;
    NSInteger total = 0;
    for (NSInteger i=0; i < array.count; i++) {
        NSNumber *key = array[i];
        NSInteger q = [[dict objectForKey:key] integerValue];
        if (q == 0) [dict setObject:@1 forKey:key];
        else repeat = key.integerValue;
        total = key.integerValue + total;
    }

    NSInteger actualTotal = (array.count * (array.count + 1)) / 2;
    NSInteger missing = actualTotal - (total - repeat);
    NSLog(@"%d %d", (int)repeat, (int)missing);
}

+ (void)spiralMatrixII {

    // Given an integer n, generate a square matrix filled with elements from 1 to n2 in spiral order.

    NSInteger number = 4;

    NSInteger rows = number;
    NSInteger column = number;
    NSInteger dir = 0; // 0, 1, 2, 3
    NSInteger top = 0;
    NSInteger bottom = rows-1;
    NSInteger left = 0;
    NSInteger right = column-1;

    NSInteger current = 0;

    NSMutableArray *thressDAray = [NSMutableArray new];
    for (int x=0; x < number; x++) {
        NSMutableArray *spiral = [NSMutableArray new];
        for (int y=0; y < number; y++) {
            [spiral addObject:@0];
        }
        [thressDAray addObject:spiral];
    }

    while (top <= bottom && left <= right) {

        if (dir == 0) { // Left -> Right

            NSMutableArray *arr = [thressDAray[top] mutableCopy];
            for (NSInteger i=left; i <= right; i++) {
                [arr replaceObjectAtIndex:i withObject:@(++current)];
            }
            [thressDAray replaceObjectAtIndex:top withObject:arr];

            top++;
            dir = 1;
        }
        else if (dir == 1) { // Top -> Bottom

            for (NSInteger i=top; i <= bottom; i++) {
                NSMutableArray *arr = [thressDAray[i] mutableCopy];
                [arr replaceObjectAtIndex:right withObject:@(++current)];
                [thressDAray replaceObjectAtIndex:i withObject:arr];
            }

            right--;
            dir = 2;
        }
        else if (dir == 2) { // Right -> Left

            NSMutableArray *arr = [thressDAray[bottom] mutableCopy];
            for (NSInteger i=right; i >= left; i--) {
                [arr replaceObjectAtIndex:i withObject:@(++current)];
            }
            [thressDAray replaceObjectAtIndex:bottom withObject:arr];


            bottom--;
            dir = 3;
        }
        else {  // Bottom to Top

            for (NSInteger i=bottom; i >= top; i--) {
                NSMutableArray *arr = [thressDAray[i] mutableCopy];
                [arr replaceObjectAtIndex:left withObject:@(++current)];
                [thressDAray replaceObjectAtIndex:i withObject:arr];

            }

            left++;
            dir = 0;
        }
    }

    NSLog(@"Spiral Matrix II: %@", thressDAray);
}

+ (void)spiralMatrix {

    NSArray *row1 = @[@1, @2, @3, @4, @5];
    NSArray *row2 = @[@6, @7, @8, @9, @10];
    NSArray *row3 = @[@11, @12, @13, @14, @15];
    NSArray *row4 = @[@16, @17, @18, @19, @20];
    NSArray *row5 = @[@21, @22, @23, @24, @25];
    NSArray *row6 = @[@26, @27, @28, @29, @30];

    NSArray *thressDAray = @[row1, row2, row3, row4, row5, row6];

    NSInteger rows = thressDAray.count;
    NSInteger column = row1.count;
    NSInteger dir = 0; // 0, 1, 2, 3
    NSInteger top = 0;
    NSInteger bottom = rows-1;
    NSInteger left = 0;
    NSInteger right = column-1;

    NSMutableArray *spiral = [NSMutableArray new];

    while (top <= bottom && left <= right) {

        if (dir == 0) { // Left -> Right

            NSArray *arr = thressDAray[top];
            for (NSInteger i=left; i <= right; i++) {
                [spiral addObject:arr[i]];
            }

            top++;
            dir = 1;
        }
        else if (dir == 1) { // Top -> Bottom

            for (NSInteger i=top; i <= bottom; i++) {
                NSArray *arr = thressDAray[i];
                [spiral addObject:arr[right]];
            }

            right--;
            dir = 2;
        }
        else if (dir == 2) { // Right -> Left

            NSArray *arr = thressDAray[bottom];
            for (NSInteger i=right; i >= left; i--) {
                [spiral addObject:arr[i]];
            }

            bottom--;
            dir = 3;
        }
        else {  // Bottom to Top

            for (NSInteger i=bottom; i >= top; i--) {
                NSArray *arr = thressDAray[i];
                [spiral addObject:arr[left]];
            }

            left++;
            dir = 0;
        }
    }

    NSLog(@"Spiral array: %@", spiral);
}

+ (void)rotateMatricOfNN {

    //    NSMutableArray *row1 = [NSMutableArray arrayWithObjects:@1,@2, nil];
    //    NSMutableArray *row2 = [NSMutableArray arrayWithObjects:@3,@4, nil];
    //
    //    NSMutableArray *twoDArray=[NSMutableArray arrayWithObjects:row1,row2,nil];
    //    NSLog(@"%@",twoDArray);
    //
    //    NSMutableArray *transposedArray=[NSMutableArray new];
    //    for (NSInteger i=0; i<[row1 count]; i++) {
    //        NSArray *array = @[row2[i], row1[i]];
    //        [transposedArray addObject:array];
    //    }
    //    NSLog(@"Your transposed array: %@",transposedArray);


    NSArray *row1 = @[@1, @2, @3];
    NSArray *row2 = @[@4, @5, @6];
    NSArray *row3 = @[@7, @8, @9];

    NSArray *thressDAray = @[row1, row2, row3];

    NSMutableArray *transposedArray = [NSMutableArray new];
    NSInteger matrix = thressDAray.count;
    for (NSInteger i=0; i < matrix; i++) {
        
        NSMutableArray *array = [NSMutableArray new];
        for (int p=0; p < matrix; p++) {
            [array addObject:[NSNull null]];
        }
        
        for (int q=0; q < matrix; q++) {
            NSArray *ar = thressDAray[q];
            NSInteger idx = matrix -q -1;
            [array replaceObjectAtIndex:idx withObject:ar[i]];
        }
        
        [transposedArray addObject:array];
    }
    NSLog(@"Your transposed array: %@",transposedArray);
    
    
}

@end
