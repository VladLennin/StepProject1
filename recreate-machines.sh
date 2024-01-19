#!/bin/bash

cd ./Vm1
vagrant destroy --force
vagrant up

cd ..

cd ./Vm2
vagrant destroy --force 
vagrant up