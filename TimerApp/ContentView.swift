//
//  ContentView.swift
//  TimerApp
//
//  Created by Dev Bahl on 31/01/20.
//  Copyright © 2020 Dev Bahl. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
  @State var timerMode: TimerMode = .initial
  @State var selectedPickerIndex = 0
  @ObservedObject var timeManager = TimeManager()
  let availableminutes = Array(1...59)
    
    var body: some View {
        NavigationView{
            VStack{
                
        Text("\(timeManager.secondsLeft)")
            .font(.system(size: 80))
            .padding(.top, 80)
                
        Image(systemName: timeManager.timerMode == .running ?
            "pause.circle.fill":"play.circle.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
            .foregroundColor(.orange)
            .onTapGesture(perform: {
                self.timeManager.start()
            })
                
        if timerMode == .paused{
            Image(systemName: "gobackward")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .foregroundColor(.orange)
                .padding(.top, 40)
                }
        if timerMode == .initial{
             Picker(selection: $selectedPickerIndex, label: Text("")){
                ForEach(0..<availableminutes.count){
                    Text("\(self.availableminutes[$0]) min")
                }
                }
                .labelsHidden()
                }
                Spacer()
            }
        .navigationBarTitle("My Timer")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}
