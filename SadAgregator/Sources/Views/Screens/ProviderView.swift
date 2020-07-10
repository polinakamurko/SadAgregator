//
//  ProviderView.swift
//  SadAgregator
//
//  Created by Полина on 15.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct ProviderView: View {
  
  @ObservedObject var viewModel: ProviderViewModel
  
  @State var showProviderConditions = false
  
  var body: some View {
    List {
      Section {
        VStack(alignment: .leading) {
          HStack {
            Image("SellerPhoto")
              .frame(width: 60, height: 60)
            
            VStack(alignment: .leading, spacing: 5) {
              Text(viewModel.provider.name?.capitalized ?? "")
                .font(.headline)
              VStack(alignment: .leading, spacing: 5) {
                if viewModel.provider.revsInfo?.rate != nil {
                  HStack(spacing: 0) {
                    Group {
                      Text(viewModel.provider.revsInfo?.rate ?? "0")
                        .padding(.trailing, 4)
                      ForEach(0..<(viewModel.provider.revsInfo?.filledStars ?? 0)) { _ in
                        Image(systemName: "star.fill")
                          .padding(.horizontal, 2)
                      }
                      
                      if (viewModel.provider.revsInfo?.hasHalfStart ?? false) {
                        Image(systemName: "star.lefthalf.fill")
                          .padding(.horizontal, 2)
                      }
                      
                      ForEach(0..<(viewModel.provider.revsInfo?.emptyStars ?? 0)) { _ in
                        Image(systemName: "star")
                          .padding(.horizontal, 2)
                      }
                    }
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(Color(UIColor.systemGray2))
                  }
                }
                
                HStack(spacing: 0) {
                  Group {
                    Image(systemName: "star.fill")
                      .padding(.trailing, 4)
                    
                    Text(viewModel.provider.revsInfo?.reviews ?? "0")
                      .padding(.trailing, 8)
                    
                    Image(systemName: "photo.fill.on.rectangle.fill")
                      .padding(.trailing, 4)
                    
                    Text("\(viewModel.provider.revsInfo?.photosInReview ?? "0") фото")
                  }
                  .font(.system(size: 10))
                  .foregroundColor(Color(UIColor.systemGray2))
                }
              }
            }
            .padding(.top)
          }
          .padding(.horizontal)
          
          VStack {
            ZStack {
              Color(UIColor.systemGray6)
                .frame(height: 34)
              Text("Условия сотрудничества")
              Button(action: {
                self.showProviderConditions.toggle()
              }) {
                Image(systemName: showProviderConditions ? "chevron.up" : "chevron.down")
                  
                  .frame(maxWidth: .infinity, alignment: .trailing)
                  .padding(.trailing)
              }
              .buttonStyle(BorderlessButtonStyle())
              .foregroundColor(Color(UIColor.darkGray))
            }
            if showProviderConditions {
              Text(viewModel.provider.terms ?? "")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom)
              
            }
          }
          .background(Color(UIColor.systemGray6))
          
        }
        .listRowInsets(EdgeInsets())
        
        Section {
          DetailItemView(imageName: "vk_icon", mainText: viewModel.provider.vkLink ?? "")
          DetailItemView(systemImageName: "location", mainText: "Контейнер", detailedText: viewModel.provider.place ?? "")
          DetailItemView(systemImageName: "phone", mainText: "Телефон", detailedText: viewModel.provider.phoneNumber)
          DetailItemView(systemImageName: "calendar", mainText: "Дата регистрации VK", detailedText: viewModel.provider.regDt ?? "")
          DetailItemView(systemImageName: "person.2", mainText: "Охват", detailedText: viewModel.provider.pop ?? "")
        }
        
        Section {
          HStack {
            Text("Оценить поставщика")
            Spacer()
            Group {
              Image(systemName: "star.fill")
              Image(systemName: "star.fill")
              Image(systemName: "star.fill")
              Image(systemName: "star")
              Image(systemName: "star")
            }
            .foregroundColor(Color(red: 255/255, green: 204/255, blue: 71/255))
          }
          
          NavigationLink(destination: LeaveFeedbackDetailView()) {
            DetailItemView(mainText: "Оставить отзыв")
          }
        }
        
        Section {
          VStack {
            // TODO: - Change providerID to viewModel.providerID
            NavigationLink(destination: FeedbackDetailView(viewModel: FeedbackViewModel(providerID: "3"))) {
              Text("См. все")
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .foregroundColor(.blue)
            .padding(.top, 8)
            FeedbackItemView(feedback: Reviews())
          }
          FeedbackItemView(feedback: Reviews())
          FeedbackItemView(feedback: Reviews())
        }
      }
      .listStyle(GroupedListStyle())
    }
    .onAppear(perform: viewModel.fetchProvider)
  }
}

struct ProviderView_Previews: PreviewProvider {
  static var previews: some View {
    ProviderView(viewModel: ProviderViewModel(providerID: "3"))
  }
}
