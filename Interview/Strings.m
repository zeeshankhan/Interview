//
//  Strings.m
//  Interview
//
//  Created by Zeeshan Khan on 5/4/16.
//  Copyright © 2016 Zeeshan. All rights reserved.
//

#import "Strings.h"

@implementation Strings

+ (void)permutations {

    NSString *string = @"abc"; //@"zeeshan";
    [[self class] permutation:string permutation:@""];
}

+ (void)permutation:(NSString *)str permutation:(NSString*)permutation {

    if (str.length == 0)
        printf("%s\n", permutation.UTF8String);

    else {

        for (int x=0; x<str.length; x++) {
            NSString *t = [str substringToIndex:x];
            NSString *f = [str substringFromIndex:x+1];
            NSString *rem = [NSString stringWithFormat:@"%@%@", t, f];
            permutation = [NSString stringWithFormat:@"%@%c", permutation, [str characterAtIndex:x]];
            [[self class] permutation:rem permutation:permutation];
        }
    }

}

+ (BOOL)isUnique:(NSString*)string {

    NSInteger len = string.length;
    if (len > 128) return NO;

    for (int x=0; x<len; x++) {
        unichar c1 = [string characterAtIndex:x];
        for (int y=0; y<len; y++) {
            unichar c2 = [string characterAtIndex:y];
            if (x != y && c1 == c2) return NO;
        }

    }

    return YES;
}

// Trim whitespace characters from beginning, end of the string, and more than one space in between.

+ (NSString *)trimming:(NSString*)string {

    NSString *str = @"";
    BOOL isStarted = NO;
    BOOL isMidSpace = NO;

    for (int x=0; x<string.length; x++) {
        unichar c = [string characterAtIndex:x];
        if (c != ' ') {
            if (isMidSpace) {
                isMidSpace = NO;
                str = [NSString stringWithFormat:@"%@ %c", str, c];
            }
            else {
                str = [NSString stringWithFormat:@"%@%c", str, c];
            }
            isStarted = YES;
        }
        else {
            if (isStarted && !isMidSpace) isMidSpace = YES;
        }
    }
    return str;
}


// Check Palindrome or a permutation of palindrome
// aibohphobia

+ (BOOL)isPalindrome:(NSString*)string {

    NSInteger oddCount = 0;
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:string.length];

    for (NSInteger x=0; x<string.length; x++) {

        unichar c1 = [string characterAtIndex:x];
        BOOL isSame = NO;

        for (NSString *s in array) {
            if (s == [NSString stringWithFormat:@"%c", c1]) {
                isSame = YES;
                break;
            }
        }

        if (!isSame) {

            BOOL isOdd = NO;
            for (int y=0; y<string.length; y++) {
                unichar c2 = [string characterAtIndex:y];
                if (c1 == c2) {
                    isOdd = !isOdd;
                    //break;
                }
            }

            if (isOdd) {
                oddCount = oddCount + 1;
                if (oddCount == 2) {
                    return false;
                }
            }

            [array addObject:[NSString stringWithFormat:@"%c", c1]];
        }
    }

    return YES;
}


// Check Permutation: given two string, if one is a permutation to other.

+ (BOOL)isPermutation:(NSString*)string1 of:(NSString*)string2 {

    if (string1.length != string2.length) {
        return FALSE;
    }

    NSMutableArray *charArray = [NSMutableArray new];

    for (int x=0; x<charArray.count; x++) {

        unichar char1 = [string1 characterAtIndex:x];

        BOOL isFound = FALSE;

        for (NSString *c0 in charArray) {
            if ([NSString stringWithFormat:@"%c", char1] == c0) {
                isFound = true;
                break;
            }
        }

        if (!isFound) {
            int char1Count = 0;
            for (int p=0; p<string1.length; p++) {
                unichar c = [string1 characterAtIndex:p];
                if (c == char1) {
                    char1Count = char1Count + 1;
                }
            }

            int char2Count = 0;
            for (int p=0; p<string2.length; p++) {
                unichar char2 = [string2 characterAtIndex:p];
                if (char1 == char2) {
                    char2Count = char2Count + 1;
                }
            }
            printf("%c, %d, %d", char1, char1Count, char2Count);

            if (char1Count != char2Count) {
                return FALSE;
            }

            [charArray addObject:[NSString stringWithFormat:@"%c", char1]];
        }
        
    }

    NSLog(@"%@", charArray);
    return true;

}

/*
func isPermutation(string1: String, of string2: String) -> Bool {

    if (string1.characters.count != string2.characters.count) {
        return false
    }

    var charArray = Array(count: string1.characters.count, repeatedValue: "Yo")
    for char1 in string1.characters {

        var isFound = false
        for c0 in charArray {
            if String(char1) == c0 {
                isFound = true
                break
            }
        }

        if !isFound {
            var char1Count = 0
            for c in string1.characters {
                if c == char1 {
                    char1Count = char1Count + 1;
                }
            }

            var char2Count = 0
            for char2 in string2.characters {
                if char1 == char2 {
                    char2Count = char2Count + 1;
                }
            }
            print(char1, char1Count, char2Count)

            if char1Count != char2Count {
                return false
            }

            charArray.append(String(char1))
        }
        
    }
    print(charArray)
    return true
}

 */

@end

