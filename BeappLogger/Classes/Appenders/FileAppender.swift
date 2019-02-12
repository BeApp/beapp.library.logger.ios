//
//  FileAppender.swift
//  BeappLogger
//
//  Created by Anthony Dudouit on 04/02/2019.
//

import Foundation

/**
Appender with the objective to save a file in the device

Writes the log file to the
*/
public class FileAppender: LoggerAppender {
	
	private let fileHandle: FileHandle?
	let filePath: URL
	
	///	- Parameters:
	///		- filename : the name of your file ie ("log_\(dateToday).txt")
	///		- sharedContainer: either you want the file to be saved in the shared container of your app (Optionnal)
	///		- groupName: the app group name (Optionnal)
	public init(filename: String, sharedContainer: Bool = false, groupName: String? = nil) {
		
		//Check if saving in the shared container is wanted and/or possible
		if sharedContainer,
			let _groupName = groupName,
			let _groupPath = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: _groupName) {
			filePath = _groupPath.appendingPathComponent(filename)
		} else {
			filePath = FileAppender.getDocumentsDirectory().appendingPathComponent(filename)
		}
		
		do {
			//Check the existence of the file
			if !FileManager.default.fileExists(atPath: filePath.path) {
				FileManager.default.createFile(atPath: filePath.path, contents: nil, attributes: nil)
			}
			fileHandle = try FileHandle(forWritingTo: filePath)
			
		} catch {
			fileHandle = nil
		}

		print("save into filename : \(filePath.path)")
	}
	
	deinit {
		if let _fileHandle = fileHandle {
			_fileHandle.closeFile()
		}
	}
	
	public func log(priority: LoggerPriority, message: String) {
		saveToFile(message)
	}
	
	
	
	///Save the message to the end of the file
	///
	///- Parameters:
	///	- message: message to be saved
	func saveToFile(_ message: String) {
		let s = message + "\n"
		if let data = s.data(using: String.Encoding.utf8),
			let _fileHandle = fileHandle {
			_fileHandle.seekToEndOfFile()
			_fileHandle.write(data)
		}
	}
	
	///Find the user documents folder
	///
	///- Returns:
	///	- An URL to the writing folder
	private class func getDocumentsDirectory() -> URL {
		let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return paths[0]
	}

}
