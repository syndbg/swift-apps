//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Anton Antonov on 7/13/15.
//  Copyright (c) 2015 Anton Antonov. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  // 1 = 0; 2 = X
  var activePlayer = 1
  var hasEnded: Bool = false
  var boardState = [0, 0, 0,
                    0, 0, 0,
                    0, 0, 0]

  var winStates = [
    [0, 1, 2], // horizontal
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6], // vertical
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8], // diagonals
    [2, 4, 6]
  ]
  var soundPlayer = AVAudioPlayer()
  var gameWonSound = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("win", ofType: "mp3")!)

  @IBOutlet weak var gameEndLabel: UILabel!
  @IBOutlet weak var playAgainButton: UIButton!

  @IBAction func playAgainPressed(sender: AnyObject) {
    activePlayer = 1
    hasEnded = false

    for i in 0...boardState.count - 1 {
      boardState[i] = 0
      var button = view.viewWithTag(i + 1) as? UIButton
      if button != nil {
        button!.setImage(nil, forState: .Normal)
      }
    }

    hideGameHasEnded()
  }

  @IBAction func buttonPressed(sender: UIButton) {
    let index = sender.tag - 1
    if boardState[index] == 0 && !hasEnded {
      var image = UIImage()

      boardState[index] = activePlayer

      if activePlayer == 1 {
        image = UIImage(named:"x")!
        activePlayer = 2
      } else {
        image = UIImage(named:"o")!
        activePlayer = 1
      }

      sender.setImage(image, forState: .Normal)

      hasEnded = hasWon()
      if hasEnded {
        announceWinner()
      } else if !contains(boardState, 0) {
        hasEnded = true
        activePlayer = 0
        announceWinner()
      }
    }
  }

  func hasWon() -> Bool {
    for state in winStates {
      let pos1 = state[0]
      let pos2 = state[1]
      let pos3 = state[2]
      if boardState[pos1] != 0 && boardState[pos1] == boardState[pos2] && boardState[pos1] == boardState[pos3] {
        return true
      }
    }
    return false
  }

  func announceWinner() {
    if activePlayer == 2 {
      showGameHasEnded("X won!")
    } else if activePlayer == 1 {
      showGameHasEnded("O won!")
    } else {
      showGameHasEnded("It's a draw!")
    }

  }

  func hideGameHasEnded(shouldAnimate: Bool=false) {
    playAgainButton.hidden = true
    gameEndLabel.hidden = true

    playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
    gameEndLabel.center = CGPointMake(gameEndLabel.center.x - 400, gameEndLabel.center.y)
  }

  func showGameHasEnded(gameEndMessage: String) {
    playAgainButton.hidden = false
    gameEndLabel.hidden = false
    gameEndLabel.text = gameEndMessage

    UIView.animateWithDuration(0.5, animations: { () -> Void in
      self.gameEndLabel.center = CGPointMake(self.gameEndLabel.center.x + 400, self.gameEndLabel.center.y)
      self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 400, self.playAgainButton.center.y)
    })
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    hideGameHasEnded()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

