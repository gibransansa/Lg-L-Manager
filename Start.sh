#!/bin/bash

#   Copyright 2014 Joey Rizzoli
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

L=~/Lg-LManager
L3=~/Lg-LManager/e400
L5=~/Lg-LManager/e610
L7=~/Lg-LManager/p700
L32=~/Lg-LManager/e430
ROOTURL=http://download.chainfire.eu/372/SuperSU/UPDATE-SuperSU-v1.86.zip?retrieve_file=1
ROOTZIP=~/res/root.zip
DEVICE=
ACTION=$1

#----------------------------------------------------------------------------------------


detect_device() {
    echo "Connect device..."
    DEVICE=$(adb wait-for-device shell getprop ro.product.device)

    if [[ $? != 0 ]] ; then
        echo "adb return error."
        exit -1
    fi

    if [[ "$DEVICE" == e400* ]]; then
      echo "Detected connected Lg L3"
      DEVICE=E400
    elif [[ "$DEVICE" == e610* ]]; then
      echo "Detected connected Lg L5"
      DEVICE=E610
    elif [[ "$DEVICE" == p700* ]]; then
      echo "Detected connected Lg L7"
      DEVICE=p700
    elif [[ "$DEVICE" == e430* ]]; then
      echo "Detected connected Lg L3 II"
      DEVICE=E430
      else
      echo "Connected device is not supported"
      exit 0
    fi
}

headerprint () {
  clear
  echo "################################"
  echo "# LG L Manager                 #"
  echo "# Selected device: $DEVICE        #"
  echo "################################"
  fi
}

home () {
  echo "1- Install         4- Full Unlock"
  echo "2- Backup          5- Shell"
  echo "3- Push and Pull"
  echo " "
  echo "0- Exit            00-About"
  echo " "
  read -p "?" Choice
  if  [ "$Choice" = "1" ]
    then
      install
      break
  elif  [ "$Choice" = "2" ]
    then
      back1
      break
  elif  [ "$Choice" = "3" ]
    then
      pnp
      break
  elif  [ "$Choice" = "4" ]
    then
      unlock
      break
  elif  [ "$Choice" = "5" ]
    then
      shelll
      break
  elif  [ "$Choice" = "0" ]
    then
      close
      break
  elif  [ "$Choice" = "00" ]
    then
      about
      break
  elif  [ "$Choice" = "make me a sandwich" ]
    then
      read -p "Do it yourself:" Choice
      if [ "$Choice" = "sudo make me a sandwich" ]
        then
          read -p "OK"
          break
      else
      echo "Wrong input"
      fi
      break
  else
  echo "Wrong input"
  fi
  home
  }
