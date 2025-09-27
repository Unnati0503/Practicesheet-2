#!/usr/bin/env python3
# simple_func.py
import time

count = 0

def producer():
    global count
    for i in range(5):
        count += 1
        print("Produced:", count)
        time.sleep(1)

def consumer():
    global count
    for i in range(5):
        count -= 1
        print("Consumed:", count)
        time.sleep(1)

if __name__ == "__main__":
    producer()
    consumer()
