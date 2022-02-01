import SwiftUI

struct ProductCardView: View {
    
    let productName: String
    let BrandName: String
    let price: Double
    let imageName: String
    let date: String
    let location: String
    
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top, spacing: 10){
                AsyncImage(url: URL(string: imageName))
                    //.resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(5)
                VStack(alignment: .leading, spacing: 5){
                    Text(productName)
                        .font(.title2)
                    Text(BrandName)
                        .opacity(0.8)
                    Text("$\(price)")
                }
                .foregroundColor(Color.white)
            }
            HStack {
                Text(location)
                Spacer()
                Text("Date: \(date)")
                    .font(.callout)
            }
        }
        .padding()
        .foregroundColor(Color.white)
        .frame(width: UIScreen.main.bounds.width/1.4, height: UIScreen.main.bounds.width/2)
        .background(Color.black)
        .cornerRadius(10)
    }
}


