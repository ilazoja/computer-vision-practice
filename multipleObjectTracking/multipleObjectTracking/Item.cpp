#include "stdafx.h"
#include "Item.h"


Item::Item()
{
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
	return HSVMax;
}

void Item::setHSVmin(Scalar min){
	HSVmin = min;
}

void Item::setHSVmax(Scalar max){
	HSVmax = max;
}
