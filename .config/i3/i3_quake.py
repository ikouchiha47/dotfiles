#!/bin/env python

""" quake it """

import os
import sys
import time
from i3c import I3

def log(text):
    with open("/home/rebecca/.config/i3/quake.log", "a") as f:
        f.write(text + "\n")


i3 = I3(log)
QUAKE_NAME = '__quake_'


def get_current_workspace():
        """ get info of focused workspace """
        return [ws for ws in i3.get_workspaces() if ws['focused']][0]

def get_name():
        """ get quake terminal name of current workspace """
        ws_num = get_current_workspace()['num']
        return QUAKE_NAME + str(ws_num)

def float_it(title):
    i3.command('for window [title={title}], floating enable'.format(title=title))

def quake_conf(title, conf):
        """ resize terminal to make it looks top down or bottom up """
        workspace = get_current_workspace()
        rect = workspace['rect']
        wx, wy, width, wh  = rect['x'], rect['y'], rect['width'], rect['height']

        height = int(wh * conf['ratio'])
        posx = wx

        if conf['pos'] == 'bottom':
                posy = wy + wh - height
        else: 
                posy = wy

        log("x={}, y={}".format(posx, posy))

        box = { 'title': title, 'width': width, 'height': height, 'posx': posx, 'posy': posy }
        return '[title={title}],' 'scratchpad show, resize set {width} px {height} px, move position {posx}px {posy}px, focus'.format(**box)

def hide(title, conf):
        i3.command('[title={title}], move scratchpad'.format(title=title))

def show(title, conf):
    i3.command(quake_conf(title, conf))

def toggle_quake(conf):
    """ toggle quake """
    quake_term = i3.get_tree().find_named(get_name())
    
    # forget it I am done
    if not quake_term:
        log("shit broke")
        return

    title = quake_term[0]['name']

    n = i3.scratchpad()
    term = None
    if n: term = n.find_named(title)
    
    # if term is in scratchpad then bring it to front
    if term: show(title, conf)
    else: hide(title, conf)
    

def is_launched():
    title = get_name()
    qt = i3.get_tree().find_named(title)

    if qt: return (qt[0]['name'], True)
    return (title, False)

def launch(title, conf):
    quake_term = i3.get_tree().find_named(title)

    if not quake_term:
        os.execvp("alacritty", ["alacritty", "-t", title])
    else:
        toggle_quake(conf)

conf = { 'ratio': 0.25, 'pos': 'top' }

(title, status) = is_launched()

if status:
    toggle_quake(conf)
else:
    float_it(title)
    launch(title, conf)
         
