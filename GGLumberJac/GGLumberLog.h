//
//  GGLumberLog.h
//  __无邪_
//
//  Created by __无邪_ on 15/4/27.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

// CocoaLumberjac & XcodeColors(插件)
// https://github.com/robbiehanson/XcodeColors  https://github.com/CocoaLumberjack/CocoaLumberjack
// 在 EditScheme  Environment Variables 中添加 key: XcodeColors values:YES 可显示颜色
// info.plist 中 Application supports iTunes file sharing 设置为 YES

#import <Foundation/Foundation.h>


/**
 *  @brief  在iTunes共享文档Logs目录下产出日志文件
 *  @param
 */

/**
 *  DDLogError(@"错误信息");    // 红色
 *  DDLogWarn(@"警告");        // 橙色
 *  DDLogInfo(@"提示信息");     // 默认是黑色
 *  DDLogVerbose(@"详细信息");  // 默认是黑色
 */

/**
 * 如果要修改Log输出的颜色可以使用如下代码：
 * [[DDTTYLogger sharedInstance] setForegroundColor:[UIColor blueColor] backgroundColor:nil forFlag:LOG_FLAG_INFO];
 */

@interface GGLumberLog : NSObject
+ (instancetype)sharedInstance;

- (void)recordLog;
- (void)redirectLogfile2ShareOfiTunes;

@end
