//
//  FavoriteButton.swift
//  MSI 2021
//
//  Created by Oleh Kiurchev on 04.05.2021.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isFavourite: Bool
    
    var body: some View {
        Button(action: { isFavourite.toggle() }) {
            Image(systemName: isFavourite ? "heart.fill" : "heart")
                .imageScale(.large)
                .foregroundColor( isFavourite ? Color.red : Color.white)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isFavourite: .constant(true))
    }
}
