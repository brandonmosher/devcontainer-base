#!/usr/bin/env python3

import glob
import re
from pathlib import Path
import os
from subprocess import Popen, PIPE

update_build = set(Path('update_build').read_text().splitlines())
update_push = set(Path('update_push').read_text().splitlines())

dockerfilepaths = [Path(dfp) for dfp in glob.glob("./*/Dockerfile")]

m = {}
for dockerfilepath in dockerfilepaths:
    dockerfiletext = dockerfilepath.open('r').read()
    f = str(dockerfilepath.parent)
    t = re.match(r'^FROM.*', dockerfiletext).group()
    if '-' not in t:
        continue
    t = t.split('-')[1]
    if f not in m:
        m[f] = set()
    m[f].add(t)

completed = set()
def build(target, tag):
    if (target in completed) or (target not in update_build):
        return
    if target in m:
        for dep in m[target]:
            build(dep, tag)
    
    print("Building {}...".format(target))
    p = Popen([
        'docker',
        'build',
        '--no-cache',
        '-t',
        'brandonmosher/devcontainer-{}:{}'.format(target, tag),
        Path(target).resolve()
    ], stdout=PIPE, stderr=PIPE, stdin=PIPE)
    out = Path('{}.out'.format(target))
    out.open('wb').write(p.stderr.read())
    out.open('ab').write(p.stdout.read())
    
    if target not in update_push:
        return
    
    cmd = 'docker push brandonmosher/devcontainer-{}:{}'.format(target, tag)
    print("Pushing {}...".format(target))
    p = Popen([
        'docker',
        'push',
        'brandonmosher/devcontainer-{}:{}'.format(target, tag)
    ], stdout=PIPE, stderr=PIPE, stdin=PIPE)
    out.open('ab').write(p.stderr.read())
    out.open('ab').write(p.stdout.read())

    completed.add(target)

for target in m:
    build(target, 'latest')

