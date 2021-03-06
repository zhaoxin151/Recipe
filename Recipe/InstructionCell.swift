/*
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

class InstructionCell: UITableViewCell {
  
  @IBOutlet var checkmarkButton: UIButton!   //checkBox
  @IBOutlet var descriptionLabel: UILabel!   //label
  var type: RecipeInstructionType = .ingredient
  
  func configure(_ description: String) {     //配置信息
    descriptionLabel.text = description
  }
  
  @IBAction func checkmarkTapped(_ sender: AnyObject) {   //选择
    shouldStrikeThroughText(!checkmarkButton.isSelected)
  }
  
  func shouldStrikeThroughText(_ strikeThrough :Bool) {    //执行选择的逻辑
    guard let text = descriptionLabel.text else {
      return
    }
    
    let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: text)
    
    if strikeThrough {
      attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, attributeString.length))
    }
    
    checkmarkButton.isSelected = strikeThrough
    
    descriptionLabel.attributedText = attributeString
  }
  
}
