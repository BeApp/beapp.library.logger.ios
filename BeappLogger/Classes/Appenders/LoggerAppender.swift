//
//  LoggerAppender.swift
//  logger
//
//  Created by Anthony Dudouit on 04/02/2019.
//  Copyright © 2019 Beapp. All rights reserved.
//

import Foundation

/**
Protocol to override to be an Appender
*/
public protocol LoggerAppender {
	
	/// Override this method to log the message wherever you want (in the console, in a file, etc.)
	func log(priority: LoggerPriority, message: String)
}
