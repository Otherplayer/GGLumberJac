# GGLumberJac

## Setting
 CocoaLumberjac & XcodeColors(插件)

  * Download the [XcodeColors](https://github.com/robbiehanson/XcodeColors)
   
  * You also can see the [CocoaLumberJack](https://github.com/CocoaLumberjack/CocoaLumberjack)

  * In Xcode  'EditScheme  Environment Variables' , add key: 'XcodeColors values' set value to YES in order to show the debug color

  * info.plist 中 Application supports iTunes file sharing 设置为 YES


## Use

```objective-c
// 开始记录
[[GGLumberLog sharedInstance] recordLog];

// 输出到iTunes共享文件
[[GGLumberLog sharedInstance] redirectLogfile2ShareOfiTunes];
```

## See also [CocoaLumberJack](https://github.com/CocoaLumberjack/CocoaLumberjack)

```objective-c
/*
 *  DDLogError(@"错误信息");    // 红色
 *  DDLogWarn(@"警告");        // 橙色
 *  DDLogInfo(@"提示信息");     // 默认是黑色
 *  DDLogVerbose(@"详细信息");  // 默认是黑色
 */

```

## [CocoaPods](http://cocoapods.org/)

Add GGLumberJac to your `Podfile` and `pod install`.

```ruby
pod 'GGLumberJac', '~> 0.0.1'
```

## License

These specifications and CocoaPods are available under the [MIT license](http://www.opensource.org/licenses/mit-license.php).

