# BeappLogger

[![CocoaPods](https://img.shields.io/cocoapods/v/BeappLogger.svg)](https://cocoapods.org/pods/BeappLogger)

This Pod allows you to centralize the logs of your app, and distribute them wherever you want, thanks to an Appender system

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

To install it, simply add the following line to your Podfile:

```
pod 'BeappLogger'
```

## Usage

In your AppDelegate

```
Logger.build(with: PrintAppender(), FileAppender(filename: "app_log.txt"))
```

or use the default Logger (`OSLogger.log` for iOS >= 14.0 or `log` for iOS < 14.0)

```
Logger.build()
```

Then, in your app, use it simply like this

```
Logger.debug("TEST")
Logger.info("TEST")
Logger.warn("TEST")
Logger.error("TEST")
```

### Result

```
2019-02-05 04:51:41.636 [💬][AppDelegate: application(_:didFinishLaunchingWithOptions:) (24)] TEST
2019-02-05 04:51:41.652 [ℹ️][AppDelegate: application(_:didFinishLaunchingWithOptions:) (25)] TEST
2019-02-05 04:51:41.652 [⚠️][AppDelegate: application(_:didFinishLaunchingWithOptions:) (26)] TEST
2019-02-05 04:51:41.653 [🔥][AppDelegate: application(_:didFinishLaunchingWithOptions:) (27)] TEST
```

## Author

Beapp, contact@beapp.fr

## License

BeappLogger is available under the MIT license. See the LICENSE file for more info.
