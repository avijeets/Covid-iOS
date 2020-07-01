//
//  CasesViewModel.swift
//  Covid-iOS
//
//  Created by Avijeet Sachdev on 6/30/20.
//  Copyright © 2020 Avijeet Sachdev. All rights reserved.
//

import Foundation

class CasesViewModel: ObservableObject {
    @Published var cases = [CaseViewModel]()
    
    func getCasesData() {
        NetworkManager().fetchCovidCases { (casesList) -> (Void) in
            if let casesList = casesList {
                DispatchQueue.main.async {
                    self.cases = casesList.map(CaseViewModel.init)
                }
            }
        }
    }
}

class CaseViewModel {
    var caseObject: Case
    
    init(individualCase: Case) {
        self.caseObject = individualCase
    }
    
    let id: UUID = UUID()
    
    var state: String {
        return self.caseObject.state
    }
    
    var total: Int {
        return self.caseObject.total
    }
    
    var positive: Int {
        return self.caseObject.positive
    }
    
    var recovered: Int {
        return self.caseObject.recovered ?? 0
    }
    
    var death: Int {
        return self.caseObject.death
    }
    
    var hospitalized: Int {
        return self.caseObject.hospitalized ?? 0
    }
}
