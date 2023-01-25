import Foundation

let 🔑authKey: String = 🄻oad("auth_key.txt")!

func 🅃ranslate(_ ⓣext: String, in ⓛang: 🗺️Language) async throws -> String {
    let ⓤrl = "https://api-free.deepl.com/v2/translate"
    var ⓡequest = URLRequest(url: URL(string: ⓤrl)!)
    ⓡequest.setValue("DeepL-Auth-Key " + 🔑authKey, forHTTPHeaderField: "Authorization")
    ⓡequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
    ⓡequest.httpMethod = "POST"
    
    var ⓑody = "text="
    ⓑody += ⓣext.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    ⓑody += "&target_lang=" + ⓛang.rawValue
    ⓑody += "&tag_handling=html"
    ⓡequest.httpBody = ⓑody.data(using: .utf8)
    
    let (ⓓata, ⓡesponse) = try await URLSession.shared.data(for: ⓡequest)
    if (ⓡesponse as? HTTPURLResponse)?.statusCode != 200 { throw 🚨Error.failed(#function) }
    
    let ⓜodel = try JSONDecoder().decode(🄰PIResponseModel.self, from: ⓓata)
    return ⓜodel.translations.first!.text
}

enum 🚨Error: Error {
    case failed(_ detail: String)
}

struct 🄰PIResponseModel: Codable {
    var translations: [🅃ranslation]
    struct 🅃ranslation: Codable {
        var detected_source_language: 🗺️Language
        var text: String
    }
}

enum 🗺️Language: String, Codable, CaseIterable {
    case 英語_アメリカ = "EN" //EN-US?
    case インドネシア語 = "ID"
    case スペイン語 = "ES"
    case ドイツ語 = "DE"
    case フランス語 = "FR"
    case ポルトガル語 = "PT"
    case ロシア語 = "RU"
    case 中国語_簡体字 = "ZH" //中国
    case ウクライナ語 = "UK"
    // * * *
    case 日本語 = "JA"
    // * * *
    //case アラビア語 = "ar-SA"
    //case 韓国語 = "ko"
    //case 中国語_繁体字 = "zh-Hant" //台湾
    
    var htmlTag: String {
        switch self {
            case .英語_アメリカ: return "en"
            case .日本語: return "ja"
            case .インドネシア語: return "id"
            case .スペイン語: return "es"
            case .ドイツ語: return "de"
            case .フランス語: return "fr"
            case .ポルトガル語: return "pt"
            case .ロシア語: return "ru"
            case .中国語_簡体字: return "zh"
            case .ウクライナ語: return "uk"
        }
    }
}
