
import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func getJson(completion: @escaping (Model?, Error?) -> ()) {
        let urlString = "https://pryaniky.com/static/json/sample.json"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard error == nil, let data = data else {return}
            do {
                let json = try JSONDecoder().decode(Model.self, from: data)
                completion(json, nil)
            }catch let error {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
