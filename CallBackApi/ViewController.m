//
//  ViewController.m
//  CallBackApi
//
//  Created by Jayanta Gogoi on 22/10/16.
//  Copyright © 2016 Jayanta Gogoi. All rights reserved.
//

#import "ViewController.h"
#import "CallBackAPI.h"
#import "CallBackAPIDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self simpleCallBack];
    [self callBackWithArgumnts];
    
    [self callBackDelegate];
    [self callBackDelegateArgument];


}

#pragma mark Call Back Method Using Block

-(void)simpleCallBack{
    
    CallBackAPI *capi = [CallBackAPI new];
    
    [capi _RequestAPI:^(NSString *response, NSError *error){
        
        NSLog(@"Response : %@ Error : %@", response,error);
        
    }];
    
}

-(void)callBackWithArgumnts{
    
    CallBackAPI *capi = [CallBackAPI new];
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"UserName",@"uname_key",@"Password",@"pwd_Key", nil];
    NSString *serverURL = @"http://google.com";
    
    [capi _webRequestAPI:dict URL:serverURL :^(id response, NSError *err){
        
        NSLog(@"Response  %@", response);
        
    }];
    
}

#pragma mark Call Back Method Using Delegate


-(void)callBackDelegate{
    
    CallBackAPIDelegate *capd = [CallBackAPIDelegate new];
    [capd _requestAPI:self selector:@selector(simpleResponse:)];
    
}
//Response will perform here
-(void)simpleResponse : (id)responseObject{
    
    NSLog(@"Delegate Response is : %@", responseObject);
    
}


-(void)callBackDelegateArgument{
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"UserName",@"uname_key",@"Password",@"pwd_Key", nil];
    NSString *serverURL = @"http://google.com";
    
    CallBackAPIDelegate *capd = [CallBackAPIDelegate new];
    
    [capd _webRequestAPI:dict URL:serverURL target:self selector:@selector(webResponse:)];
    
}


-(void)webResponse:(id)responseObject{
    
    NSLog(@"Delegate Web Response is : %@", responseObject);
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
