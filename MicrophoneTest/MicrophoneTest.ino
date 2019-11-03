//these define the pin connections
const int microphonePin = A0; //the microphone positive terminal will connect to analog pin A0 to be read
const int ledPin = 13;        //the code will flash the LED connected to pin 13

int sample; //the variable that will hold the value read from the microphone each time
int bubbsOff = 0;
int bubbsOn = 1;

const int threshold = 908; //the microphone threshold sound level at which the LED will turn on

void setup()
{
    pinMode(ledPin, OUTPUT); //sets digital pin 13 as output
    Serial.begin(9600);      //sets the baud rate at 9600 so we can check the values the microphone is obtaining on the Serial Monitor
}

void loop()
{
    sample = analogRead(microphonePin); //the arduino takes continuous readings from the microphone

    if (sample > threshold)
    {
        digitalWrite(ledPin, HIGH); //if the reading is greater than the threshold value, LED turns on
        analogWrite(sample, bubbsOn);
        Serial.println(bubbsOn);
        Serial.write(bubbsOn);
        delay(500);                //LED stays on for a half a second
        digitalWrite(ledPin, LOW); //LED turns off
    }
    else
    {
        analogWrite(sample, bubbsOff);
        Serial.println(bubbsOff);
        Serial.write(bubbsOff);
    }
    // Serial.println(sample);
    delay(150);
}
