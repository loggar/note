import Foundation

// Function to print each PATH entry on a new line with a count of appearances
func printPathEntriesWithCount() {
    // Fetching the PATH environment variable
    guard let pathString = ProcessInfo.processInfo.environment["PATH"] else {
        print("PATH environment variable not found.")
        return
    }
    
    // Splitting the PATH variable into individual entries
    let pathEntries = pathString.components(separatedBy: ":")
    
    // Dictionary to keep track of the count of each path entry
    var pathCounts = [String: Int]()
    
    // Iterating over each path entry
    for entry in pathEntries {
        // Incrementing the count for the current entry
        pathCounts[entry, default: 0] += 1
        
        // Printing the current entry with its count, or '-' if the count is 1
        let count = pathCounts[entry]!
        print("\(entry) \(count > 1 ? "\(count)" : "-")")
    }
}

// Calling the function to print the $PATH entries with counts
printPathEntriesWithCount()
