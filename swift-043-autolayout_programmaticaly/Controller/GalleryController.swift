/// Copyright (c) 2019 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

class GalleryController: UIViewController {
  lazy var cardView1: CardView = {
    let cardView = CardView(with: .skeleton)
    cardView.translatesAutoresizingMaskIntoConstraints = false
    return cardView
  }()
  
  lazy var cardView2: CardView = {
    let cardView = CardView(with: .owl)
    cardView.translatesAutoresizingMaskIntoConstraints = false
    return cardView
  }()
  
  lazy var cardView3: CardView = {
    let cardView = CardView(with: .panda)
    cardView.translatesAutoresizingMaskIntoConstraints = false
    return cardView
  }()
  
  lazy var cardView4: CardView = {
    let cardView = CardView(with: .monkey)
    cardView.translatesAutoresizingMaskIntoConstraints = false
    return cardView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    setupConstraints()
    view.backgroundColor = .white
  }
  
  // MARK: - Setting Views
  private func setupViews() {
    view.addSubviews(cardView1)
  }
  
  // MARK: - Setting Constraints
  private func setupConstraints() {
      // You added a call to NSLayoutConstraint to activate an array of constraints. The array contains:
      NSLayoutConstraint.activate([
        // centerX and centerY constraint anchors to make sure the card is laid out in the exact horizontal and vertical center of the view.
        cardView1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        cardView1.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        // width and height constraint anchors to fix the width and height of the card.
        cardView1.widthAnchor.constraint(equalToConstant: 120),
        cardView1.heightAnchor.constraint(equalToConstant: 200)
      ])
  }
}
