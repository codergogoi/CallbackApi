//
//  CallBackAPIDelegate.h
//  CallBackResponse
//
//  Created by MAC01 on 19/10/16.
//  Copyright © 2016 MAC01. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CallBackAPIDelegate : NSObject

//Simple call back Method
-(void)_requestAPI:(id)targetObject selector:(SEL)selMethod;

//Call back with arguments with return with anyobject beacuse some cases web service can give you
//data in Array,Dictionary, String formate. So it is upto you how you can handle this.
-(void)_webRequestAPI:(NSDictionary *)dict URL:(NSString *)url target:(id)targetObject selector:(SEL)selMethod;

@end
