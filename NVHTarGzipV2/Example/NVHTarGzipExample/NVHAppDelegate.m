//
//  NVHAppDelegate.m
//  NVHTarGzipExample
//
//  Created by Niels van Hoorn on 26/03/14.
//  Copyright (c) 2014 Niels van Hoorn. All rights reserved.
//

#import "NVHAppDelegate.h"

@implementation NVHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    // Override point for customization after application launch.
    
    #define HOME_PATH       NSHomeDirectory()
    #define TEMP_PATH       NSTemporaryDirectory()
    #define DOC_PATH        [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
    #define LIB_PATH        [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0]
    #define CACHE_PATH      [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]

        
    printf("home dir = %s\n",  [HOME_PATH cStringUsingEncoding:NSUTF8StringEncoding]);
    printf("temp dir = %s\n",  [TEMP_PATH cStringUsingEncoding:NSUTF8StringEncoding]);
    printf("doc dir = %s\n",   [DOC_PATH cStringUsingEncoding:NSUTF8StringEncoding]);
    printf("lib dir = %s\n",   [LIB_PATH cStringUsingEncoding:NSUTF8StringEncoding]);
    printf("cache dir = %s\n", [CACHE_PATH cStringUsingEncoding:NSUTF8StringEncoding]);
        
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
