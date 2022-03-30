//
//  ContentView.swift
//  TimeConverter
//
//  Created by Adam Nowland on 3/29/22.
//

import SwiftUI

// time conversion
// sec/ min / hour/ days
// enter time
// selection
// conversion time
// conversion selection

struct ContentView: View {
    // data
    @State private var initialTime = 0.0
    @State private var initialSelection = "Sec"
    @State private var convertedTime = 24
    @State private var toConvertTo = "Min"
    // computed vars
    var initialToSeconds: Double {
        if(initialSelection == "Sec"){
            return initialTime
        } else if(initialSelection == "Min"){
            return initialTime * 60
        } else if(initialSelection == "Hours"){
            return initialTime * 3600
        } else {
            return initialTime * 86400
        }
    }
    var finalConversion : Double {
        switch toConvertTo {
        case "Sec":
            return initialToSeconds
        case "Min":
            return initialToSeconds / 60
        case "Hours":
            return initialToSeconds / 3600
        case "Days":
            return initialToSeconds / 86400
        default:
            return 0.0
        }
    }
    
    let timeConversions = ["Sec", "Min", "Hours", "Days"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Input initial time", value: $initialTime, format: .number)
                        .keyboardType(.decimalPad)
                    Picker("Time Type", selection: $initialSelection){
                        ForEach(timeConversions, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Initial Time Input: ")
                }
                Section {
                    Picker("Convert To:", selection: $toConvertTo){
                        ForEach(timeConversions, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented
                    )
                } header: {
                    Text("Convert Time To: ")
                }
                Section{
                    Text(finalConversion, format: .number)
                } header: {
                    Text("Converted Time: ")
                }
            }
            .navigationTitle("Number Formatter")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
