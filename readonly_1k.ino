//Initialize variables
   int i = 0;
   unsigned t = 0;   // the time variable 
   unsigned v = 0;   // the voltage value
   unsigned s=0;  // start time
  unsigned a = 0;

   const int analogInPin = A11;
   

//Set baud rate and input pin
   void setup() {
   Serial.begin(115200); //try 230400
   //Serial.begin(230400);
   pinMode(analogInPin, INPUT);
   s=micros(); //systime = micros();
 }

//Loop for reading samples of data
void loop() {
  t=micros()-s;    //micros()

  
  if((int)(t - a) >= 0)  {
    v=analogRead(analogInPin);

    //Serial.print(t); // time //ewentualnie zakomentowac
    //Serial.print(' '); //ewentualnie zakomentowac
    Serial.println(v);  // voltage
    a += 1000;
  } 
  //v=analogRead(analogInPin);

  //Serial.print(t); // time
  //Serial.print(' ');
  //Serial.println(v);  // voltage
  
  delayMicroseconds(650);      // sampling interval in ms
}