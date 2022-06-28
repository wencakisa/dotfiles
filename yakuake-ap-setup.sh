#!/bin/bash

# Give Yakuake a couple of seconds before executing `qdbus` commands
sleep 2

function addSession {
  qdbus org.kde.yakuake /yakuake/sessions addSession
}

function setActiveTabTitle {
  ACTIVE_SESSION_ID=$(qdbus org.kde.yakuake /yakuake/sessions activeSessionId)
  qdbus org.kde.yakuake /yakuake/tabs setTabTitle $ACTIVE_SESSION_ID $1
}

function runCommand {
  qdbus org.kde.yakuake /yakuake/sessions runCommand $1
  sleep 0.5
}

# Servers & shells (4-grid)
function shellsTerminalSetup {
  setActiveTabTitle "Main"

  TERMINAL_ID_0=$(qdbus org.kde.yakuake /yakuake/sessions activeTerminalId)

  # Top-left side - BE server
  runCommand "apbe"
  runCommand "pmr"

  TERMINAL_ID_1=$(qdbus org.kde.yakuake /yakuake/sessions splitTerminalLeftRight $TERMINAL_ID_0)

  # Top-right side - FE server
  runCommand "apfe"
  runCommand "yarn start"

  # Bottom-left side - BE shell
  qdbus org.kde.yakuake /yakuake/sessions splitTerminalTopBottom $TERMINAL_ID_0
  runCommand "apbe"

  # Bototm-right side - FE shell
  qdbus org.kde.yakuake /yakuake/sessions splitTerminalTopBottom $TERMINAL_ID_1
  runCommand "apfe"
}

# Front-end editor session
function frontEndEditorSetup {
  addSession
  setActiveTabTitle "FE"

  runCommand "apfe"
  runCommand "nvim"
}

# Back-end editor session
function backEndEditorSetup {
  addSession
  setActiveTabTitle "BE"

  runCommand "apbe"
  runCommand "nvim"
}

shellsTerminalSetup
frontEndEditorSetup
backEndEditorSetup
