//
//  GGLumberLog.m
//  __无邪_
//
//  Created by __无邪_ on 15/4/27.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import "GGLumberLog.h"
#import <CocoaLumberjack.h>
@interface GGLumberLog ()
@property (strong, nonatomic) DDFileLogger *fileLogger;
@end

//static const int ddLogLevel = DDLogLevelVerbose;// 定义日志级别

@implementation GGLumberLog

+ (instancetype)sharedInstance{
    static GGLumberLog *logManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        logManager = [[GGLumberLog alloc] init];
    });
    return logManager;
}


- (instancetype)init{
    self = [super init];
    if (self) {
        [self installLog];
    }
    return self;
}



#pragma mark - initialization

- (void)installLog{
    
    
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    
    /*The code tells the application to keep a week's worth of log files on the system.*/
    self.fileLogger = [[DDFileLogger alloc] init];
    self.fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
    self.fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    
    [DDLog addLogger:self.fileLogger];
    
    
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor yellowColor] backgroundColor:nil forFlag:DDLogFlagError];
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor redColor] backgroundColor:nil forFlag:DDLogFlagWarning];
    [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor blueColor] backgroundColor:nil forFlag:DDLogFlagInfo];
    DDLogInfo(@"----------------------------------------------------------------------------------");
    DDLogInfo(@"\n\n新的日志记录开始\n\n");
    DDLogInfo(@"----------------------------------------------------------------------------------");
}




#pragma mark - public

- (void)recordLog{
};

- (void)redirectLogfile2ShareOfiTunes{
    
    NSString *libPath     = [self dirCache];
    NSString *logsPath    = [libPath stringByAppendingPathComponent:@"Logs"];
    NSString *logName     = [[self.fileLogger currentLogFileInfo] fileName];
    NSString *logOfSource = [logsPath stringByAppendingPathComponent:logName];
    
    NSString *docPath     = [self dirDocument];
    NSString *subDocPath  = [docPath stringByAppendingPathComponent:@"Logs"];
    
    NSString *targetPath  = [subDocPath stringByAppendingPathComponent:logName];
    
    NSFileManager *fileM = [[NSFileManager alloc] init];
    [fileM createDirectoryAtPath:subDocPath withIntermediateDirectories:YES attributes:nil error:nil];
    if ([fileM fileExistsAtPath:targetPath]) {
        [fileM removeItemAtPath:targetPath error:nil];
    }
    
    NSError *err = nil;
    [fileM copyItemAtPath:logOfSource toPath:targetPath error:&err];
    
    //    if (err) {
    //        DDLogInfo(@"copy失败：%@",err);
    //    }else{
    //        DDLogInfo(@"copy成功");
    //    }
}



- (NSString *)dirLibrary{
    return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
}

- (NSString *)dirDocument{
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
}

- (NSString *)dirCache{
    return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
}
@end
