import Foundation

// Function to run a Python script using NSTask
func runPythonScript(scriptPath: String, arguments: [String] = []) -> String? {
    let task = Process()
    task.launchPath = "/usr/bin/python3"
    task.arguments = [scriptPath] + arguments

    let pipe = Pipe()
    task.standardOutput = pipe
    task.standardError = pipe

    let fileHandle = pipe.fileHandleForReading
    task.launch()

    let data = fileHandle.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)

    return output
}

// Example usage
if let result = runPythonScript(scriptPath: "path/to/your/magenta_script.py", arguments: ["arg1", "arg2"]) {
    print("Script output: \(result)")
} else {
    print("Failed to run script")
}
