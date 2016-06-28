//
//  ChartCallout.swift
//  Charts
//
//  Created by Ryan VanAlstine on 6/26/16.
//  Copyright © 2016 Maark. All rights reserved.
//

import UIKit

public class ChartCallout: NSObject {

  /// The callout image to render
  public var image: NSUIImage?
  
  /// The callout tag
  public var tag: Int = 0
  
  /// Use this to set the desired point on the chart canvas
  public var position: CGPoint = CGPoint()
  
  //public var currentPosition: CGPoint = CGPoint()
  
  /// Use this to return the desired offset you wish the Callout to have on the x-axis.
  public var offset: CGPoint = CGPoint()
  
  /// The callout's size
  public var size: CGSize
    {
    get
    {
      return image?.size ?? CGSizeZero
    }
  }
  
  /// The rect of the callout
  public var rect: CGRect!
  
  public override init()
  {
    super.init()
  }
  
  /// Returns the offset for drawing at the specific `point`
  ///
  /// - parameter point: This is the point at which the marker wants to be drawn. You can adjust the offset conditionally based on this argument.
  /// - By default returns the self.offset property. You can return any other value to override that.
  public func offsetForDrawingAtPos(point: CGPoint) -> CGPoint
  {
    return offset
  }
  
  /// Draws the Callout on the given position on the given context
  public func draw(context context: CGContext, point: CGPoint)
  {
    if image == nil
    {
        return
    }
    
    let offset = self.offsetForDrawingAtPos(point)
    let size = self.size
    
    rect = CGRect(x: point.x + offset.x, y: point.y + offset.y, width: size.width, height: size.height)
    
    NSUIGraphicsPushContext(context)
    image!.drawInRect(rect)
    NSUIGraphicsPopContext()

  }
  
  /// This method enables a custom Callout to update it's content everytime the CalloutView is redrawn according to the data entry it points to.
  ///
  /// - parameter highlight: the highlight object contains information about the highlighted value such as it's dataset-index, the selected range or stack-index (only stacked bar entries).
  public func refreshContent(entry entry: ChartDataEntry, highlight: ChartHighlight)
  {
    // Do nothing here...
  }
  
}
