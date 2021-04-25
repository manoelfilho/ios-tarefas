//
//  CheckBoxStyle.swift
//  Devote
//
//  Created by Manoel Filho on 24/04/21.
//

import SwiftUI

struct CheckBoxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .foregroundColor(configuration.isOn ? .green : .primary)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .onTapGesture {
                    configuration.isOn.toggle()
                    if configuration.isOn {
                        //playSound(sound: "sound-tap", type: "mp3")
                        feedback.notificationOccurred(.success)
                    }
                }
            configuration.label
        }//:HStack
    }
}

//MARK: - PREVIEW
struct CheckBoxStyle_Previews: PreviewProvider {
    static var previews: some View {
        Toggle("Label", isOn: .constant(true))
            .toggleStyle(CheckBoxStyle())
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
