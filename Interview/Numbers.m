//
//  Numbers.m
//  Interview
//
//  Created by Zeeshan Khan on 5/6/16.
//  Copyright © 2016 Zeeshan. All rights reserved.
//

#import "Numbers.h"

@implementation Numbers

/*
 
 // Exact integer types
 int8_t aOneByteInt = 127;
 uint8_t aOneByteUnsignedInt = 255;
 int16_t aTwoByteInt = 32767;
 uint16_t aTwoByteUnsignedInt = 65535;
 int32_t aFourByteInt = 2147483647;
 uint32_t aFourByteUnsignedInt = 4294967295;
 int64_t anEightByteInt = 9223372036854775807;
 uint64_t anEightByteUnsignedInt = 18446744073709551615;

 // Minimum integer types
 int_least8_t aTinyInt = 127;
 uint_least8_t aTinyUnsignedInt = 255;
 int_least16_t aMediumInt = 32767;
 uint_least16_t aMediumUnsignedInt = 65535;
 int_least32_t aNormalInt = 2147483647;
 uint_least32_t aNormalUnsignedInt = 4294967295;
 int_least64_t aBigInt = 9223372036854775807;
 uint_least64_t aBigUnsignedInt = 18446744073709551615;

 // The largest supported integer type
 intmax_t theBiggestInt = 9223372036854775807;
 uintmax_t theBiggestUnsignedInt = 18446744073709551615;

 */

// A number should only be divisible by 1 or itself.
+ (void)isPrime {

    int num = 257;
    BOOL isPrime = YES;
    int cnt = 0;
    int divisibleBy = 1;

    for (int x = 2; sqrt(x) < num; x++) { // replace sqrt(x) with x * x
        cnt++;
        NSLog(@"%d %d Nxt multi %d", cnt, x, (x+1)*(x+1));
        if (num % x == 0) {
            isPrime = NO;
            divisibleBy = x;
            break;
        }
    }
    NSLog(@"%d is %@ DivisibleBy: %d", num, isPrime ? @"PRIME" : @"NOT PRIME", divisibleBy);
}

// A product of 1 to n
+ (void)factorial {

    int num = 10;
    long long val = 0;
//    val = [[self class] recursiveFactorial:num];
    val =  1;
    for (int x=1; x<=num; x++) {
        val = val*x;
    }

    NSLog(@"Factorial %lld ", val);
}

+ (NSInteger)recursiveFactorial:(NSInteger)num {
    if (num < 0) return 0;
    else if (num == 0) return 1;
    else return num * [[self class] recursiveFactorial:num-1];
}

// It means what ever value comes under 4,
// DOES not mean 2'0, 2'1, 2'2, 2'3, 2'4
+ (void)powerOf2From1toN {
    [[self class] printPowerOf2From1toN:4];
}

+ (NSInteger)printPowerOf2From1toN:(NSInteger)n {

    if (n < 1) return 0;
    else if (n == 1) {
        printf("1\n");
        return 1;
    }
    else {
        NSInteger pre = [[self class] printPowerOf2From1toN:n/2];
        NSInteger curr = pre * 2;
        printf("%d\n",(int) curr);
        return curr;
    }
}

+ (void)computeAtoThePowerOfB { // bª

}

+ (void)fibonacciSeries {

    NSInteger num = 20;
    NSInteger first;
    NSInteger second = 0;
    NSInteger next = 0;

    NSString *series = @"";
    for (NSInteger i = 0; i < num; i++) {
        if (i == 0) {
            first = 0;
            second = 0;
            next = 1;
        }
        else {
            first = second;
            second = next;
            next = first + second;
        }

        series = [NSString stringWithFormat:@"%@%d ", series, (int)second];
    }

    NSLog(@"%@", series);
}

@end
