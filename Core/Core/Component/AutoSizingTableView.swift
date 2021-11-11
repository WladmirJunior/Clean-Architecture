//
//  AutoSizingTableView.swift
//  Clean Architecture
//
//  Created by Wladmir Silva on 11/11/21.
//

import UIKit

public class AutoSizingTableView: UITableView {
    override public var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    override public func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
        self.setNeedsLayout()
    }

    override public var intrinsicContentSize: CGSize {
        setNeedsLayout()

        return CGSize(width: contentSize.width, height: contentSize.height + contentInset.top + contentInset.bottom)
    }
}

