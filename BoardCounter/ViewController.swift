//
//  ViewController.swift
//  BoardCounter
//
//  Created by Preston on 6/5/19.
//  Copyright © 2019 Daypark Studios. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

	@IBOutlet weak var whiteBoardTextField: UITextField!
	@IBOutlet weak var yellowBoardTextField: UITextField!
	@IBOutlet weak var orangeBoardTextField: UITextField!
	@IBOutlet weak var greenBoardTextField: UITextField!
	@IBOutlet weak var blueBoardTextField: UITextField!
	@IBOutlet weak var brownBoardTextField: UITextField!
	@IBOutlet weak var blackBoardTextField: UITextField!
	@IBOutlet weak var whiteStepper: UIStepper!
	@IBOutlet weak var yellowStepper: UIStepper!
	@IBOutlet weak var orangeStepper: UIStepper!
	@IBOutlet weak var greenStepper: UIStepper!
	@IBOutlet weak var blueStepper: UIStepper!
	@IBOutlet weak var brownStepper: UIStepper!
	@IBOutlet weak var blackStepper: UIStepper!
	
	@IBOutlet weak var boardsLabel: UILabel!
	@IBOutlet weak var boardWordLabel: UILabel!
	@IBOutlet weak var toolPicker: UIPickerView!

	
	var currentBoard: Board
	let appDelegate = UIApplication.shared.delegate as! AppDelegate
	var context: NSManagedObjectContext!
	
	
	required init?(coder aDecoder: NSCoder) {
		currentBoard = Board()	
		super.init(coder: aDecoder)
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	
		context = appDelegate.persistentContainer.viewContext
		toolPicker.dataSource = self
		toolPicker.delegate = self
		var requestReturn: [BoardData]
		let request : NSFetchRequest<BoardData> = BoardData.fetchRequest()
		do {
			try requestReturn = context.fetch(request)
			
			currentBoard.tool = requestReturn.last!.tool!
			toolPicker.selectRow(currentBoard.tools.firstIndex(of: currentBoard.tool)!, inComponent: 0, animated: true)
			
			currentBoard.date = requestReturn.last!.date!
			
			currentBoard.whiteBoard = requestReturn.last!.white
			whiteBoardTextField.text = String(Int(currentBoard.whiteBoard))
			whiteStepper.value = currentBoard.whiteBoard
			
			currentBoard.yellowBoard = requestReturn.last!.yellow
			yellowBoardTextField.text = String(Int(currentBoard.yellowBoard))
			yellowStepper.value = currentBoard.yellowBoard
			
			currentBoard.orangeBoard = requestReturn.last!.orange
			orangeBoardTextField.text = String(Int(currentBoard.orangeBoard))
			orangeStepper.value = currentBoard.orangeBoard
			
			currentBoard.greenBoard = requestReturn.last!.green
			greenBoardTextField.text = String(Int(currentBoard.greenBoard))
			greenStepper.value = currentBoard.greenBoard
			
			currentBoard.blueBoard = requestReturn.last!.blue
			blueBoardTextField.text = String(Int(currentBoard.blueBoard))
			blueStepper.value = currentBoard.blueBoard
			
			currentBoard.brownBoard = requestReturn.last!.brown
			brownBoardTextField.text = String(Int(currentBoard.brownBoard))
			brownStepper.value = currentBoard.brownBoard
			
			currentBoard.blackBoard = requestReturn.last!.black
			blackBoardTextField.text = String(Int(currentBoard.blackBoard))
			blackStepper.value = currentBoard.blackBoard
			
			updateBoardsLabel(currentBoard.getBoardValue())
			
			print("data successfully loaded")
		}
		catch {
			print("failed to load data")
		}
		
		
	}

	@IBAction func whiteBoardTextFieldStepperUp(_ sender: UIStepper) {
		whiteBoardTextField.text = String(Int(sender.value))
		currentBoard.whiteBoard = sender.value
		updateBoardsLabel(currentBoard.getBoardValue())
	}
	@IBAction func yellowBoardTextFieldStepperUp(_ sender: UIStepper) {
		yellowBoardTextField.text = String(Int(sender.value))
		currentBoard.yellowBoard = sender.value
		updateBoardsLabel(currentBoard.getBoardValue())
	}
	@IBAction func orangeBoardTextFieldStepperUp(_ sender: UIStepper) {
		orangeBoardTextField.text = String(Int(sender.value))
		currentBoard.orangeBoard = sender.value
		updateBoardsLabel(currentBoard.getBoardValue())
	}
	@IBAction func greenBoardTextFieldStepperUp(_ sender: UIStepper) {
		greenBoardTextField.text = String(Int(sender.value))
		currentBoard.greenBoard = sender.value
		updateBoardsLabel(currentBoard.getBoardValue())
	}
	@IBAction func blueBoardTextFieldStepperUp(_ sender: UIStepper) {
		blueBoardTextField.text = String(Int(sender.value))
		currentBoard.blueBoard = sender.value
		updateBoardsLabel(currentBoard.getBoardValue())
	}
	@IBAction func brownBoardTextFieldStepperUp(_ sender: UIStepper) {
		brownBoardTextField.text = String(Int(sender.value))
		currentBoard.brownBoard = sender.value
		updateBoardsLabel(currentBoard.getBoardValue())
	}
	@IBAction func blackBoardTextFieldStepperUp(_ sender: UIStepper) {
		blackBoardTextField.text = String(Int(sender.value))
		currentBoard.blackBoard = sender.value
		updateBoardsLabel(currentBoard.getBoardValue())
	}
	
	func updateBoardsLabel(_ value: Double) -> Void {
		boardsLabel.text = String(value)
		if value == 1 {
			boardWordLabel.text = "board"
		}
		else {
			boardWordLabel.text = "boards"
		}
	}
	
	@IBAction func saveBoardData()
	{
		let saveData = BoardData(context: context)
		saveData.date = currentBoard.date
		saveData.white = currentBoard.whiteBoard
		saveData.yellow = currentBoard.yellowBoard
		saveData.orange = currentBoard.orangeBoard
		saveData.green = currentBoard.greenBoard
		saveData.blue = currentBoard.blueBoard
		saveData.brown = currentBoard.brownBoard
		saveData.black = currentBoard.blackBoard
		saveData.tool = currentBoard.tool
		
		do {
			try context.save()
			print("data saved")
		}
		catch {
			print("failed to save data")
		}
	}
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}

	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return currentBoard.tools.count
	}
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
	return currentBoard.tools[row]
	}
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		currentBoard.tool = currentBoard.tools[row]
	}
}
