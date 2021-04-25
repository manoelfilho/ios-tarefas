//
//  BlankView.swift
//  Devote
//
//  Created by Manoel Filho on 24/04/21.
//

import SwiftUI

struct BlankView: View {
    //MARK: - Properties
    var backgroundColor: Color
    var backgroundOpactity: Double
    
    
    //MARK: - Body
    var body: some View {
        
        VStack{
            Spacer()
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center
        )
        .background(backgroundColor)
        .opacity(backgroundOpactity)
        .blendMode(.overlay)
        .edgesIgnoringSafeArea(.all)
    }
}

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView(backgroundColor: Color.black, backgroundOpactity: 0.3)
            .background(BackgroundImageView())
            .background(backgroundGradient.ignoresSafeArea(.all))
    }
}
