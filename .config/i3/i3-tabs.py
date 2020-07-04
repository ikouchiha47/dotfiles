import json
import subprocess


"""
Execute the given command and return the 
output as a list of lines
"""
def command_output(cmd):
    output = {}
    if cmd:
        proc = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, \
                                 stderr=subprocess.STDOUT)
        outs, errs = proc.communicate()

        if outs: return outs.decode("utf-8") 
    return output


def should_appear(tree_dict):
    conds = [
        lambda tree: tree["layout"] == "dockarea",
        lambda tree: tree["name"].startswith("i3bar for output"),
        lambda tree: tree["name"].startswith("polybar"),
        lambda tree: tree["window"] == None
    ]

    for cond in conds:
        if cond(tree_dict) == True: return False

    return True

def find_windows(tree_dict, window_list):
    if ("nodes" in tree_dict and len(tree_dict["nodes"]) > 0):
        for node in tree_dict["nodes"]:
            find_windows(node, window_list)
    else:
        if should_appear(tree_dict):
            window_list.append(tree_dict)

    return window_list        


def forward(window_list):
    next_index = -1

    for i in range(len(window_list)):
        if (window_list[i]["focused"] == True):
            next_index = i+1
            break
    return next_index

def backward(window_list):
    next_index = len(window_list)

    for i in range(len(window_list)-1, -1, -1):
        if (window_list[i]["focused"] == True):
            next_index = i-1
            break
    return next_index

def main():
    output = command_output("i3-msg -t get_tree")
    tree = json.loads(output)
    window_list = find_windows(tree, [])

    next_index = forward(window_list)

    #print(window_list, next_index, len(window_list))

    next_id = 0
    if next_index == -1 or next_index == len(window_list):
        next_id = window_list[0]["window"]
    else:        
        next_id = window_list[next_index]["window"]

    print(next_id)

main()
