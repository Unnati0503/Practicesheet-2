#!/usr/bin/env python3
import os, time

count = 0

def producer():
    global count
    for i in range(5):
        count += 1
        print("Parent produced:", count)
        time.sleep(1)

def consumer():
    global count
    for i in range(5):
        count -= 1
        print("Child consumed:", count)
        time.sleep(1)

if __name__ == "__main__":
    ret = os.fork()
    if ret == 0:  # child
        consumer()
    else:         # parent
        producer()
