//
//  ContentView.swift
//  Covid-iOS
//
//  Created by Avijeet Sachdev on 6/30/20.
//  Copyright © 2020 Avijeet Sachdev. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var casesList = CasesViewModel()
    
    init() {
        self.casesList.getCasesData()
    }
    
    var body: some View {
        NavigationView {
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
                            .foregroundColor(self.colorScheme == .dark ? Color.white : Color.black)
                        .font(.custom("", size: 45))
                        
                        HStack(alignment: .center, spacing: 10) {
                            HStack {
                                Text("H:")
                                Text("\(caseObj.hospitalized)")
                            }.padding(5)
                                .foregroundColor(Color.black)
                                .background(Color.white)
                                .font(.custom("", size: 12))
                                .cornerRadius(10)
                            
                            HStack {
                                Text("D:")
                                Text("\(caseObj.death)")
                            }.padding(5)
                                .foregroundColor(Color.black)
                                .background(Color.white)
                                .font(.custom("", size: 12))
                                .cornerRadius(10)
                            
                            
                            
                            HStack {
                                Text("R:")
                                Text("\(caseObj.recovered)")
                            }.padding(5)
                                .foregroundColor(Color.black)
                                .background(Color.white)
                                .font(.custom("", size: 12))
                                .cornerRadius(10)
                        }
                    }
                    Spacer()
                }
                Text("P:")
                .font(.custom("", size: 12))
                Text("\(caseObj.positive)")
                .padding(5)
                .font(.custom("", size: 12))
            }
            .navigationBarTitle("COVID-19 Cases")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
