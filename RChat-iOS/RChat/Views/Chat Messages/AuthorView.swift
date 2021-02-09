//
//  AuthorView.swift
//  RChat
//
//  Created by Andrew Morgan on 09/02/2021.
//

import SwiftUI
import RealmSwift

struct AuthorView: View {
    @FetchRealmResults(Chatster.self) var chatsters
    let userName: String
    
    var chatster: Chatster? {
        chatsters.filter("userName = %@", userName).first
    }
    
    private enum Dimensions {
        static let authorHeight: CGFloat = 25
        static let padding: CGFloat = 4
    }
    
    var body: some View {
        if let author = chatster {
            HStack {
                if let photo = author.avatarImage {
                    AvatarThumbNailView(photo: photo, imageSize: Dimensions.authorHeight)
                }
                if let name = author.displayName {
                    Text(name)
                    .font(.caption)
                } else {
                    Text(author.userName)
                        .font(.caption)
                }
                Spacer()
            }
            .frame(maxHeight: Dimensions.authorHeight)
            .padding(Dimensions.padding)
        }
    }
}

//struct AuthorView_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthorView()
//    }
//}
