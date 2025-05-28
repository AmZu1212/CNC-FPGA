#include <Arduino.h>

#define STEP_PIN 32
#define DIR_PIN 33
#define STEP_DELAY_US 500  // Adjust this for speed: start with 5000us (5ms) for slow, reliable movement
#define MICRO_STEP_FACTOR 16
#define MOTOR_STEPS 200
#define DIRECTION_SWITCH_DELAY_MS 500
// driver only reacts to RISING EDGEs. each rising edge a step
void setup() {
  pinMode(STEP_PIN, OUTPUT);
  pinMode(DIR_PIN, OUTPUT);

  digitalWrite(STEP_PIN, LOW);
  digitalWrite(DIR_PIN, LOW);
}


void loop() {
  // One direction
  digitalWrite(DIR_PIN, HIGH);
  for (int i = 0; i < MOTOR_STEPS * MICRO_STEP_FACTOR; i++) {
    // pulse
    digitalWrite(STEP_PIN, HIGH);
    delayMicroseconds(STEP_DELAY_US);// us
    digitalWrite(STEP_PIN, LOW);
    delayMicroseconds(STEP_DELAY_US);
  }
  delay(DIRECTION_SWITCH_DELAY_MS);// ms

  // Opposite direction
  digitalWrite(DIR_PIN, LOW);
  for (int i = 0; i < MOTOR_STEPS * MICRO_STEP_FACTOR; i++) {
    digitalWrite(STEP_PIN, HIGH);
    delayMicroseconds(STEP_DELAY_US);
    digitalWrite(STEP_PIN, LOW);
    delayMicroseconds(STEP_DELAY_US);
  }
  delay(1000);
}
