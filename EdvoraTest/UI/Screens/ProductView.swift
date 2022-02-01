import SwiftUI

struct ProductView: View {
    @StateObject var productViewModelInteractor = ProductVM()
    @State var elementCount = 0
    var body: some View {
        ZStack{
            Color(ProductConstants.backgroundColor)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading){
                Text(ProductConstants.edvoraTga)
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                ScrollView(showsIndicators: false){
                    ForEach(productViewModelInteractor.products.indices, id: \.self){ index in
                        VStack(alignment: .leading, spacing: 10){
                            Text(productViewModelInteractor.products[index].product_name)
                                .foregroundColor(Color.white)
                                .font(.title2)
                                .padding(.horizontal, 10)
                            CustomDivider()
                            ScrollView(.horizontal) {
                                HStack(spacing: 20) {
                                    ForEach(sameProductNameObjects(from: productViewModelInteractor.products, index: index).indices, id: \.self) { horizontalIndex in
                                        let sameProduct = sameProductNameObjects(from: productViewModelInteractor.products, index: index)
                                        
                                        ProductCardView(
                                            productName: sameProduct[horizontalIndex].product_name,
                                            BrandName: sameProduct[horizontalIndex].brand_name ,
                                            price: sameProduct[horizontalIndex].price ,
                                            imageName: sameProduct[horizontalIndex].image ,
                                            date: sameProduct[horizontalIndex].date,
                                            location: sameProduct[horizontalIndex].address.city )
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onReceive(productViewModelInteractor.$products, perform: { output in
            for out in output{
                print(out.product_name)
            }
        })
        .onAppear(perform: {
            productViewModelInteractor.jsonParse(from: ProductConstants.urlToFetchFrom)
        })
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}

func sameProductNameObjects(from productObject: [ProductListModel], index: Int) -> [ProductListModel] {
    let filteredReminder = productObject[index]
    let sameProductName = productObject.filter({ $0.product_name == filteredReminder.product_name })
    return sameProductName
}


