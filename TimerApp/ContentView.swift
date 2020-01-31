//
//  ContentView.swift
//  TimerApp
//
//  Created by Dev Bahl on 31/01/20.
//  Copyright © 2020 Dev Bahl. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
  @State var selectedPickerIndex = 0
  @ObservedObject var timeManager = TimeManager()
  let availableminutes = Array(1...60)
    
    var body: some View {
        NavigationView{
            VStack{
                
        Text(secondsToMinutesAndSeconds (seconds: timeManager.secondsLeft))
            .font(.system(size: 80))
            .padding(.top, 80)
                
        Image(systemName: timeManager.timerMode == .running ?
            "pause.circle.fill":"play.circle.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
            .foregroundColor(.orange)
            .onTapGesture(perform: {
                if self.timeManager.timerMode == .initial{
                    self.timeManager.setTimerLength(minutes:
                        self.availableminutes[self.selectedPickerIndex]*60)
                }
                self.timeManager.timerMode == .running ?
                self.timeManager.pause() :
                self.timeManager.start()
            })
                
                if timeManager.timerMode == .paused{
            Image(systemName: "gobackward")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .foregroundColor(.orange)
                .padding(.top, 40)
                .onTapGesture(perform: {
                    self.timeManager.reset()
                })
                }
                if timeManager.timerMode == .initial{
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
    }
}
