import subprocess, re, json, sys

def synthesize(verilog_file, top_module, lib_file='nangate45.lib'):
    script = f"""
read_verilog {verilog_file}
hierarchy -check -top {top_module}

flatten

proc; opt; fsm; opt; memory; opt
techmap; opt
dfflibmap -liberty {lib_file}
abc -liberty {lib_file} -constr constraints.sdc
clean
stat -liberty {lib_file}
"""
    with open('temp_synth.ys', 'w') as f:
        f.write(script)

    result = subprocess.run(
        ['yosys', '-s', 'temp_synth.ys'],
        capture_output=True,
        text=True
    )

    log = result.stdout + result.stderr

    if result.returncode != 0:
        raise RuntimeError(log)

    return parse_stats(log)

def parse_stats(log):
    ppa = {}

    m = re.search(r'Chip area for.*?:\s+([\d.]+)', log)
    ppa['area_um2'] = float(m.group(1)) if m else None

    m = re.search(r'Number of cells:\s+(\d+)', log)
    ppa['cell_count'] = int(m.group(1)) if m else None

    m = re.search(r'Longest topological path.*?\((\d+) levels?\)', log, re.S)
    ppa['logic_levels'] = int(m.group(1)) if m else None

    return ppa

if __name__ == '__main__':
    ppa = synthesize(sys.argv[1], sys.argv[2])
    print(json.dumps(ppa, indent=2))
