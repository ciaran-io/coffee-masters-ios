//
//  SwiftUIView.swift
//  CoffeeMasters
//
//  Created by Ciaran on 18/01/2024.
//

import SwiftUI
import WebKit

class WebInterfaceDialogs: NSObject, WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        print(message.body)
        
    }
}


struct WebView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> WKWebView {
           let config = WKWebViewConfiguration()
           config.userContentController.add(WebInterfaceDialogs() , name: "alert")
           let webView = WKWebView(frame: .zero, configuration: config)
               
           return webView  // The UIKit View
       }
       
       func updateUIView(_ webView: WKWebView, context: Context) {
           let url = URL(string: "https://firtman.github.io/coffeemasters/webapp")
           let request = URLRequest(url: url!)
           webView.load(request)
           
       }
       
       func executeJavaScript(webView: WKWebView) {
           webView.evaluateJavaScript("alert('hello from Swift')")
       }
       
}


struct InfoPage: View {
    var body: some View {
        WebView()
    }
}

#Preview {
    InfoPage()
}
