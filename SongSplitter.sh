#!/bin/bash

INPUT="Paupers Dough.wav"
DURATION=3            # seconds per segment
STEP=1.5              # seconds to shift between segments (50% overlap)
TOTAL=$(soxi -D "$INPUT")  # total length in seconds

COUNT=0
START=0

while (( $(echo "$START + $DURATION <= $TOTAL" | bc -l) )); do
    OUTFILE=$(printf "segment_%03d.wav" $COUNT)
    sox "$INPUT" "$OUTFILE" trim "$START" "$DURATION"
    echo "Created $OUTFILE from $START to $(echo "$START + $DURATION" | bc)"
    START=$(echo "$START + $STEP" | bc)
    COUNT=$((COUNT + 1))
done