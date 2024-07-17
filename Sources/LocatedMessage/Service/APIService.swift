//
//  File.swift
//  
//
//  Created by Done Santana on 6/13/24.
//

import Foundation


enum APIError: Error {
    case invalidURL
    case invalidResponse(error: String?)
    case invalidData
    case serverError(error: String)
}

class ApiService: ObservableObject {
    
    static let shared = ApiService()
    
    func uploadFile(parameters: [String: Any],file: Data, completion: @escaping (Result<String, APIError>) -> Void) {
        //let recordedFilePath = NSHomeDirectory() + "/Library/Caches/Image"
        let mimetype = "image/jpeg"
        
        var request : NSMutableURLRequest = NSMutableURLRequest()
        let body = NSMutableData()
        let boundary = "--------14737809831466499882746641449----"
        //Add extra parameters
        
        
        request = URLRequest(url: URL(string: LocatedMessageConfiguration.serverAPIURL)!) as! NSMutableURLRequest
        request.httpMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(LocatedMessageConfiguration.userDefaults.value(forKey: "accessToken") as! String)", forHTTPHeaderField: "Authorization")
        
        for (key, value) in parameters {
            body.append(("--\(boundary)\r\n").data(using: .utf8)!)
            body.append(("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n").data(using: .utf8)!)
            body.append(("\(value)\r\n").data(using: .utf8)!)
        }
        
        var fileData: Data = file
        
        //Add File to body
        body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
        body.append("Content-Disposition:form-data; name=\"file\"\r\n\r\n".data(using: .utf8)!)
        body.append("hi\r\n".data(using: String.Encoding.utf8)!)
        body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
        body.append("Content-Disposition:form-data; name=\"file\"; filename=\"\(parameters["id"]).png\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: \(mimetype)\r\n\r\n".data(using: .utf8)!)
        body.append(fileData)
        body.append("\r\n".data(using: String.Encoding.utf8)!)
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        
        request.httpBody = body as Data
        
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            
            if let error = error {
                completion(.failure(.serverError(error: error.localizedDescription)))
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                
                guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    completion(.failure(.invalidResponse(error: json["msg"] as? String ?? "")))
                    return
                }
                completion(.success("Success"))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
}
