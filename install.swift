import Foundation

private let templateName = "TCA-SwiftUI.xctemplate"
private let destinationPath = "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/Project Templates/iOS/TCA-SwiftUI"

private func messageInConsole(_ message: String) {
    print("\(message)")
}

private let fileManager = FileManager.default

private func copyTemplate(createingFolderIfNeed: Bool = false) {
    do {
        if !fileManager.fileExists(atPath:"\(destinationPath)/\(templateName)"){
            try fileManager.copyItem(atPath: templateName, toPath: "\(destinationPath)/\(templateName)")
            messageInConsole("Template installed succesfully")
        } else {
            try fileManager.removeItem(at: URL(fileURLWithPath:"\(destinationPath)/\(templateName)"))
            try fileManager.copyItem(atPath: templateName, toPath: "\(destinationPath)/\(templateName)")
            messageInConsole("Template already exists. So has been replaced succesfully")
        }
    } catch let error as NSError {
        messageInConsole("Something Error: \(error.localizedFailureReason!)")
        messageInConsole("Try again with Creating new Folder")
        if createingFolderIfNeed {
            creatingFolder()
        }
    }
}

private func creatingFolder() {
    do {
        try fileManager.createDirectory(at: URL(fileURLWithPath:"\(destinationPath)"), withIntermediateDirectories: true, attributes: nil)
        copyTemplate()
    } catch let error as NSError {
        messageInConsole("Something Error: \(error.localizedFailureReason!)")
        messageInConsole("Finished")
    }
}

copyTemplate(createingFolderIfNeed: true)
