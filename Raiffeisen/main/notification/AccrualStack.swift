import SwiftUI

struct AccrualStack: View {
    
    private let backgroundColor = Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
    
    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            Spacer()
            
            Image("boxIcon")
            Text("Добавьте документ для поиска\n и отслеживания штрафов, налогов,\n счетов ЖКХ и других начислений")
            .bold()
            .multilineTextAlignment(.center)

            
            Spacer()
            Divider()
            
            HStack(spacing: 25) {
                
                Image(systemName: "plus")
                    .background(Circle().fill(backgroundColor).frame(width: 40, height: 40))
                    .padding(.leading, 10)
                Text("Добавить новый документ для проверки начислений")
                    .padding(.trailing, 100)
                Spacer()
            }
            .padding()
        }
    }
}

struct AccrualStack_Previews: PreviewProvider {
    static var previews: some View {
        AccrualStack()
    }
}
