import SwiftUI

struct AllProducts: View {

    var body: some View {
        
        //DisclosureGroup
        VStack(spacing: 10) {
            
            Group {
                SectionStack(systemImageName: "plus", firstLine: "Новый продукт")
                SectionStack(imageName: "creditIcon", firstLine: "Оформить кредит", secondLine: "на важные цели")
                SectionStack(imageName: "newCardIcon", firstLine: "Новая карта")
                SectionStack(imageName: "newAccountIcon", firstLine: "Новый счёт", secondLine: "в рублях и валюте")
                SectionStack(imageName: "contributionIcon", firstLine: "Накопительный счет или вклад")
                SectionStack(imageName: "insuranceIcon", firstLine: "Оформить страховку", secondLine: "для себя и семьи")
            }
            
            Group {
                SectionStack(imageName: "mortgageIcon", firstLine: "Оформить ипотеку", showButton: true)
                SectionStack(imageName: "IISIcon", firstLine: "Открыть ИИС", showButton: true)
                SectionStack(imageName: "strategyIcon", firstLine: "Открыть Стратегию", showButton: true)
                SectionStack(imageName: "pifIcon", firstLine: "Открыть паи ПИФ")
                SectionStack(imageName: "brokerageAccountIcon", firstLine: "Открыть брокерский счёт")
                SectionStack(imageName: "businessAccountIcon", firstLine: "Открыть счёт для бизнеса")
            }
        }.background(.black)
    }
}

struct AllProducts_Previews: PreviewProvider {
    static var previews: some View {
        AllProducts()
    }
}
