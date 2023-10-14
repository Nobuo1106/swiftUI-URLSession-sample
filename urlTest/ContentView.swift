//
//  ContentView.swift
//  urlTest
//
//  Created by 五十嵐伸雄 on 2023/10/14.
//

import SwiftUI

struct ContentView: View {
    init() {
        fetch()
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
    
    func fetch() {
        let url = URL(string: "https://api.github.com/search/repositories?q=Swifthttps://api.github.com/search/repositories?q=Swift")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) {data, urlResponse, error in
            if let urlResponse = urlResponse as? HTTPURLResponse {
                print(urlResponse.statusCode)
                print(urlResponse.allHeaderFields["Date"]!)
                print(urlResponse.allHeaderFields["Content-Type"])
            }
        }
        task.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
