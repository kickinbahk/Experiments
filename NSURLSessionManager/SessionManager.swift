//
//  SessionManager.swift
//
//  Created by Garric Nahapetian on 12/16/15.
//

import Foundation

public class SessionManager {
    
    // Singleton sessionManager
    public static let sharedInstance = SessionManager()
    
    // Data Task function
    public func requestWithMethod(method: HTTPMethod, andParams params: [String:String], andURL url: String, withCompletion completionHandler: (AnyObject?, ErrorType?) -> Void) {
        
        // Create query string from params argument using utility function
        let queryString = returnQueryStringFromParams(params)
    
        // Encode queryString
        let encodedQueryString = queryString.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())

        // Create base url with url argument
        guard let baseURL = NSURL(string: url),
              // Unwrap the encodedQueryString
              let encoded = encodedQueryString else { return }
        
        // Create url with encoded string and base url and unwrap it
        guard let requestURL = NSURL(string: encoded, relativeToURL: baseURL) else { return }
        
        // Create request with request url
        let request = NSMutableURLRequest(URL: requestURL)
        // Set request method to value of method argument
        request.HTTPMethod = method.rawValue
        
        // Get the shared session
        let session = NSURLSession.sharedSession()
        
        // Create a task for the session with the requst
        let task = session.dataTaskWithRequest(request) { data, response, error in
            // Unwrap data
            guard let data = data else {
                // TODO: - Handle this case
                print("Data is nil")
                return
            }
            // Call completion with error if error not nil
            guard error == nil else {
                completionHandler(nil, error)
                return
            }
            // Parse JSON response
            do {
                let object = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                // Call completion with parsed JSON object (AnyObject)
                completionHandler(object, nil)
            // Handle error
            } catch {
                // Call completion with error
                completionHandler(nil, error)
            }
        }
        // Must call task.resume for data task to begin
        task.resume()
    }

    // Helper function that creates a query string from a parameters dictionary
    // Adds "?" to begining of query string, and "=" between param key and value, and "&" if more than one key value pair and repeats
    private func returnQueryStringFromParams(params: [String:String]) -> String {
        
        var string = "?"
        var count = 1
        
        for param in params {
            
            if params.count == 1 {
                string += "\(param.0)=\(param.1)"
            }
            
            if params.count > 1 {
                
                if count == params.count {
                    string += "\(param.0)=\(param.1)"
                }
                
                if count < params.count {
                    string = string + "\(param.0)=\(param.1)&"
                    count += 1
                }
            }
        }
        
        return string
    }
    
}

// Enum to hold all HTTPMethods. Add other methods as necessary...i.e., "PUT", "DELETE", etc.
private enum HTTPMethod: String {
    
    case Post = "POST"
    case GET = "GET"
    
}













