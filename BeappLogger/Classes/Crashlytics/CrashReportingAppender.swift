//
//  CrashReportingAppender.swift
//  BeappLogger
//
//  Created by Antoine Richeux on 22/11/2019.
//

import Foundation
import Crashlytics
/**
Appender with CrashLytics

Record error with Crashlytics to give more data when a crash appear
*/
public class CrashReportingAppender: LoggerAppender {
    
    public init(){ }
    
    public func log(priority: LoggerPriority, message: String) {
        let error = CrashReportingError(message: message, priority: priority)
        Crashlytics.sharedInstance().recordError(error)
    }
}

private struct CrashReportingError : LocalizedError {
    var message: String
    var priority: LoggerPriority
    
    init(message: String, priority: LoggerPriority) {
        self.message = message
        self.priority = priority
    }
    
    var errorDescription: String? {
        return priority.rawValue + message
    }
}
