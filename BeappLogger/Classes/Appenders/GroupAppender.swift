//
//  GroupAppender.swift
//  BeappLogger
//
//  Created by Anthony Dudouit on 04/02/2019.
//

import Foundation

/**
Appender with the objective to save a file in a shared container

Writes the log file to the container belonging to the application group. The app must activate the [App Groups](https://developer.apple.com/support/app-capabilities/) capability in your project configuration
*/
public class GroupAppender: FileAppender {
	
	let appName: String
	let userDefault: UserDefaults?
	
	///	- Parameters:
	///		- groupName: the app group name
	///		- appName: the name of your app
	public init(groupName: String, appName: String) {
		self.appName = appName
		self.userDefault = UserDefaults(suiteName: groupName)
		
		//Retrieve all app names from this group
		var appNames = self.userDefault?.value(forKey: groupName) as? [String] ?? []
		
		//If this particular app is not there, we add it to the userdefaults shared for this group
		if !appNames.contains(appName) {
			appNames.append(appName)
			self.userDefault?.set(appNames, forKey: groupName)
		}
		
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd"
		let dateFormat = formatter.string(from: Date())
		
		//Init the FileAppender (parent) in order to get the file path
		super.init(filename: "shared_\(appName)_\(dateFormat).txt", sharedContainer: true, groupName: groupName)
		
		//Retrieve all files saved for this group
		var logfiles = self.userDefault?.value(forKey: appName) as? [String] ?? []
		
		//If the file is not in the userdefaults, we link it to the app name
		if !logfiles.contains(self.filePath.path) {
			logfiles.append(self.filePath.path)
			self.userDefault?.set(logfiles, forKey: appName)
		}
	}
}
