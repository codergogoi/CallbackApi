//
//  CallBackAPI.m
//  CallBackResponse
//
//  Created by MAC01 on 19/10/16.
//  Copyright © 2016 MAC01. All rights reserved.
//

#import "CallBackAPI.h"


@implementation CallBackAPI


- (void)_RequestAPI:(void (^)(NSString *, NSError *))handler{

    _CallBackResponse = [handler copy];
    
    //Perform API Call here
    NSString *exampleStr = @"Some simple response";
    NSError *someError = nil;
    
    _CallBackResponse(exampleStr,someError);
    _CallBackResponse = nil;
}

- (void)_webRequestAPI:(NSDictionary *)dict URL:(NSString *)url :(void (^)(id, NSError *))handler{
    
    _CallBackResponse = [handler copy];
    
    NSError *err = nil;
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:&err];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)[postData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
   
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nonnull data, NSURLResponse * _Nonnull response, NSError * _Nonnull error){
    
        if(error != nil){
            
            _CallBackResponse(@"Error in response",error);
            
        }else{
        
            NSString *responseString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];

            _CallBackResponse(responseString,error);

        }
        
        

    }];
    
    [task resume];
    
    
}


@end
