//
//  Board.swift
//  BoardCounter
//
//  Created by Preston on 6/5/19.
//  Copyright © 2019 Daypark Studios. All rights reserved.
//

import Foundation
import CoreData


class Board {
	// Fields
	
	var whiteBoard: Double
	var yellowBoard: Double
	var orangeBoard: Double
	var greenBoard: Double
	var blueBoard: Double
	var	brownBoard: Double
	var blackBoard: Double
	var date: Date
	var tool: String
	
	// List of Tools
	final var tools = ["Footsword", "Knifehand", "Ball of Foot", "Reverse Knifehand", "Forefist", "Backfist", "Heel"]
	
	// Board values
	final var _bWhite = 0.25
	final var _bYellow = 0.5
	final var _bOrange = 0.75
	final var _bGreen = 1.0
	final var _bBlue = 1.25
	final var _bBrown = 1.75
	final var _bBlack = 2.25
	
	init(whiteBoard whb: Double, yellowBoard ylb: Double, orangeBoard ogb: Double, greenBoard grb: Double, blueBoard blb: Double, brownBoard brb: Double, blackBoard bkb: Double, tool tl: String) {
		whiteBoard = whb
		yellowBoard = ylb
		orangeBoard = ogb
		greenBoard = grb
		blueBoard = blb
		brownBoard = brb
		blackBoard = bkb
		date = Date()
		tool = tl
	}
	
	init() {
		whiteBoard = 0.0
		yellowBoard = 0.0
		orangeBoard = 0.0
		greenBoard = 0.0
		blueBoard = 0.0
		brownBoard = 0.0
		blackBoard = 0.0
		date = Date()
		tool = ""
	}
	
	
	/// Returns the wood board equivalent
	func getBoardValue() -> Double {
		var total = 0.0
		
		total += (whiteBoard * _bWhite)
		total += (yellowBoard * _bYellow)
		total += (orangeBoard * _bOrange)
		total += (greenBoard * _bGreen)
		total += (blueBoard * _bBlue)
		total += (brownBoard * _bBrown)
		total += (blackBoard * _bBlack)
		
		
		return total
	}
	
	
}
