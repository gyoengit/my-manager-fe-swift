import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack (spacing: 0) {
            // tab
            TabBar(selectedTab: $selectedTab)
                .frame(maxWidth: .infinity)
            
            // contents
            Group {
                switch(selectedTab) {
                case 0:
                    HomeView()
                case 1:
                    UserView()
                default:
                    NotFoundView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
        }
    }
}

#Preview {
    ContentView()
}

struct TabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            Image(.appLogo)
                .resizable()
                .scaledToFit()
                .padding(8)
                .padding(.leading, 5)
                .onTapGesture {
                    selectedTab = 0
                }
            Spacer()
            Image(systemName: "person.crop.circle.fill")
                .padding(.trailing, 10)
                .onTapGesture {
                    selectedTab = 1
                }
        }
        .background(.white)
        .frame(maxWidth: .infinity, maxHeight: 30)
    }
}
