//
//  SampleApp.swift
//  Sample
//
//  Created by 一瀬大輝 on 2025/10/21.
//

import SwiftUI
@main
struct TodoListApp: App{   // ← アプリ全体の入口（ここに @main！）
    var body: some Scene {
        WindowGroup {
            MoodDiaryView()   // ← 表示したい最初の画面
        }
    }
}
struct MoodDiary: Identifiable{
    var id = UUID()
    var content: String
    var mood: Mood
}

enum Mood: String{
    case good = "☺️良い"
    case normal = "😑普通"
    case bad = "😒悪い"
}

struct MoodDiaryView: View{
    @State var diaryList: [MoodDiary] = [
        .init(content: "良い天気だった！", mood:.good)
    ]
    var body: some View{
        NavigationStack{
            List(diaryList) { diary in
                HStack(spacing: 8){
                    Text(diary.mood.rawValue)
                    Spacer()
                    Text(diary.content)
                }
                .padding(8)
            }
            .navigationTitle("日記")
        }
    }
}
#Preview{
    MoodDiaryView()
}

