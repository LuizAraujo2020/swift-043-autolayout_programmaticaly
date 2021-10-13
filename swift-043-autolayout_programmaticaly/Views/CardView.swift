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

final class CardView: UIView {
  private let padding: CGFloat = 16
  
  private lazy var imageView: UIImageView = {
    let image = UIImageView()
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    image.backgroundColor = .white
    image.layer.cornerRadius = 8
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()
  
  private lazy var textLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
    setupConstraints()
  }
  
  public convenience init(with type: CardType) {
    self.init(frame: .zero)
    configureCard(with: type)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupViews() {
    //add code here to add views to hierarchy
      addSubviews(imageView, textLabel)

  }
  
  private func setupConstraints() {
      // You’ve given the imageView a topAnchor, leadingAnchor and trailingAnchor constraint.
      //This tells the imageView where its top, left and right sides should be positioned in relation to the parent view (referred to by self here).
      NSLayoutConstraint.activate([
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
        imageView.leadingAnchor.constraint(
          equalTo: self.leadingAnchor,
          constant: padding),
        imageView.trailingAnchor.constraint(
          equalTo: self.trailingAnchor,
          constant: -padding)
      ])
      
      NSLayoutConstraint.activate([
        // Then you give textLabel a topAnchor that is constrained relative to the bottom of imageView — wherever the botto
        textLabel.topAnchor.constraint(
            equalTo: imageView.bottomAnchor,
            constant: padding),
        // You then add leadingAnchor, trailingAnchor and bottomAnchor constraints, telling the textLabel where its left, right and bottom sides should be positioned, relative to the parent view.
        textLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
        textLabel.trailingAnchor.constraint(
          equalTo: self.trailingAnchor,
          constant: -padding),
        textLabel.bottomAnchor.constraint(
          equalTo: self.bottomAnchor,
          constant: -padding)
      ])
      
      // Hugging means something like size to fit. A higher value of Content Hugging will make the label stick to its original bounds and not expand.
      textLabel.setContentHuggingPriority(.defaultLow + 1, for: .vertical)
      // Compression Resistance means the label will resist compressing.
      //A higher value of Compression Resistance will prevent the label from compressing or shrinking with respect to other views.
      textLabel.setContentCompressionResistancePriority(.defaultHigh + 1, for: .vertical)

  }
  
}

// MARK: - View Configuration
extension CardView {
  public func configureCard(with type: CardType) {
    let model = CardModel.getCardDetails(for: type)
    imageView.image = UIImage(named: model.imageName)
    textLabel.text = model.characterName
    backgroundColor = model.backgroundColor
  }
}
