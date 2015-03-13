//
//  AppDelegateSpec.m
//  CircleCITest
//
//  Created by August Jaenicke on 3/12/15.
//  Copyright 2015 CarbonFive. All rights reserved.
//

#import <Specta/Specta.h>
#import <KIF.h>

#import "AppDelegate.h"

SpecBegin(AppDelegate)

describe(@"AppDelegate", ^{
    it(@"Works", ^{
        [tester waitForAbsenceOfViewWithAccessibilityLabel:@"Not here"];
    });
    it(@"Fails", ^{
        [tester waitForViewWithAccessibilityLabel:@"Not Here"];
    });
});

SpecEnd