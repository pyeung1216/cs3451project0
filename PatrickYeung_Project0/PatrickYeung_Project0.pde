/**
 * Patrick Yeung
 * CS3451 Project 0
 * This application creates linear fractals based on the mouse position.
 * Centered about a specific origin, using a pattern based algorithm to solve for subsequent points
**/

// Variables for screen size, iteration length, and array size
int width = 600;
int iteration = 10;
int total = int(pow(2,iteration)-1);

//Instantiation of arrays used to calculate and draw the linear fractal
float[] pointX = new float[total];
float[] pointY = new float[total];
float[] vRealValues = new float[iteration-1];
float[] vImaginaryValues= new float[iteration-1];

//Setup method to create screen and define values required for calculation.
void  setup()  {
  size(width,width);
  pointX[0] = 0;
  pointY[0] = 0;
  vRealValues[0] = 1;
  vImaginaryValues[0] = 0;
}

//Method used for calculating the points to be drawn for the linear fractal
void calculatePoints()  {
  int vStep = 0; //keeps track of current iteration of the fractal
  int previous = 0; //keeps track of previous values needed to solve for next iteration
  //For loop solves for coordinates for the linear fractal 
  for(int i = 1; i < total - 1; i++){
    //If else statement to check and calculate plus/minus accordingly
    if(i % 2 == 1)  {
      pointX[i] = pointX[previous] + vRealValues[vStep];
      pointY[i] = pointY[previous] + vImaginaryValues[vStep];
    }
    else  {
      pointX[i] = pointX[previous] - vRealValues[vStep];
      pointY[i] = pointY[previous] - vImaginaryValues[vStep];      
      previous++;
    }
    //If statement to check and move on to next iteration if necessary
    if(i == (pow(2,vStep+2)-2)){
      vStep++;
    }
  }
}
    
// Method calculates the real and imaginary values used for solving the next iteration
void calculateV(float a, float b){
  for(int i = 1; i < iteration-1; i++)  {  
    vRealValues[i] = foilReal(a,b,vRealValues[i-1],vImaginaryValues[i-1]);
    vImaginaryValues[i] = foilImaginary(a,b,vRealValues[i-1],vImaginaryValues[i-1]);
  }
}

//Method utilizes the known pattern for solving for the real value for complex multiplication
float foilReal(float a, float b, float c, float d)  {
  return a * c - b * d;
}

//Method utilizes the known pattern for solving for the imaginary value for complex multiplication
float foilImaginary(float a, float b, float c, float d)  {
  return b * c + a * d;
}

//Method constrains the complex coefficients to the bounds of [-2,2]
float bounds(float data)  {
  if(data < -2)  {
   data = -2;
  }
  else if(data > 2)  {
    data = 2;
  }
  return data;
 }
   
// This method calls the methods necessary for calculating and drawing the linear fractal
void draw()  {
  //Background Color: White
  background(255,255,255);
  
  //Takes in mouse position and converts it that values to be within the small range specified (in this case [-3,3]
  float x = (mouseX - width/2.0)/100;
  float y = 0 - (mouseY - width/2.0)/100;
  //Calls bound function to ensure the c values do not exceed [-2,2]
  x = bounds(x);
  y = bounds(y);  
  
// Draws coordinate plane to help visualization
  stroke(0,0,0);
  line(width/2,0,width/2,width);
  line(0,width/2,width,width/2);

  for(int i = 100; i < width/2; i+=100)  {
    stroke(175,175,175);   
    line(width/2+i,0,width/2+i,width);
    line(0,width/2+i,width,width/2+i);
    line(width/2-i,0,width/2-i,width);
    line(0,width/2-i,width,width/2-i);
  } 

// Draws the current mouse position
//  text(x + "," + y, 0, 10);

//Calls calculate functions using the mouse position for parameters    
  calculateV(x,y);
  calculatePoints();

//Draws shapes with no borders and depending on sections within the array, which color they are
  noStroke();
  for(int i = 0; i < total; i++)  {
    if(i < total/3)  {
      fill(255,0,0);
    }
    else if(i < (2*total/3) && i > (total/3))  {
      fill(0,255,0);
    }
    else{
      fill(0,0,255);
    }
    ellipse(pointX[i] * 100.0 + width/2, (0 - pointY[i]) * 100.0 + width/2,5,5);
  }
}
