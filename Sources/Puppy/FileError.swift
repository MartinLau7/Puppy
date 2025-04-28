import Foundation

public enum FileError: Error, Equatable, LocalizedError, Sendable {
    case isNotFile(url: URL)
    case isNotDirectory(url: URL)
    case invalidPermission(at: URL, filePermission: String)
    case invalidFolderPermission(at: URL, folderPermission: String)
    case creatingDirectoryFailed(at: URL)
    case creatingFileFailed(at: URL)
    case openingForWritingFailed(at: URL)
    case deletingFailed(at: URL)

    public var errorDescription: String? {
        switch self {
        case let .isNotDirectory(url: url):
            return "\(url) is not a Directory"
        case let .isNotFile(url: url):
            return "\(url) is not a file"
        case let .invalidPermission(at: url, filePermission: filePermission):
            return "invalid file permission. file: \(url), permission: \(filePermission)"
        case let .invalidFolderPermission(at: url, folderPermission: folderPermission):
            return "invalid file permission. Folder: \(url), permission: \(folderPermission)"
        case let .creatingDirectoryFailed(at: url):
            return "failed to create a directory: \(url)"
        case let .creatingFileFailed(at: url):
            return "failed to create a file: \(url)"
        case let .openingForWritingFailed(at: url):
            return "failed to open a file for writing: \(url)"
        case let .deletingFailed(at: url):
            return "failed to delete a file: \(url)"
        }
    }
}
