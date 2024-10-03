//
//  NewWorkoutView.swift
//  GymSesh
//
//  Created by Aidan Dow on 03/10/2024.
//

import SwiftUI

struct NewWorkoutView: View {
    
    var workouts: [Workout] = []
    
    @State private var suggestions: [String] = ["Push Day", "Pull Day", "Leg Day", "Upper Day"] // State variable for suggestions
    
    @State var newWorkout: Workout = Workout(title: "New Workout")
    
    @State var title: String = "New Workout"

    @State private var isActive: Bool = false // State variable to control navigation

    
    var body: some View {
        VStack {
            
            TitleView()
            
            Text(newWorkout.showDate())
            Spacer()
            
            TextField("New Workout", text: $title)
                .padding() // Add padding inside the text field
                .background(Color.white) // Background color
                .cornerRadius(10) // Rounded corners
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5) // Shadow effect
                .padding(.horizontal) // Horizontal padding outside the text field
            
            Text("Suggestions")
            
            // Suggestions list
            List(suggestions, id: \.self) { suggestion in
                Button(action: {
                    title = suggestion // Set the input text to the selected suggestion
                    suggestions = [] // Clear suggestions after selection
                }) {
                    Text(suggestion) // Show suggestion text
                }
            }

            Spacer()
            
            Button(action: {
                newWorkout.title = title
//                workouts.append(newWorkout)
                isActive = true // Set navigation state to true
            }) {
                Text("Add Workout")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
            }
            
            // NavigationLink to navigate to WorkoutDetailView
            NavigationLink(destination: ContentView(workouts: [newWorkout] + workouts), isActive: $isActive) {
                EmptyView() // Use EmptyView to make NavigationLink invisible
            }
        }
        .padding()
    }
}

struct NewWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        NewWorkoutView()
    }
}
