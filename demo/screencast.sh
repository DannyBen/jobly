#!/usr/bin/env bash
sleep 5
jobly send Deploy
sleep 2
jobly send Deploy version:1.0
sleep 2
curl http://localhost:3000/do/Greet?name=Jimmy
