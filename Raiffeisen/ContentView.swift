import SwiftUI

struct ContentView: View {

    @State private var allProductsClicked = false
    @State private var hideBalances = false
        
    var body: some View {

        //TabView
        NavigationStack {

            ZStack {

                Constants.BACKGROUND.ignoresSafeArea()
                
                ScrollView {

                    Text("Расчетная сумма средств по всем\n продкутам по курсу ЦБ")
                        .lineLimit(2, reservesSpace: true)
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                        .multilineTextAlignment(.center)
                        .padding(.top, -30)
                        
                    StoryView()

                    CardsAndAccounts()

                    AdvertOffer()

                    if !allProductsClicked {
                        NewProduct().padding(.top, 1)
                            .onTapGesture {
                                withAnimation {
                                    allProductsClicked.toggle()
                                }
                            }
                    } else {
                        HStack {
                            Text("Открыть продукт").foregroundColor(.white)
                                .font(.system(size: 18, weight: .bold)).padding(.leading, 20)
                            Spacer()
                            Button {
                                allProductsClicked.toggle()
                            } label: {
                                Label("Скрыть", systemImage: "chevron.up").foregroundColor(.white)
                                    .frame(width: 95, height: 30)
                                    .font(.system(size: 15))
                            }
                            .background(
                                Color(
                                    uiColor: #colorLiteral(
                                        red: 0.3649994731, green: 0.3716383576, blue: 0.3838521838,
                                        alpha: 1))
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .buttonStyle(.plain)

                        }

                        AllProducts()
                    }

                    ApplyMortgage().padding(.top, allProductsClicked ? 10 : 40)
                    HStack{}.frame(height: 20)
                }
                .refreshable {

                }

            }
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbar {

                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        NotificationStack().navigationBarBackButtonHidden(true)
                    } label: {
                        Image("notificationsIcon")
                            .resizeToIcon()
                            .foregroundColor(.white)
                    }
                }

                ToolbarItem(placement: .principal) {

                    VStack {
                        HStack {
                            Button(action: {
                                hideBalances.toggle()
                            }) {
                                Image("hideBalanceIcon")
                                    .resizeToIcon()
                                    .foregroundColor(.white)
                                Text(hideBalances ? "***" : "0 ₽")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25).bold())
                            }
                        }
                    }
                }

                ToolbarItem(placement: .navigationBarLeading) {
                    Constants.EXPENSES_BUTTON()
                }

                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Button(
                            action: {},
                            label: {
                                VStack {
                                    Image("mainIcon")
                                        .resizeToIcon()
                                        .colorMultiply(.black)
                                    Text("Главная")
                                        .font(.custom("Minor Regular", fixedSize: 15))
                                        .colorMultiply(.black)
                                }.background(Color.yellow.frame(width: 100, height: 100).cornerRadius(10))
                            }
                        )
                        .frame(height: 90)

                        Spacer()

                        Button(
                            action: {},
                            label: {
                                VStack {
                                    Image("historyIcon").resizeToIcon()
                                    Text("История").font(.custom("Minor Regular", fixedSize: 15))
                                        .foregroundColor(.gray)
                                }
                            })

                        Spacer()

                        Button(
                            action: {},
                            label: {
                                VStack {
                                    Image("transfersIcon").resizeToIcon()
                                    Spacer(minLength: 10)
                                    Text("Переводы").font(.custom("Minor Regular", fixedSize: 15))
                                        .foregroundColor(.gray)
                                }
                            })

                        Spacer()

                        Button(
                            action: {},
                            label: {
                                VStack {
                                    Image("chatIcon").resizeToIcon()
                                    Spacer()
                                    Text("Чат").font(.custom("Minor Regular", fixedSize: 15))
                                        .foregroundColor(.gray)
                                }
                            })

                        Spacer()

                        Button(
                            action: {},
                            label: {
                                VStack {
                                    Image("moreIcon").offset(y: 5)
                                    Text("Еще").font(.custom("Minor Regular", fixedSize: 15))
                                        .foregroundColor(.gray).padding(.top, 15)
                                }
                            })

                    }
                    .background(.white).frame(width: 430)
                    .padding(.top, 15)
                    .ignoresSafeArea(.all)
                }
            }.toolbarBackground(.white.opacity(0.1), for: .navigationBar)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
