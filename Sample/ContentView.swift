import SwiftUICore
import SwiftUI

struct ContentView: View{
    let favoriteFoods = ["ピザ🍕","寿司🍣","ラーメン","ハンバーガー","アイスクリーム"]
    
    var body: some View{
        NavigationStack{
            List(favoriteFoods, id:\.self){ food in
                Text(food)
                    .font(.title2)
                    .padding(.vertical, 8)
            }
            .navigationTitle("好きな食べ物リスト")
            .navigationTitle("あいうえお")
        }
    }
}
