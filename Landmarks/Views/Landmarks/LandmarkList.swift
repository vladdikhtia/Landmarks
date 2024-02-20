//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Vladyslav Dikhtiaruk on 20/02/2024.
//

import SwiftUI

struct LandmarkList: View {
    //The @Environment property wrapper enables you to read the model data of the current view. Adding an environment(_:) modifier passes the data object down through the environment.
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                        .font(.title3)
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
            .animation(.default, value: showFavoritesOnly) 
        } detail: {
            Text("Select a Landmark!")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
