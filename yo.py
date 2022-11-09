from kafka import KafkaConsumer
import numpy as np
import sys
import time

DEVICE_PROFILES = {
    "boston": {'temperature': (0.5,1), 'humidity': (0.5,1), 'pressure': (0.5,1)},
    "chicago": {'temperature': (0.5,1), 'humidity': (0.5,1), 'pressure': (0.5,1)},
    "newyork": {'temperature': (0.5,1), 'humidity': (0.5,1), 'pressure': (0.5,1)},
}

if len(argv)!=2 or argv[1] not in DEVICE_PROFILES:
    print("please provide a valid device name")
    for key in DEVICE_PROFILES:
        print(key)
    print(f"\nformat: {argv[0]} device_name")
    exit(1)

profile_name = argv[1]
profile = DEVICE_PROFILES[profile_name]

producer = KafkaProducer(bootstrap_servers='localhost:9092')

while True:
    temp = np.random.normal(profile['temperature'][0], profile['temperature'][1])
    hum = np.random.normal(profile['humidity'][0], profile['humidity'][1])
    press = np.random.normal(profile['pressure'][0], profile['pressure'][1])
    message = f"{profile_name},{temp},{hum},{press}"
    producer.send('weather', message.encode('utf-8'))
    print("sending data to kafka")
    time.sleep(5)
