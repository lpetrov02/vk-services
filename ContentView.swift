import SwiftUI

struct ContentView: View {
    let appNames = ["ВКонтакте", "My.Games", "Сферум", "Юла", "Самокат", "Ситидрайв", "Облако", "Все аптеки", "Календарь"] 
    let appDescriptions = ["Самая популярная соцсеть и первое суперприложение в России", "Игры для ПК, консолей и смартфонов, в которые играют сотни миллионов геймеров", "Онлайн-платформа для обучения и образовательных коммуникаций", "Сервис объявлений на основе геолокации и интересов", "Онлайн-ретейлер с доставкой товаров за 15 минут", "Каршеринг-сервис в крупнейших российских городах", "Сервис для хранения файлов и совместной работы с ними", "Онлайн-сервис для поиска и заказа лекарств по лучшей цене", "Планирование дня и эффективное управление временем"]
    let appLinks = ["https://vk.com/", "https://my.games/", "https://sferum.ru/?p=start", "https://youla.ru/", "https://samokat.ru/", "https://citydrive.ru/", "https://cloud.mail.ru/home/", "https://vseapteki.ru/", "https://calendar.mail.ru/"]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.black, .indigo], startPoint: .bottom, endPoint: .top)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Сервисы ВК")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.black)
                    .padding()
                
                ForEach(0..<self.appNames.count, id: \.self) { number in
                    let serviceUrl = URL(string: self.appLinks[number])
                    Link(destination: serviceUrl!) {
                        HStack {
                            Image(self.appNames[number])
                                .resizable()
                                .frame(width: 80, height: 80)
                                .clipShape(RoundedRectangle(cornerRadius: 30))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.teal, lineWidth: 5)
                                )
                                .padding(10)
                            VStack {
                                Text(self.appNames[number])
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .frame(width: 200, height: 20, alignment: .topLeading)
                                Text(self.appDescriptions[number])
                                    .foregroundColor(.teal)
                                    .font(.footnote)
                                    .frame(width: 200, height: 60, alignment: .topLeading)
                            }
                        }
                    }
                }
            }
        }
    }
}

