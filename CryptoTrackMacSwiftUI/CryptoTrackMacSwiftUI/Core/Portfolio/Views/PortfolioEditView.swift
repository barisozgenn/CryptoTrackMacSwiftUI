//
//  PortfolioEditView.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 22.09.2022.
//

import SwiftUI

struct PortfolioEditView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>

    @StateObject var viewModel : PortfolioViewModel
    let cryptoCurrency : CryptoCurrency
    
    @State private var currencyAmountText : String = "0.00"
    @State private var currencyPriceText : String = "18789.54"
    
    let transactionTypeBuy = "b"
    let transactionTypeSell = "s"
    
    @State private var transactionType = "b"
    @State private var totalHoldings : Double = 0
    
    /*init(cryptoCurrency : CryptoCurrency){
        self.cryptoCurrency = cryptoCurrency
       // self.currencyPriceText = String(format: "%.2f", cryptoCurrency.currentPrice)
    }*/
    var body: some View {
        ZStack{
            ScrollView{
                
                PortfolioCellView(cryptoCurrency: cryptoCurrency)
                    .padding(.top)
                
                Divider()
                
                portfolioEditSection
                
                
                portfolioResultSection
                
                
            }
            .toolbar(content: {
                ToolbarItem(placement: .secondaryAction) {
                
                    HStack {
                        CurrencyImageView(cryptoCurrency: cryptoCurrency)
                            .frame(width: 32, height: 32)
                            .foregroundColor(.orange)
                        Text(cryptoCurrency.name).font(.headline)
                    }
                }
            })
           
        }
        
        
    }
}

extension PortfolioEditView {
    
    private func getUnitPrice() -> Double {
        if let unitPrice = Double(currencyPriceText) {
            return unitPrice
        }
        return 0
    }
    private func getAmount() -> Double {
        if let amount = Double(currencyAmountText) {
            return amount
        }
        return 0
    }
    
    private func getTotalCost() -> Double {
        if let amount = Double(currencyAmountText),
           let price = Double(currencyPriceText) {
            return amount * price
        }
        return 0
    }
    private func getTotalHolding() -> Double {
        if let amount = Double(currencyAmountText) {
            var total = totalHoldings
            if transactionType == transactionTypeBuy{
                total += amount
            } else if transactionType == transactionTypeSell{
                total -= amount
            }
                        
            return total
        }
        return 0
    }
    
    private func canBeSaved() -> Bool {
        if getTotalHolding() > 0 && getTotalCost() > 0 { return true}
        return false
    }
    
    private var portfolioEditSection: some View {
        VStack(alignment: .leading, spacing: 10){
            
            VStack(spacing: 20){
                
                // SELL & BUY
                Menu {
                    Button {
                        transactionType = transactionTypeBuy
                    } label: {
                        Text("BUY")
                        Image(systemName: "arrow.up.right.circle")
                    }
                    Button {
                        transactionType = transactionTypeSell
                    } label: {
                        Text("SELL")
                        Image(systemName: "arrow.down.right.circle")
                    }
                } label: {
                    HStack{
                        Text("Transaction Type")
                        
                        Spacer()
                        
                        HStack{
                            Text(transactionType == transactionTypeBuy ? "BUY" : "SELL")
                                .fontWeight(.bold)
                            Image(systemName: transactionType == transactionTypeBuy ? "arrow.up.right.circle" : "arrow.down.right.circle")
                        }
                        .foregroundColor(transactionType == transactionTypeBuy ? Color.theme.currencyGreenColor : Color.theme.currencyRedColor)
                        
                    }
                }
                
                Divider()
                
                // PRICE
                HStack{
                    Text("Currency Price")
                    
                    Spacer()
                    
                    TextField(String(format: "%.2f", cryptoCurrency.currentPrice),
                              text: $currencyPriceText)
                    .textFieldStyle(.plain)
                    .multilineTextAlignment(.trailing)
                }
                
                Divider()
                
                // AMOUNT
                HStack{
                    Text("Transaction Amount")
                    
                    Spacer()
                    
                    TextField("Ex: 1.29",
                              text: $currencyAmountText)
                    .textFieldStyle(.plain)

                    .multilineTextAlignment(.trailing)
                }
                
            }.padding()
            
            
        }
        .foregroundColor(Color.theme.primaryTextColor)
    }
    
    private var portfolioResultSection: some View {
        VStack(alignment: .leading, spacing: 10){
            
            VStack(spacing: 20){
                
                // Transaction Value
                HStack{
                    Text("Transaction Value")
                    Spacer()
                    Text(getTotalCost().toUSDCurrencyFormatted())
                        .frame(alignment: .trailing)
                    
                }
                
                Divider()
                
                // AMOUNT
                HStack{
                    Text("Total Holding")
                    
                    Spacer()
                    
                    Text(String(format: "%.3f", getTotalHolding()))
                        .frame(alignment: .trailing)
                }
                
                Divider()
                
                // Unit Cost
                HStack{
                    Text("Unit Cost")
                    
                    Spacer()
                    
                    Text(getTotalCost().toUSDCurrencyFormatted())
                        .frame(alignment: .trailing)
                }
                
                Divider()
                
                HStack{
                    Spacer()
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity,
                            minHeight: 40,
                            maxHeight: .infinity)
                    
                    portfolioSaveButton
                }
               
                
            }.padding()
            
            
        }
        .foregroundColor(.gray)
        .background(Color.theme.appBackgroundColor)
    }
    
    private var portfolioSaveButton: some View {
        
        
        
        Button(action: {
            if canBeSaved() {
                
                viewModel.editPortfolio(
                    currency: cryptoCurrency,
                    unitPrice: getUnitPrice(),
                    amount: getAmount(),
                    trancastionType: transactionType,
                    crudType: .add)
                
                self.presentationMode.wrappedValue.dismiss()
            }
        },
               label: {
           
            HStack{
                if canBeSaved() {
                    Image(systemName: "checkmark")
                }
                Text("Save".uppercased())
                    .fontWeight(.bold)
            }
            .padding(.all, 14)
            .background(canBeSaved() ? Color.theme.currencyGreenColor : .gray)
            .foregroundColor(.white)
            .cornerRadius(4)
            .opacity(canBeSaved() ? 1 : 0.3)
        }
            )
        .buttonStyle(.borderless)
    }
}

struct PortfolioEditView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioEditView(viewModel: PortfolioViewModel(), cryptoCurrency: dev.cryptoCurrency)
    }
    
    
}
