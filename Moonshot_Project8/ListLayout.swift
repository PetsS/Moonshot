//
//  ListLayout.swift
//  Moonshot_Project8
//
//  Created by Peter Szots on 29/05/2022.
//

import SwiftUI

struct ListLayout: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label : {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                            .shadow(color: .lightBackground, radius: 10)
                        
                        VStack (alignment: .leading) {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                                .padding(.bottom)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    }
                }
            }
            .listStyle(.plain)
            .listRowBackground(Color.darkBackground)
        }  
    }
}

struct ListLayout_Previews: PreviewProvider {
    static var previews: some View {
        ListLayout()
    }
}
