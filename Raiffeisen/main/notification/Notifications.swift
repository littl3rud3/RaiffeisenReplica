import SwiftUI

struct Notifications: View {
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: -15) {
            Text(
                "\(CalendarUtil.previousDayInt) \(CalendarUtil.currentMonthGenitive), \(CalendarUtil.previousDayOfWeek)"
            )
            .padding().foregroundColor(.gray)
            ForEach(1...7, id: \.self) { i in
                
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text("Заплатили картой *5700").bold()
                                .font(.system(size: 20))
                            Spacer()
                            Text("15:\(17 - i)").foregroundColor(.gray)
                        }
                        Text("- 1.00 Р в билайн. Теперь на карте 0.00 Р")
                            .font(.system(size: 15))
                    }
                    .padding()
                }
                .background(
                    Color(#colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 1))
                )
                .cornerRadius(10).shadow(radius: 1).padding()
            }
            Spacer()
        }
    }
}

struct RecommendationStack_Previews: PreviewProvider {
    static var previews: some View {
        Notifications()
    }
}
