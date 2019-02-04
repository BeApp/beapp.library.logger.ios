//
//  LoggerAppender.swift
//  logger
//
//  Created by Anthony Dudouit on 04/02/2019.
//  Copyright © 2019 Beapp. All rights reserved.
//

import Foundation

public protocol LoggerAppender {
	func log(priority: LoggerPriority, message: String)
}
