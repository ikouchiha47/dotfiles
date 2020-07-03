from typing import List
import os

def xrandr() -> str:
    return os.popen("xrandr --query | grep ' connected' -A 1 | grep -v '\-\-'").read().split("\n")

def write(data):
    with open("/home/<user>/udev.log", "a+") as f:
        f.write(str(data) + "\n")

def monitors(results: List[str]) -> List[str]:
    output_res: List[str] = [results[i*2:i*2+2] for i in range(0, len(results)//2)]
    monitors: List[str] = []

    for op in output_res:
        output, res = op

        output = output.strip() if output else None
        res = res.strip() if res else None

        if output and res:
            monitors.append(
                (output.split(' ')[0], res.split(' ')[0])
            )

    return monitors


def setup_monitor(monitors):
    command = "xrandr {monitor_conf} --output VIRTUAL1 --off"

    resolutions = [res.split('x') for (monitor, res) in monitors]
    widths = [int(width) for (width, height) in resolutions]

    position = max(widths)

    monitor_conf = []
    for (index, (monitor, res)) in enumerate(monitors):
        if index == 0:
            monitor_conf.append("--output {} --primary --mode {} --pos 0x0".format(monitor, res))
        else:
            monitor_conf.append("--output {} --mode {} --pos {}x0".format(monitor, res, position))
    

    return command.format(monitor_conf=' '.join(monitor_conf))
        
   
write("monitor change detected")

monitors = monitors(xrandr())
write("Setting up monitors {}".format(";".join([monitor for (monitor, res) in monitors])))

output_res = setup_monitor(monitors)
os.popen(output_res)

