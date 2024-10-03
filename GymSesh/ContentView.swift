//
//  ContentView.swift
//  GymSesh
//
//  Created by Aidan Dow on 03/10/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State public var workouts: [Workout] = [Workout(title: "Workout 3"), Workout(title: "Workout2")]
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                TitleView()
                
                List {
                    ForEach(workouts, id: \.self) { workout in
                        NavigationLink(destination: WorkoutDetailView(workout: workout)) {
                            
                            HStack {
                                Text(workout.show())
                                Spacer()
                                Text(workout.showDate())
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        
                    }
                }
                
                NavigationLink(destination: NewWorkoutView(workouts: workouts)) {
                    Text("New Workout?")
                }
                .padding() // Add padding inside the text field
                .background(Color.white) // Background color
                .cornerRadius(10) // Rounded corners
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5) // Shadow effect
                .padding(.horizontal) // Horizontal padding outside the text field

            }
            .padding()
            .navigationBarBackButtonHidden(true) // Hide the back button
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Workout : Hashable{
 
    var date: Date
    var title: String
    var comments: String = ""
    
    
    init(title: String) {
        self.date = Date()
        self.title = title
    }
    
    func show() -> String {
        return title
    }
    
    func showDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: date)
    }
}
