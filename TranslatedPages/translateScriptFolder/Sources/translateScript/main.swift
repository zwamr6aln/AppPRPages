import Foundation

print("currentDirectoryPath:", FileManager().currentDirectoryPath)

print("CommandLine.arguments[1]: ", CommandLine.arguments[1])

let ⓕolderName = CommandLine.arguments[1]

let ⓣemporaryHtmlBody = Load(ⓕolderName + "/temporaryBody.html")
let ⓓescription = Load(ⓕolderName + "/description.txt")

let ⓗtmlModel = html_template(title: ⓕolderName,
                              description: ⓓescription,
                              body: ⓣemporaryHtmlBody)

for ⓛang in 🗺️Language.allCases {
    if ⓛang == .日本語 { continue }
    let ⓡesult = try await ⓗtmlModel.translate(ⓛang)
    Save(ⓡesult, ⓕolderName + "/translated_\(ⓛang.htmlTag).html")
    //let ⓡeverseTraslation = try await Translate(ⓡesult, in: .日本語)
    //Save(ⓡeverseTraslation, ⓕolderName + "/translated_\(ⓛang.htmlTag)_ja.html")
}
