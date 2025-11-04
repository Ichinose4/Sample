import SwiftUICore
import SwiftUI

struct SampleView: View{
    @State var inputAnswer: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Q.()に入る言葉を答えなさい。")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            
            let questionText = Text("祇園精舎の鐘の声、諸行(")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.gray)
            
            + Text("\(inputAnswer)")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.blue)
            
            + Text(")の響きあり。")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.gray)
            
            Group {
                questionText
            }
            
            TextField("回答を入力してください",text:$inputAnswer)
                .textFieldStyle(.roundedBorder)
        }
        .padding(.all, 30)
    }
}

#Preview {
    SampleView(inputAnswer: "1")
}
