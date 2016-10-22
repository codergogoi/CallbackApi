//
//  CallBackAPIDelegate.m
//  CallBackResponse
//
//  Created by MAC01 on 19/10/16.
//  Copyright © 2016 MAC01. All rights reserved.
//

#import "CallBackAPIDelegate.h"

@implementation CallBackAPIDelegate

-(void)_requestAPI:(id)targetObject selector:(SEL)selMethod{
    
    NSString *responseString = @"Response String";
    
    [targetObject performSelector:selMethod withObject:responseString afterDelay:0];
    
}

-(void)_webRequestAPI:(NSDictionary *)dict URL:(NSString *)url target:(id)targetObject selector:(SEL)selMethod{

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
            
            NSString *responseString = @"Error in receiving data";

            [targetObject performSelector:selMethod withObject:responseString afterDelay:0];

            
        }else{
            
            NSString *responseString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            
            [targetObject performSelector:selMethod withObject:responseString afterDelay:0];

            
        }
        
        
        
    }];
    
    [task resume];
    


}


@end
