//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Manoel Filho on 24/04/21.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image("bg")
            .antialiased(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea(.all)
            //.padding()
    }
}

struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}
