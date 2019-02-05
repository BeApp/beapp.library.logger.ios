//
//  GroupAppender.swift
//  BeappLogger
//
//  Created by Anthony Dudouit on 04/02/2019.
//

import Foundation

public class GroupAppender: FileAppender {
	
	let appName: String
	let userDefault: UserDefaults?
	
	public init(groupName: String, appName: String, htmlAppender: HtmlAppender? = nil) {
		self.appName = appName
		self.userDefault = UserDefaults(suiteName: groupName)
		var appNames = self.userDefault?.value(forKey: groupName) as? [String] ?? []
		if !appNames.contains(appName) {
			appNames.append(appName)
			self.userDefault?.set(appNames, forKey: groupName)
		}
		
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd"
		let dateFormat = formatter.string(from: Date())
		
		
		super.init(filename: "shared_\(appName)_\(dateFormat).txt", sharedContainer: true, groupName: groupName)

		var logfiles = self.userDefault?.value(forKey: appName) as? [String] ?? []
		if !logfiles.contains(self.filePath.path) {
			logfiles.append(self.filePath.path)
			self.userDefault?.set(logfiles, forKey: appName)
		}
	}
}
