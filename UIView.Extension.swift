//
//  UIView+Extension.swift
//  TestLine
//
//  Created by Simon Li on 2016-02-24.
//  Copyright © 2016 zemind. All rights reserved.
//

import Foundation
import UIKit

public typealias DrawRectBlock = (CGRect, CGContextRef) -> Void

public class UIViewWithDrawRect: UIView {
	let drawRectBlock: DrawRectBlock
	
	init(drawRect: DrawRectBlock) {
		self.drawRectBlock = drawRect
		super.init(frame: CGRectZero)
	}
	
	required public init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	public override func drawRect(rect: CGRect) {
		self.drawRectBlock(rect, UIGraphicsGetCurrentContext()!)
	}
}

extension UIView {
	public static func viewWithDrawRect(drawRect: DrawRectBlock) -> UIView {
		let view = UIViewWithDrawRect(drawRect: drawRect)
		view.backgroundColor = UIColor.clearColor()
		return view
	}
	
	/// Draw a 1px line
	public static func LineView() -> UIView {
		let lineDraw: DrawRectBlock = { (rect, context) in
			UIColor.blackColor().set()
			let lineWidth = 1.0 / UIScreen.mainScreen().scale
			// adjust y since stroke will straddle the path.
			let y = floor(0.5 * CGRectGetHeight(rect)) + 0.5 * lineWidth
			CGContextSetLineWidth(context, lineWidth)
			CGContextMoveToPoint(context, 0.0, y)
			CGContextAddLineToPoint(context, CGRectGetWidth(rect), y)
			CGContextStrokePath(context)
		}
		return UIView.viewWithDrawRect(lineDraw)
	}
}