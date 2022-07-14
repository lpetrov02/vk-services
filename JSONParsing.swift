import SwiftUI
import Foundation


struct Services: Decodable {
    var name: String
    var description: String
    var link: String
    var icon_url: String
}


struct Body: Decodable {
    var services: [Services]
}


struct VKApps: Decodable {
    var body: Body
    var status: Int
}


struct JsonParser {
    func load(completion: @escaping (VKApps) -> ()) {
        let stringUrl = "https://publicstorage.hb.bizmrg.com/sirius/result.json"
        guard let url = URL(string: stringUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else { return }
            guard let data = data else { return }
            
            guard let info = try? JSONDecoder().decode(VKApps.self, from: data) else {
                print("Error while parsing JSON")
                return
            }
            DispatchQueue.main.async {
                completion(info)
            }
        } .resume()
    }
}


