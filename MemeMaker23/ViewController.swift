//
//  ViewController.swift
//  MemeMaker23
//
//  Created by Brian Foutty on 2/23/23.
// #1 - Create the phrases file as text file.
// #2 - #10: these steps are done in the Main file and are all storyboard steps to create the UI.
// #29 - Add UIPanGestureRecognizer in Storyboard to both top and bottom label.


import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    // #11
    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    // #12
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    
    // #13
    @IBOutlet weak var topCaptionLabel: UILabel!
    // #14
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    // MARK: - Instance Properties
    // #17
    let topChoices = [
        CaptionOption(emoji: "🤨", caption: "You know what I like…"),
        CaptionOption(emoji: "😡", caption: "You know what makes me mad?"),
        CaptionOption(emoji: "🐞", caption: "Debugging be like…"),
    ]
    
    // #18
    let bottomChoices = [
        CaptionOption(emoji: "👨🏻‍💻", caption: "Twice as hard as writing the code!"),
        CaptionOption(emoji: "🤟🏼", caption: "Your first programming language"),
        CaptionOption(emoji: "🔮", caption: "The best way to predict the future is to invent it."),
    ]

    
    
    // MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()
        // #19
        topSegmentedControl.removeAllSegments()
        // #20
        for choice in topChoices {
            topSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        // #21
        topSegmentedControl.selectedSegmentIndex = 0
        // #22
        bottomSegmentedControl.removeAllSegments()
        // #23
        for choice in bottomChoices {
            bottomSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        // #24
        bottomSegmentedControl.selectedSegmentIndex = 0
        // #26
        updateCaptions()
    }

    // MARK: - IB Action
    // #27
    @IBAction func segmentedControllerChanged(_ sender: Any) {
        // #28
        updateCaptions()
    }
    
    // #30
    @IBAction func topLabelDragged(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            // #32
            topCaptionLabel.center = sender.location(in: view)
        }
    }
    
    // #31
    @IBAction func bottomLabelDragged(_ sender: UIPanGestureRecognizer) {
        // #33
        if sender.state == .changed {
            bottomCaptionLabel.center = sender.location(in: view)
        }
    }
    
    
    // MARK: - Instance Methods
    // Method to update caption lables from users choice in segmented control
    // #25
    func updateCaptions() {
        let topIndex = topSegmentedControl.selectedSegmentIndex
        topCaptionLabel.text = topChoices[topIndex].caption
        
        let bottomIndex = bottomSegmentedControl.selectedSegmentIndex
        bottomCaptionLabel.text = bottomChoices[bottomIndex].caption
    }
}

