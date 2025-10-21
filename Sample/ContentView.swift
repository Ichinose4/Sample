//
//  ContentView.swift
//  Sample
//
//  Created by 一瀬大輝 on 2025/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (spacing:20){
            Text("こんにちは！")
            
            Text("私は山田太郎です")
            Text("🎵趣味：音楽を聴くこと🎵")
            Text("SwifuUIを使って、いろんなアプリを作ってみたいです！")
            HStack(spacing:16){
                Image(systemName:"ladybug")
                Image(systemName:"ant")
                Image(systemName:"leaf")
            }
        }
    }
}
