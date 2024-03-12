//Initialize variables
   int i = 0;
   unsigned t = 0;   // the time variable 
   unsigned v = 0;   // the voltage value
   unsigned s=0;  // start time
   unsigned a = 0;

   const int analogInPin = A11;

//Set baud rate and input pin
   void setup() {
   Serial.begin(115200);
   //Serial.begin(230400);
   pinMode(analogInPin, INPUT);
   s=micros();
 }

//Loop for reading samples of data
void loop() {
  t=micros()-s;
  
  if((int)(t - a) >= 0)  {
    v=analogRead(analogInPin);
    Serial.println(v);  // voltage
    a += 1000;
  } 
  delayMicroseconds(650);
}
