import SwiftUI

private enum SelectedScreen {
    case RECOMMENDATIONS, NOTIFICATIONS, ACCRUALS
}

struct NotificationStack: View {
    
    @Environment(\.dismiss) private var dismiss

    @State private var selectedButton = SelectedScreen.RECOMMENDATIONS
    
    private let backgroundColor = Color(
        #colorLiteral(
            red: 0.9530182481, green: 0.9492809176, blue: 0.9597333074, alpha: 1))

    var body: some View {

        NavigationStack {

            HStack(alignment: .center, spacing: -22) {

                Button {
                    selectedButton = .RECOMMENDATIONS
                } label: {
                    Text("Рекомендуем")
                        .padding()
                        .background(
                            selectedButton == .RECOMMENDATIONS
                                ? selectedButtonBackground()
                                : unselectedButtonBackground()
                        )
                        .font(.system(size: 15))
                        .foregroundColor(selectedButton == .RECOMMENDATIONS ? .black : .gray)
                        .padding()

                }

                Button {
                    selectedButton = .NOTIFICATIONS
                } label: {
                    Text("Уведомления")
                        .padding()
                        .background(
                            selectedButton == .NOTIFICATIONS
                                ? selectedButtonBackground()
                                : unselectedButtonBackground()
                        )
                        .font(.system(size: 15))
                        .foregroundColor(selectedButton == .NOTIFICATIONS ? .black : .gray)
                        .padding()
                }

                Button {
                    selectedButton = .ACCRUALS
                } label: {
                    Text("Начисления")
                        .padding()
                        .background(
                            selectedButton == .ACCRUALS
                                ? selectedButtonBackground()
                                : unselectedButtonBackground()
                        )
                        .font(.system(size: 15))
                        .foregroundColor(selectedButton == .ACCRUALS ? .black : .gray)
                        .padding()
                }

            }.frame(maxWidth: .infinity).background(Constants.BACKGROUND)
            
            VStack {
                
                switch selectedButton {
                case .RECOMMENDATIONS:
                    Image("creditRating")
                        .resizable()
                        .frame(height: 110)
                        .shadow(radius: 1)
                    
                    Image("relevantInvestments")
                        .resizable()
                        .frame(height: 300)
                        .shadow(radius: 10)
                    
                    Spacer()
                case .NOTIFICATIONS: Notifications()
                case .ACCRUALS: AccrualStack()
                }
            }
                .cornerRadius(20)
                .ignoresSafeArea()
            .background(backgroundColor)
            .padding(.top, 5)
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "arrow.left").foregroundColor(.white)
                        .onTapGesture {
                            dismiss()
                        }
                }
                
                ToolbarItem(placement: .principal) {
                    Text("Входящие").font(.title3).foregroundColor(.white).bold()
                }
                
            }
            .toolbarBackground(Constants.BACKGROUND, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
        }.navigationBarBackButtonHidden(true)
    }
    
    private func selectedButtonBackground() -> AnyView {
        AnyView(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(.yellow, lineWidth: 2)
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white))
                .frame(height: 35))
    }
    
    private func unselectedButtonBackground() -> AnyView {
        AnyView(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(.gray, lineWidth: 1)
                .frame(height: 35))
    }
}

struct NotificationStack_Previews: PreviewProvider {
    static var previews: some View {
        NotificationStack()
    }
}
