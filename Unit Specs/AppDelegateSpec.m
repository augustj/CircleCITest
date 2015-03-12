//
//  AppDelegateSpec.m
//  CircleCITest
//
//  Created by August Jaenicke on 3/12/15.
//  Copyright 2015 CarbonFive. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>

#import "AppDelegate.h"

SpecBegin(AppDelegate)

describe(@"AppDelegate", ^{
    it(@"Works", ^{
        expect(@"This").to.equal(@"This");
    });

    it(@"Fails", ^{
        expect(@"This").notTo.equal(@"That");
    });
});

SpecEnd