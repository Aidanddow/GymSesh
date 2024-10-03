//
//  WorkoutDetailView.swift
//  GymSesh
//
//  Created by Aidan Dow on 03/10/2024.
//

import SwiftUI

struct WorkoutDetailView: View {
    
    var workout: Workout = Workout(title: "None")
    
    var body: some View {
        
        VStack {
            TitleView()
            Text(workout.show())
                .bold()
                .font(.largeTitle)
            
            Text(workout.showDate())
                .bold()
                .font(.largeTitle)
        }
    }
}

struct WorkoutDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailView()
    }
}
