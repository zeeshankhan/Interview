//
//  Strings.h
//  Interview
//
//  Created by Zeeshan Khan on 5/4/16.
//  Copyright © 2016 Zeeshan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Strings : NSObject

+ (void)permutations;

+ (void)anagram;

+ (BOOL)isUnique:(NSString*)string;

+ (NSString *)trimming:(NSString*)string;

+ (BOOL)isPalindrome:(NSString*)string;

+ (BOOL)isPermutation:(NSString*)string1 of:(NSString*)string2;

@end
