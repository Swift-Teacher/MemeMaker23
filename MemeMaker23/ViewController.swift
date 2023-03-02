//
//  ViewController.swift
//  MemeMaker23
//
//  Created by Brian Foutty on 2/23/23.
//
import CoreImage
import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - IB Outlets
    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    // MARK: - Instance Properties
    let topChoices = [
        CaptionOption(emoji: "🤨", caption: "You know what I like…"),
        CaptionOption(emoji: "😡", caption: "You know what makes me mad?"),
        CaptionOption(emoji: "🐞", caption: "Debugging be like…"),
    ]
    
    let bottomChoices = [
        CaptionOption(emoji: "👨🏻‍💻", caption: "Twice as hard as writing the code!"),
        CaptionOption(emoji: "🤟🏼", caption: "Your first programming language"),
        CaptionOption(emoji: "🔮", caption: "The best way to predict the future is to invent it."),
    ]

    
    
    // MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        topSegmentedControl.removeAllSegments()
        for choice in topChoices {
            topSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        topSegmentedControl.selectedSegmentIndex = 0
        
        bottomSegmentedControl.removeAllSegments()
        for choice in bottomChoices {
            bottomSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        bottomSegmentedControl.selectedSegmentIndex = 0
        updateCaptions()
    }

    // MARK: - IB Action
    
    @IBAction func segmentedControllerChanged(_ sender: Any) {
        updateCaptions()
    }
    
    @IBAction func topLabelDragged(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            topCaptionLabel.center = sender.location(in: view)
        }
    }
    
    @IBAction func bottomLabelDragged(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            bottomCaptionLabel.center = sender.location(in: view)
        }
    }
    
    
    // MARK: - Instance Methods
    func updateCaptions() {
        let topIndex = topSegmentedControl.selectedSegmentIndex
        topCaptionLabel.text = topChoices[topIndex].caption
        
        let bottomIndex = bottomSegmentedControl.selectedSegmentIndex
        bottomCaptionLabel.text = bottomChoices[bottomIndex].caption
    }
}

