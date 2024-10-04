//
//  WorkoutDetailView.swift
//  GymSesh
//
//  Created by Aidan Dow on 03/10/2024.
//

import SwiftUI

struct WorkoutDetailView: View {
    
    @State var workout: Workout = Workout(title: "None")
    
    @State private var showingSheet = false
    
    var body: some View {
        
        VStack {
            TitleView()
            Text(workout.show())
                .bold()
                .font(.largeTitle)
            
            Text(workout.showDate())
                .italic()
                .foregroundColor(.gray)
            
            List {
                ForEach(workout.exercises, id: \.self) { exercise in
                    ExerciseView(exercise: exercise)
                }
            }
            
            Button("Add Exercise") {
                        showingSheet.toggle()
                    }
                    .sheet(isPresented: $showingSheet) {
                        AddExerciseView(workout: $workout)
                    }
        }
        .navigationTitle("Workout View")
    }
}

struct WorkoutDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailView()
    }
}


struct AddExerciseView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var workout: Workout // Add this line to bind the workout
    
    @State var name: String = ""
    @State var sets = 0
    @State var reps = 0
    @State var weight = 0
    
    

    var body: some View {
        VStack {
            
            TextField("Enter Exercise Name...", text: $name)
            
            Stepper("\(weight) kg", value: $weight)
            Stepper("\(sets) sets", value: $sets)
            Stepper("\(reps) reps", value: $reps)
            
            Button(action: {
                let e = Exercise(name, weight: Float(weight), sets: sets, reps: reps)
                workout.addExercise(e)
                dismiss()
                
            }) {
                Text("Add Exercise")
            }
            
            
        }
        .padding()
        
    }
}
