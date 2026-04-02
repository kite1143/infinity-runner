extends Node

#[scene, bought_or_not]
var list_characters: Dictionary = {
	'knight': [preload("uid://beyrwfqtusi46"), true],
	'mage': [preload("uid://c0ve63vvr4j73"), false],
	'barbarian': [preload("uid://cpbl6j3hkvwx1"), false]
}

var choosen_character: String = 'knight'
var total_coin: int = 10000
