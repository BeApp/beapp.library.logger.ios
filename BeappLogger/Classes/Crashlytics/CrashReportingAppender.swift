//
//  CrashReportingAppender.swift
//  BeappLogger
//
//  Created by Antoine Richeux on 22/11/2019.
//

import Foundation
import FirebaseCrashlytics
/**
Appender with CrashLytics

Record error with Crashlytics to give more data when a crash appear
*/
public class CrashReportingAppender: LoggerAppender {
    
    public init(){ }
    
    public func log(priority: LoggerPriority, message: String) {
        if priority == .error {
            let error = CrashReportingError(message: message)
            Crashlytics.crashlytics().record(error: error)
        } else {
            Crashlytics.crashlytics().log(format: "%@", arguments: getVaList([message]))
        }
    }
}

private struct CrashReportingError : LocalizedError {
    var message: String
    
    init(message: String) {
        self.message = message
    }
    
    var errorDescription: String? {
        return message
    }
}
