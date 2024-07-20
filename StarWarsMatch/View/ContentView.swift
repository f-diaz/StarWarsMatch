//
//  ContentView.swift
//  StarWarsMatch
//
//  Created by Fernando Diaz de Tudela on 19/7/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        VStack {
            Text("Star Wars Memory")
                .font(.largeTitle)
            
            gameBody
            
            HStack {
                Text("Score: \(viewModel.score)")
                Spacer()
                Text("Moves: \(viewModel.moves)")
            }
            .padding()
            
            Button("New Game") {
                viewModel.newGame()
            }
        }
    }
    
    var gameBody: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .padding()
    }
}

struct CardView: View {
    let card: Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                VStack {
                    Image(card.imageName)
                        .resizable()
                        .scaledToFit()
                        .padding(5)
                    
                    ZStack {
                        Rectangle()
                            .fill(Color.black)
                            .frame(height: 30)
                        
                        Text(card.imageName.capitalized)
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
