//Initialize variables
   int i = 0;
   unsigned t = 0;   // the time variable 
   unsigned v = 0;   // the voltage value
   unsigned s=0;  // start time

   const int analogInPin = A11;
   

//Set baud rate and input pin
   void setup() {
   Serial.begin(115200);
   pinMode(analogInPin, INPUT);
   s=millis();
 }

//Loop for reading samples of data
void loop() {
  t=millis()-s;
  v=analogRead(analogInPin);

  Serial.print(t); // time
  Serial.print(' ');
  Serial.println(v);  // voltage
  
  delay(5);      // sampling interval in ms
}
