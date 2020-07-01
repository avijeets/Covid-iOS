//
//  ContentView.swift
//  Covid-watchOS Extension
//
//  Created by Avijeet Sachdev on 7/1/20.
//  Copyright © 2020 Avijeet Sachdev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var casesList = CasesViewModel()
    
    init() {
        self.casesList.getCasesData()
    }
    
    var body: some View {
        List(self.casesList.cases, id: \.id) { caseObj in
            HStack {
                Text(caseObj.state)
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.green)
                    .clipShape(Circle())
                    .font(.custom("", size: 18))
                Spacer()
                
                VStack(alignment: .center) {
                    Text("\(caseObj.total)")
                        .foregroundColor(Color.white)
                        .font(.custom("", size: 18))
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
