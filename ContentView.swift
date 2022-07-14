import SwiftUI


struct ContentView: View {
    @State var vkServices: [Services] = []
    
    func loadServices() {
        self.vkServices = []
        JsonParser().load() { appsInfo in
            for appInfo in appsInfo.body.services {
                self.vkServices.append(appInfo)
            }
        }
    }
    
    let myColors: [Color] = [Color.white, Color.white, Color.purple, Color.purple, Color.white, Color.green, Color.orange, Color.white, Color.orange]
    
    let mySymbols: [String] = ["network", "gamecontroller", "brain.head.profile"]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.indigo, .indigo], startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Image(systemName: "chevron.right")
                        .font(.title)
                        .foregroundColor(Color.mint)
                        .padding()
                    Spacer()
                    Text("Сервисы ВК")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.black)
                        .padding()
                    Spacer()
                    Button("Update") {
                        self.loadServices()
                    }
                    .padding()
                }
                List (0..<self.vkServices.count, id: \.self){ number in
                    let serviceUrl = URL(string: self.vkServices[number].link)
                    let iconUrl = URL(string: self.vkServices[number].icon_url)
                    HStack(alignment: .center) {
                        AsyncImage(url: iconUrl!) {image in
                            image.resizable()
                        } placeholder: {
                            myColors[number % myColors.count]
                        }
                        .frame(width: 80, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .overlay(RoundedRectangle(cornerRadius: 30) .stroke(myColors[number % myColors.count], lineWidth: 3)
                        )
                        .padding(10)
                        
                        VStack(alignment:.leading) {
                            Text(self.vkServices[number].name)
                                .foregroundColor(.white)
                                .font(.headline)
                            Text(self.vkServices[number].description)
                                .foregroundColor(.white)
                                .font(.footnote)
                        }
                        Spacer()
                        Image(systemName: "arrow.right")
                            .font(.title)
                            .foregroundColor(Color(.white))
                            .padding(3)
                    }
                    .background(.mint)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.white, lineWidth: 2)
                    )
                    .padding(5)
                    .onTapGesture {
                        if UIApplication.shared.canOpenURL(serviceUrl!) {
                            UIApplication.shared.open(serviceUrl!)
                        } else {
                            UIApplication.shared.open(serviceUrl!)
                        }
                    }
                    .listRowBackground(Color.indigo)
                    .listRowSeparatorTint(.mint)
                }
                .listStyle(GroupedListStyle())
                .onAppear {
                    self.loadServices()
                }
            }
        }
    }
}
