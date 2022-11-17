//
//  carousel.swift
//  SwipableTrial
//
//  Created by Yessen Yermukhanbet on 2022/11/18.
//

import Snappable
import SwiftUI

struct Carousel: View {
  var body: some View {
    ScrollView(.horizontal) {
      LazyHStack {
        ForEach(0..<100, id: \.self) { item in
          Text("\(item)")
            .snapID(item)  // Step 1
        }
      }
    }
    .snappable(alignment: .center)  // Step 2
  }
}

struct CarouselPreview: PreviewProvider {
  static var previews: some View {
    Carousel()
  }
}
