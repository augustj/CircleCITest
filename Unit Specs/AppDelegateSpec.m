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
#import "OHHTTPStubs.h"

#import "AFNetworking.h"

#import "AppDelegate.h"

SpecBegin(AppDelegate)

describe(@"AppDelegate", ^{
    describe(@"OHHTTPStubs", ^{
        __block id<OHHTTPStubsDescriptor> stubDescriptor;

        before(^{
            stubDescriptor = [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                return [request.URL.host isEqualToString:@"foo.com"];
            } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                return [OHHTTPStubsResponse responseWithFileAtPath:OHPathForFileInBundle(@"swagger.json", nil) statusCode:200 headers:@{@"Content-Type":@"application/json; charset=UTF-8"}];
            }];
            [OHHTTPStubs onStubActivation:^(NSURLRequest *request, id<OHHTTPStubsDescriptor> stub) {
            }];
        });

        after(^{
            [OHHTTPStubs removeAllStubs];
        });
        
        it(@"stubs the call", ^{
            __block BOOL completed = false;

            NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
            AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];

            [manager GET:@"http://foo.com/playlist/swagger.json" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
                completed = true;
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                expect(error).to.beNil();
                completed = true;
            }];

            expect(@(completed)).will.beTruthy();
        });
    });
});

SpecEnd