#!/bin/zsh

local loremIpsum=$(
    cat <<EOF
Lorem ipsum dolor sit amet, consectetur adipiscing elit
Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur
EOF
)

# see https://github.com/ChrisBuilds/terminaltexteffects

local effect="bouncyballs"

# beams,binarypath,blackhole,bouncyballs,bubbles,burn,colorshift,crumble,decrypt,errorcorrect,
# expand,fireworks,matrix,middleout,orbittingvolley,overflow,pour,print,rain,randomsequence,
# rings,scattered,slice,slide,spotlights,spray,swarm,synthgrid,unstable,vhstape,waves,wipe

echo "$loremIpsum" | tte $effect
