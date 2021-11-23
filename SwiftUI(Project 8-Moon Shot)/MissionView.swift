//
//  MissionView.swift
//  SwiftUI(Project 8-Moon Shot)
//
//  Created by Srinivas Sahu on 11/11/21.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember{
        let role:String
        let astronaut:Astronut
    }
    let mission:Mission
    let crew:[CrewMember]
    
    var body: some View {
        GeometryReader{gemoetry in
            ScrollView{
                VStack{
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth:gemoetry.size.width * 0.6)
                        .padding(.top)
                
                    Text("Lauch date: \(mission.formattedLaunchDate)")
                        .font(.title2.monospacedDigit())
                    VStack(alignment: .leading){
                        
                        Rectangle()
                            .frame(height:2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Mission Higlights")
                            .font(.title.bold())
                            .padding(.bottom,5)
                        
                        Text(mission.description)
                        
                        Rectangle()
                            .frame(height:2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom,5)
                        
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            ForEach(crew,id:\.role){crewMember in
                                NavigationLink{
                                    AstronautView(astnonaut: crewMember.astronaut)
                                }label:{
                                    HStack{
                                        Image(crewMember.astronaut.id)
                                            .resizable()
                                            .frame(width: 104, height: 72)
                                            .clipShape(Capsule())
                                            .overlay(
                                            Capsule()
                                                .strokeBorder(.white,lineWidth: 1)
                                            )
                                        
                                        VStack(alignment: .leading) {
                                            Text(crewMember.astronaut.name)
                                                .foregroundColor(.white)
                                                .font(.headline)
                                            Text(crewMember.role)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission:Mission,astronauts:[String:Astronut]){
        self.mission = mission
        self.crew = mission.crew.map{member in
            if let astronaut = astronauts[member.name]{
                return CrewMember(role: member.role, astronaut: astronaut)
            }else{
                fatalError("MIssing \(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions :[Mission] = Bundle.main.decode("missions.json")
    static let astronauts:[String:Astronut] = Bundle.main.decode("astrnonauts.json")
    static var previews: some View {
        MissionView(mission: missions[0],astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
