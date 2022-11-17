//
//  ContentView.swift
//  SwipeableView
//
//  Created by 김윤석 on 2022/11/17.
//

import Snappable
import SwiftUI

struct ContentView: View {
  var title: String = "To Yessen"

  //MARK: - You need to convert array of the blocks from the server to this format
  private var sections: [BlockSections] = []

  private let blocks: [Block] = [
    Block(title: "I got"),
    Block(title: "Deus t shirt"),
    Block(title: "For your bday present"),

    Block(title: "Happy"),
    Block(title: "B day"),
    Block(title: "from Uma"),

    Block(title: "This"),
    Block(title: "is"),
    Block(title: "trial")
  ]

  private mutating func convertBlocksToBlockSection() {
    let splitedBlocks = blocks.splitInSubArrays(into: 3)
    sections = splitedBlocks.map { blocks in
      BlockSections(blocks: blocks)
    }
  }

  init() {
    convertBlocksToBlockSection()
  }


  var body: some View {

      ScrollView(.horizontal) {
        HStack(spacing: 12) {
          ForEach(sections) { section in
            VStack {
              ForEach(section.blocks) { block in
                AppSmall1Block(item: block)
              }
            }
            .snapID(section.id)
            .frame(width: UIScreen.main.bounds.width - 20)
          }
        }
        .padding(.horizontal)
      }
      .snappable(alignment: .center)

//    HStack {
//      ScrollView(.horizontal, showsIndicators: true) {
//        HStack(spacing: 12) {
//          Spacer(minLength: 10)
//          ForEach(sections) { section in
//            VStack(alignment: .leading, spacing: 20) {
//              ForEach(section.blocks) { block in
//                AppSmall1Block(item: block)
//              }
//            }
//            .frame(width: 320)
//            .background(.green)
//          }
//        }
//        .padding(.horizontal)
//      }
//      .onAppear {
//        UIScrollView.appearance().isPagingEnabled = true
//      }
//      .onDisappear {
//        UIScrollView.appearance().isPagingEnabled = false
//      }
//      .background(.black)
//    }
//    .frame(width: UIScreen.main.bounds.width)
//    VStack {
//      HStack {
//        Spacer()
//        TabView {
//          ForEach(sections) { section in
//            VStack {
//              ForEach(section.blocks) { block in
//                AppSmall1Block(item: block)
//                  .background(.green)
//              }
//            }
//          }
//          .padding(.horizontal)
//        }
//        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//        .tabViewStyle(PageTabViewStyle())
//      }
//    }
//    .frame(width: UIScreen.main.bounds.width, height: 250)
//    .padding(.bottom)
//    .background(.yellow)
  }
}

extension Array {
  func splitInSubArrays(into size: Int) -> [[Element]] {
    return (0..<size).map {
      stride(from: $0, to: count, by: size).map { self[$0] }
    }
  }
}

struct BlockSections: Identifiable {
  let id = UUID()
  let blocks: [Block]
}

struct Block: Identifiable {
  var id = UUID()
  let title: String
}

struct SectionHeaderExtendedBlock: View {
  var title: String = "Title"

  var body: some View {
    VStack {
      Divider()

      HStack {
        Text(title)
          .font(.title3)
          .bold()

        Spacer()

        Button("See All") {}
          .font(.subheadline)
      }
    }
  }
}

struct AppSmall1Block: View {
  let item: Block

  var body: some View {
    HStack {
      RoundedRectangle(cornerRadius: 12, style: .continuous)
        .foregroundColor(Color.gray)
        .frame(width: 50, height: 50)

      VStack(alignment: .leading) {
        Text(item.title)
          .bold()

        Text("Description")
          .font(.subheadline)
          .foregroundColor(.secondary)
      }

      Spacer()
    }
  }
}

struct Preview: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
