import java.util.*;   //<>//
import controlP5.*;   //Proccessing library used to create text boxes and scrollable lists 
ControlP5 cp5;
ControlP5 c;
ControlP5 p;

String text1;
String text2;
String s = "";
float usage;
float answer1;

//CO2 calculations per liter/khw
float diesel = 2.6391f;
float petrol = 2.3035f;
float khw = 0.193f;
float Null = 0.0f;
 //<>//
void setup()
{
  //opening window set up
  size(1000, 750);
  background(45, 45, 67);
  surface.setTitle("Sarina Kohli 22537403");   //Opening window title
  
  PFont font1 = createFont("arial", 20);  
  PFont font2 = createFont("arial", 13);

  cp5 = new ControlP5(this);
  c = new ControlP5(this);
  p = new ControlP5(this);

  //Installment of scrollable list box array inputs
  String [] vehicle = {"bicycle", "Manual Car", "Automatic Car", "Motor Bike", "Semi-Electric Car", "Electric Car", "Electric Scooter"};
  String [] measurment = {"Liter", "Khw", "Null"};

  //First input as a scrollable list
  cp5.addScrollableList("Vehicle Type")
    .setPosition(80, 175)
    .setSize(100, 100)
    .setBarHeight(30)
    .setItemHeight(30)
    .setFont(font2)
    .addItems(vehicle)
    ;

  //Second input as a text box
  cp5.addTextfield("Diesel, Petrol, Khw, Null etc...")
    .setPosition(80, 275)
    .setSize(100, 30)
    .setFont(font2)
    .setFocus(true)
    .setColor(color(0))
    .setColorBackground(color(255))
    ;

  //Third input as a scrollable list
  p.addScrollableList("Measurment")
    .setPosition(80, 375)
    .setSize(100, 100)
    .setBarHeight(30)
    .setItemHeight(30)
    .setFont(font2)
    .addItems(measurment)
    ;

  //Fourth input as a text box
  cp5.addTextfield("Insert number")
    .setPosition(80, 475)
    .setSize(100, 30)
    .setFont(font2)
    .setFocus(true)
    .setColor(color(0))
    .setColorBackground(color(255))
    ;

  //Submit button
  cp5.addBang("Submit")
    .setPosition(375, 460)
    .setSize(100, 50)
    .setFont(font1)
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
    ;
}

void draw()
{
  //Title print to screen
  background(45, 45, 67);
  fill(255, 255, 255);
  textSize(30);
  text("Calculate your CO2 Emissions", 50, 70);
  
  //First input text
  textSize(20);
  text("Vehicle Type", 75, 150);

  //Second input text
  textSize(20);
  text("Energy Type", 75, 250);

  //Third input title
  textSize(20);
  text("Energy Measurment", 75, 350);

  //Fourth input text
  textSize(20);
  text("Usage", 75, 450);
  textSize(20);
  text("Per Liter(s) / Khw(s) ", 190, 500);
  
  //Output text
  textSize(30);
  text("CO2 Emissions: ", 500, 300);
  textSize(30);
  text(s, 700, 300);   //Answer1 drawn to window as final output
}

void Submit()   //When the submit button is pressed it will carry out the following code
{
  text1 = cp5.get(Textfield.class, "Insert number").getText();   //Usage input stored as a string
  usage = Float.parseFloat(text1);   //Converted usage input into a float
  
  text2 = cp5.get(Textfield.class, "Diesel, Petrol, Khw, Null etc...").getText();   //Energy type input stored as a string
  
  //Only possible inputs 
  String d = "DIESEL";
  String p = "PETROL";
  String k = "KHW";
  String n = "NULL";
  
  String dd = "diesel";
  String pp = "petrol";
  String kk = "khw";
  String nn = "null";
  
  
  for (int i = 0; i < text2.length(); i++)   //As the for loop checks each index of text2(Energy type) input 
  {
    //If text2 equals to any of the stored strings it will carry out these calculations
    if((text2.equals(d))|| (text2.equals(dd)))
    {
    answer1 = usage * diesel;  //formula for calculating Co2 emmisions is the same for each type (fuel/ usage amount * average CO2 amount(per liter/khw) = total emmisions)
    }                           
    else if ((text2.equals(p)) || (text2.equals(pp)))
    {
      answer1 = usage * petrol;
    } 
    else if ((text2.equals(k)) || (text2.equals(kk)))
    {
      answer1 = usage * khw;
    } 
    else if ((text2.equals(n)) || (text2.equals(nn)))
    {
      answer1 = usage * Null;
    } 
    else
    {
      
    }
  }
  s = Float.toString(answer1);   //Answer1 initially stored as a float and converted back to a string to print text to screen seen in line 115
  println(s);   //Printed output to screen
}
