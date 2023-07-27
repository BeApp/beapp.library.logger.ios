//
//  OSLoggerAppender.swift
//  
//
//  Created by Cédric Derache on 27/07/2023.
//

import os
/**
 Appender by default (above iOS 14.0)
 
 Use simply the Logger methods to log the message in the console
 */
@available(iOS 14.0, *)
public class OSLoggerAppender: LoggerAppender {
    typealias OSLogger = os.Logger
    
    private let logger = OSLogger(subsystem: Bundle.main.bundleIdentifier ?? "BeappLogger", category: "Logger")
    public init(){}
    
    public func log(priority: LoggerPriority, message: String) {
        logger.log(level: priority.toOSLogType(), "\(message, privacy: .public)")
    }
}

@available(iOS 14.0, *)
extension LoggerPriority {
    func toOSLogType() -> OSLogType {
        switch self {
        case .debug:
            return OSLogType.debug
        case .info:
            return OSLogType.info
        case .warn:
            return OSLogType.error
        case .error:
            return OSLogType.error
        }
    }
}
