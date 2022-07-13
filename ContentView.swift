import SwiftUI

struct ContentView: View {
    let appNames = ["ВКонтакте", "My.Games", "Сферум", "Юла", "Самокат", "Ситидрайв", "Облако", "Все аптеки", "Календарь"] 
    let appDescriptions = ["Самая популярная соцсеть и первое суперприложение в России", "Игры для ПК, консолей и смартфонов, в которые играют сотни миллионов геймеров", "Онлайн-платформа для обучения и образовательных коммуникаций", "Сервис объявлений на основе геолокации и интересов", "Онлайн-ретейлер с доставкой товаров за 15 минут", "Каршеринг-сервис в крупнейших российских городах", "Сервис для хранения файлов и совместной работы с ними", "Онлайн-сервис для поиска и заказа лекарств по лучшей цене", "Планирование дня и эффективное управление временем"]
    let appWebLinks = ["https://vk.com/", "https://my.games/", "https://sferum.ru/?p=start", "https://youla.ru/", "https://samokat.ru/", "https://citydrive.ru/", "https://cloud.mail.ru/home/", "https://vseapteki.ru/", "https://calendar.mail.ru/"]
    let appLinks = ["vk://", "my.games://", "sferum://", "youla://", "samokat://", "citydrive://", "cloud.mail://", "vseapteki://", "calendar.mail://"]
    
    let myColors: [Color] = [Color.white, Color.white, Color.purple, Color.purple, Color.white, Color.green, Color.orange, Color.white, Color.orange]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.indigo, .indigo], startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Сервисы ВК")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.black)
                    .padding()
                Spacer()
                
                List {
                    ForEach(0..<self.appNames.count, id: \.self) { number in
                        let serviceUrl = URL(string: self.appWebLinks[number])
                        let appUrl = URL(string: self.appLinks[number])
                        HStack(alignment: .center) {
                            Image(self.appNames[number])
                                .resizable()
                                .frame(width: 80, height: 80)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(myColors[number], lineWidth: 3)
                                )
                                .padding(10)
                            VStack {
                                Text(self.appNames[number])
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .frame(width: 200, height: 20, alignment: .topLeading)
                                Text(self.appDescriptions[number])
                                    .foregroundColor(.white)
                                    .font(.footnote)
                                    .frame(width: 200, height: 60, alignment: .topLeading)
                            }
                        }
                        .background(.mint)
                        .frame(width: 310, height: 100, alignment: .center)
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
                    }
                    .listRowBackground(Color.indigo)
                    .listRowSeparatorTint(.mint)
                }
            }
        }
    }
}

