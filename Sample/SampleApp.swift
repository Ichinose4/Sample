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
    
    var id: String {self.rawValue}
}

struct MoodDiaryView: View{
    @State var diaryList: [MoodDiary] =
    [MoodDiary(content: "良い天気だった!", mood: .good)]
    @State var isPresented: Bool = false
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
            .toolbar {
                Button(
                    action: {
                        isPresented = true
                    },
                    label: {
                        Image(systemName: "plus")
                    }
                )
            }
            .sheet(isPresented: $isPresented) {
                MoodDiaryFormView(diaryList: $diaryList)
            }
        }
    }
}
struct MoodDiaryFormView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var diaryList: [MoodDiary]
    
    @State var selectedMood: Mood = .normal
    @State var inputDiaryText: String = ""
    
    let moods = [Mood.good, Mood.normal, Mood.bad]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 36) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("今日の気分は？")
                        .font(.headline)
                        .bold()
                    
                    Picker("気分を選んでください", selection: $selectedMood) {
                        ForEach(moods, id: \.self) { mood in
                            Text(mood.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("今日のひとこと")
                        .font(.headline)
                    
                    TextField("ここに入力してください", text: $inputDiaryText)
                        .textFieldStyle(.roundedBorder)
                }
                
                Button(
                    action: {
                        let newDiary = MoodDiary(content: inputDiaryText, mood: selectedMood)
                        diaryList.append(newDiary)
                        dismiss()
                    },
                    
                    label: {
                        Text("保存")
                            .font(.headline)
                            .padding(16)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                )
                
                Spacer()
            }
            .padding(20)
            .navigationTitle("入力フォーム")
        }
    }
}
            
                        
                    
                    
#Preview{
    MoodDiaryFormView(diaryList: .constant([]))
}

    
