//
//  DetailView.swift
//  CinemaApp
//
//  Created by Miguel Saravia on 20/12/24.
//

import SwiftUI
import Kingfisher

struct DetailView: View {
  @ObservedObject var viewModel = DetailViewModel()
  private var moviewId: String
  @State private var isLike = false
  
  init(movieId: String) {
    self.moviewId = movieId
  }
  
  var poster: String {
    viewModel.detailItem.poster ?? ""
  }
  
  var likeButton: String {
    isLike ? "fillHeart" : "emptyHeard"
  }
  
  var body: some View {
    VStack(spacing: 10) {
      VStack {
        KFImage(URL(string: poster))
          .resizable()
          .clipped()
          .frame(height: 180)
          .isHidden(poster.contains("N/A"))
        Image("movieNotFound")
          .resizable()
          .clipped()
          .frame(height: 180)
          .isHidden(!poster.contains("N/A"))
      }
      Text(viewModel.detailItem.title ?? "")
        .font(.title)
        .fontWeight(.bold)
        .foregroundStyle(Color.black)
        .multilineTextAlignment(.center)
      HStack(spacing: 10) {
        Image("calendarIcon")
          .resizable()
          .clipped()
          .frame(width: 24, height: 24)
        
        Text(viewModel.detailItem.year ?? "")
          .font(.caption)
          .foregroundStyle(Color.grey.c2)
        
        Image("clockIcon")
          .resizable()
          .clipped()
          .frame(width: 24, height: 24)
        
        Text(viewModel.detailItem.runtime ?? "")
          .font(.caption)
          .foregroundStyle(Color.grey.c2)
        
        Image("genderIcon")
          .resizable()
          .clipped()
          .frame(width: 24, height: 24)
        
        Text(viewModel.detailItem.genre ?? "")
          .font(.caption)
          .foregroundStyle(Color.grey.c2)
      }
      .padding(.bottom, 15)
      
      VStack (alignment: .leading, spacing: 15) {
        Text("Synopsis")
          .font(.headline)
          .fontWeight(.bold)
          .foregroundStyle(Color.customBlue.b3)
        ScrollView(showsIndicators: false) {
          Text(viewModel.detailItem.plot ?? "")
            .font(.headline)
            .foregroundStyle(Color.grey.c2)
        }
      }
      .padding([.leading, .trailing], 20)
      
      Spacer()
    }
    .onAppear {
      viewModel.fetchDetailData(movieId: moviewId)
    }
    .overlay {
      if viewModel.isLoading {
        Loader()
      }
    }
  }
}
