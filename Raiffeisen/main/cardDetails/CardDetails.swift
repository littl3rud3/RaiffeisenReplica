import Introspect
import SwiftUI

private enum SelectedScreen {
    case INFO, HISTORY, TRANSFER
}

struct CardDetails: View {
    
    @Environment(\.dismiss) private var dismiss

    @State private var selectedScreen = SelectedScreen.TRANSFER
    
    private let CASHBACK_BACKGROUND = Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))

    let TO_MYSELF = [
        Tile(imageName: "cardToCard", text: "С карты на карту"),
        Tile(imageName: "betweenAccounts", text: "Между своими счетами"),
        Tile(imageName: "fromAnotherBank", text: "Со своего счета в другом банке"),
    ]

    let TO_PEOPLE = [
        Tile(imageName: "byCardNumber", text: "По номеру карты"),
        Tile(imageName: "byPhone", text: "По номеру телефона"),
        Tile(imageName: "electronicMoney", text: "На электронный кошелек"),
        Tile(imageName: "moneyDrop", text: "MoneyDrop"),
    ]

    let SERVICE_PAYMENTS = [
        Tile(imageName: "qrCode", text: "По QR-коду"),
        Tile(imageName: "mobile", text: "Мобильная связь"),
        Tile(imageName: "HCS", text: "ЖКУ"),
        Tile(imageName: "internet", text: "Интернет"),
        Tile(imageName: "telephony", text: "Телефония"),
        Tile(imageName: "transport", text: "Транспорт"),
        Tile(imageName: "electronicMoney", text: "Электронные деньги"),
        Tile(imageName: "tv", text: "Телевидение"),
        Tile(imageName: "receiptData", text: "По данным из квитанции"),
        Tile(imageName: "other", text: "Другое"),
    ]

    var body: some View {

        NavigationStack {
            VStack {
                Text("\(0.00.smallDecimal(font: 20))")
                    .foregroundColor(.white)
                    .font(.title)
                    .font(.custom("Solomon", size: 15))
                    .bold()
                HStack {
                    Label("Кэшбэк за \(CalendarUtil.currentMonth) 6,00 ₽", systemImage: "sparkles")
                        .foregroundColor(.white)
                    //                    Text("Кэшбэк за \(CalendarUtil.currentMonth) 24,56 Р")
                }.padding()
                    .background(
                    RoundedRectangle(cornerRadius: 12).fill(CASHBACK_BACKGROUND).frame(height: 35))
            }
//            .padding()
            .padding(.bottom)
            .frame(maxWidth: .infinity).background(Constants.BACKGROUND)

            VStack {
                ScrollView {
                    VStack(spacing: 40) {

                        VStack(alignment: .leading) {
                            Text("Себе").foregroundColor(.gray).bold().padding(.leading)
                            VStack(alignment: .leading) {
                                FourTiles(array: TO_MYSELF)
                            }
                            .background(.white)
                        }

                        VStack(alignment: .leading) {
                            Text("Людям").foregroundColor(.gray).bold().padding(.leading)
                            VStack(alignment: .center) {
                                FourTiles(array: TO_PEOPLE)
                            }
                            .background(.white)
                        }

                        VStack(alignment: .leading) {
                            Text("Оплата услуг").foregroundColor(.gray).bold().padding(.leading)
                            VStack(alignment: .center) {
                                FourTiles(array: SERVICE_PAYMENTS)
                            }
                            .background(.white)
                        }

                    }
                    .padding(.top, 80)
                }
            }
            .introspectScrollView { scrollView in
                scrollView.bounces = false
            }
            .overlay(
                alignment: .top,
                content: {
                    HStack(alignment: .center) {

                        Button {
                            selectedScreen = .INFO
                        } label: {
                            VStack {
                                Text("Инфо").foregroundColor(.gray).bold()
                                if selectedScreen == .INFO {
                                    Color.yellow.frame(height: 2).offset(y: 12)
                                } else {
                                    Color.clear.frame(height: 2).offset(y: 12)
                                }
                            }
                        }

                        Button {
                            selectedScreen = .HISTORY
                        } label: {
                            VStack {
                                Text("История").foregroundColor(.gray).bold()
                                if selectedScreen == .HISTORY {
                                    Color.yellow.frame(height: 2).offset(y: 12)
                                } else {
                                    Color.clear.frame(height: 2).offset(y: 12)
                                }
                            }
                        }

                        Button {
                            selectedScreen = .TRANSFER
                        } label: {
                            VStack {
                                Text("Перевести").foregroundColor(.gray).bold()
                                if selectedScreen == .TRANSFER {
                                    Color.yellow.frame(height: 2).offset(y: 12)
                                } else {
                                    Color.clear.frame(height: 2).offset(y: 12)
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .frame(height: 60)
                    .background(.white)
                    .shadow(radius: 1)
                }
            )
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                        .onTapGesture {
                            dismiss()
                        }
                        
                }
                
                ToolbarItem(placement: .principal) {
 
                    VStack(spacing: 0) {
                        Text("Цифровая карта").foregroundColor(.white).bold()
                            .font(.system(size: 20))

                        Label {
                            Text("цифровая, *5191").font(.system(size: 15))
                        } icon: {
                            Image("cloudIcon")
                                .renderingMode(.template)
                        }
                        .labelStyle(.titleAndIcon)
                        .foregroundColor(.gray)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Constants.EXPENSES_BUTTON()
                }
                
            }
            .background(
                Color(
                    #colorLiteral(
                        red: 0.9538205266, green: 0.9488542676, blue: 0.9575523734, alpha: 1))
            )
            .toolbarBackground(Constants.BACKGROUND, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct CardDetails_Previews: PreviewProvider {
    static var previews: some View {
        CardDetails()
    }
}
