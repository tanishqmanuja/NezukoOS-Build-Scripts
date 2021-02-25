#!/bin/bash

repo sync --force-sync frameworks/base
repo sync --force-sync packages/apps/Settings
repo sync --force-sync packages/apps/Extra
repo sync --force-sync packages/apps/Themer
repo sync --force-sync packages/apps/ThemePicker
