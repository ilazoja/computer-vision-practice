#include "stdafx.h"
#include "Item.h"


Item::Item()
{
}

Item::Item(string name)
{
	setType(name);
	if (name == "heart") {
		setHSVmin(Scalar(28, 128, 44));
		setHSVmax(Scalar(51, 256, 256));
		setColour(Scalar(0, 0, 255));
	}
	if (name == "hand") {
		setHSVmin(Scalar(163, 33, 0));
		setHSVmax(Scalar(256, 256, 256));
		setColour(Scalar(0, 0, 255));
	}
	if (name == "scalpal") {
		setHSVmin(Scalar(114, 9, 0));
		setHSVmax(Scalar(256, 44, 256));
		setColour(Scalar(0, 0, 255));
	}
}

Item::~Item()
{
}

int Item::getXPos() {
	return Item::xPos;
}


int Item::getYPos() {
	return Item::yPos;
}

void Item::setXPos(int x) {
	Item::xPos = x;
}

void Item::setYPos(int y) {
	Item::yPos = y;
}

Scalar Item::getHSVmin(){
	return HSVmin;
}

Scalar Item::getHSVmax(){
	return HSVmax;
}

void Item::setHSVmin(Scalar min){
	HSVmin = min;
}

void Item::setHSVmax(Scalar max){
	HSVmax = max;
}
