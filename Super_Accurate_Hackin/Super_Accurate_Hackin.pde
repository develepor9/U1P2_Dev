import processing.sound.*;
SoundFile file;
String audioName = "Manuel - Gas Gas Gas.mp3";
String path;
PImage bulletCat = null;
char drawChar [] = {'0', '1'};
int Xpos [] = new int [50];
int Ypos2 = 0; 
int Xpos2 = 0;
int Ypos [] = new int [50];

void setup ()
{
  //starts playing the song
  path = sketchPath(audioName);
  file = new SoundFile(this, path);
  file.play();
  //loads in image
  bulletCat = loadImage ("bullet_cat.jpg");
  size (800, 800);
  //Assigns multiples of 16 to X and Y pos
  for (int i =0; i < 50; i++)
  {
    if (i>0)
    {
      Xpos [i] = Xpos[i-1] +16;
      Ypos [i] = Ypos[i-1] +16;
    }
  }
}

void draw ()
{
  background (0);
  int XposIndex = int (random(Xpos.length));
  int YposIndex = int (random(Ypos.length));
  if (keyPressed)
  { 
    for (int i =0; i < random(15); i++)
    {
      /*
      if a key is pressed a random amount of collections of 1s and 0s
       will print and move downwards. The numbers will never overlap due to
       variables assigned to X and Y pos. 
       */
      int charIndex = int (random(drawChar.length));
      fill(0, 255, 0);
      textSize (18);
      text (drawChar[charIndex], Xpos [XposIndex], Ypos2);
      Ypos2+=random(15);
      text (drawChar[charIndex], Xpos2, Ypos [YposIndex]);
      Xpos2+=random(15);
      if (Ypos2 > 784 || Xpos2 > 784)
      {
        Ypos2 = 0;
        Xpos2 = 0;
      }
    }
  }
}

void keyPressed ()
{
  //If c is pressed than a picture of bullet cat will appear at a random coordinate
  if (key == 'c' || key == 'C')
  {
    image (bulletCat, random(0, width), random(0, height));
  }
  //If k is pressed than 'rerouting' will appear at a random coordinate
  if (key == 'k' || key == 'K')
  {
    fill (255);
    textSize (40);
    text ("Rerouting....", random(0, width), random(0, height));
  }
}
