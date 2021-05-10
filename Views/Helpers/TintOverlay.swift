//
//  TintOverlay.swift
//  MSI 2021
//
//  Created by Oleh Kiurchev on 11.05.2021.
//

import SwiftUI

struct TintOverlay: View {
    
    var colors: [Color] = [
        Color(red: 37/255, green: 37/255, blue: 37/255, opacity: 0.1),
        Color(red: 37/255, green: 37/255, blue: 37/255, opacity: 0.2),
        Color(red: 37/255, green: 37/255, blue: 37/255, opacity: 0.6),
        Color(red: 37/255, green: 37/255, blue: 37/255, opacity: 0.8),
        Color(red: 37/255, green: 37/255, blue: 37/255, opacity: 0.9)
    ]

    var body: some View {
            Text("")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(
                        gradient: Gradient(colors: colors),
                        startPoint: .top,
                        endPoint: .bottom)
        )
    }
}

struct TintOverlay_Previews: PreviewProvider {
    static var previews: some View {
        TintOverlay()
    }
}
