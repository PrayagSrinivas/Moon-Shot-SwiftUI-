//
//  AstronautView.swift
//  SwiftUI(Project 8-Moon Shot)
//
//  Created by Srinivas Sahu on 11/11/21.
//

import SwiftUI

struct AstronautView: View {
    let astnonaut:Astronut
    
    var body: some View {
        ScrollView{
            VStack{
                Image(astnonaut.id)
                    .resizable()
                    .scaledToFit()
                Text(astnonaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astnonaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronaut:[String:Astronut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        AstronautView(astnonaut: astronaut["armstronng"]!)
    }
}
