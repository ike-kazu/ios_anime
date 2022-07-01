//
//  DayLabel.swift
//  AnimeiOSApp
//
//  Created by Fumiya Tanaka on 2022/06/30.
//

import SwiftUI
import Domain

struct DayLabel: View {

    let dayOfWeek: DayOfWeek
    let isSelected: Bool
    let onPressed: () -> Void

    var body: some View {
        Button {
            onPressed()
        } label: {
            Text(dayOfWeek.label)
                .foregroundColor(Color.white)
                .bold()
        }
        .padding(.all, 10)
        .background(isSelected ? Color.accentColor : .secondary)
        .clipShape(Circle())
    }
}

struct DayLabel_Previews: PreviewProvider {
    static var previews: some View {
        DayLabel(dayOfWeek: .sunday, isSelected: false) {
        }
    }
}
