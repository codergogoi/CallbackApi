//
//  CallBackAPI.h
//  CallBackResponse
//
//  Created by MAC01 on 19/10/16.
//  Copyright © 2016 MAC01. All rights reserved.
//

//Call back API Example

#import <Foundation/Foundation.h>

@interface CallBackAPI : NSObject {
    
    void(^_CallBackResponse)(id response,NSError *error);

}

//Simple call back Method
-(void)_RequestAPI:(void (^)(NSString *, NSError *)) handler;

//Call back with arguments with return with anyobject beacuse some cases web service can give you
//data in Array,Dictionary, String formate. So it is upto you how you can handle this.
-(void)_webRequestAPI:(NSDictionary *)dict URL: (NSString *)url :(void (^)(id,NSError *)) handler;

@end
