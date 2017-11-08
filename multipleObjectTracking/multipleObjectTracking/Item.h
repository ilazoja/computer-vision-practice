#pragma once
#include <string>

using namespace std;
using namespace cv;
class Item
{
public:
	Item();
	~Item();

	int getXPos();
	int getYPos();
	void setXPos(int x);
	void setYPos(int y);

	Scalar getHSVmin();
	Scalar getHSVmax();

	void setHSVmin(Scalar min);
	void setHSVmax(Scalar max);

private:
	int xPos, yPos;
	string type;
	Scalar HSVmin, HSVmax;
};

