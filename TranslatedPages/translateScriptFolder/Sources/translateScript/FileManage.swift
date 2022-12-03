import Foundation

let 📁fm = FileManager()

func Load(_ ⓝame: String) -> String {
    let ⓟath = 📁fm.currentDirectoryPath + "/" + ⓝame
    return try! String(contentsOfFile: ⓟath, encoding: .utf8)
}

func Save(_ ⓣext: String, _ ⓝame: String) {
    let ⓟath = 📁fm.currentDirectoryPath + "/" + ⓝame
    let ⓓata = ⓣext.data(using: .utf8)!
    if 📁fm.createFile(atPath: ⓟath, contents: ⓓata) {
        print("🖨️ saved: \(ⓝame)")
    } else {
        print("🚨 failed to save: \(ⓝame)")
    }
}
