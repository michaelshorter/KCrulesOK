#!/bin/bash

# Define base directory (where the script, source files, and output folders live)
BASE_DIR="/Users/kgrh8/Desktop/KCrulesOK/KC full songs"
INPUT_DIR="$BASE_DIR"
OUTPUT_BASE="$BASE_DIR/segments"
DURATION=3
STEP=1.5

# Create base output directory
mkdir -p "$OUTPUT_BASE"

# Loop through each .wav file in the directory
for INPUT in "$INPUT_DIR"/*.wav; do
    # Get just the filename without path or extension
    FILENAME=$(basename "$INPUT")
    NAME="${FILENAME%.*}"

    echo "Processing \"$FILENAME\"..."

    # Make a subdirectory for segments from this file
    OUTPUT_DIR="$OUTPUT_BASE/$NAME"
    mkdir -p "$OUTPUT_DIR"

    # Get total duration
    TOTAL=$(soxi -D "$INPUT")
    COUNT=0
    START=0

    # Segment loop
    while (( $(echo "$START + $DURATION <= $TOTAL" | bc -l) )); do
        OUTFILE=$(printf "%s/segment_%03d.wav" "$OUTPUT_DIR" $COUNT)
        sox "$INPUT" "$OUTFILE" trim "$START" "$DURATION"
        echo "  Created $OUTFILE from $START to $(echo "$START + $DURATION" | bc)"
        START=$(echo "$START + $STEP" | bc)
        COUNT=$((COUNT + 1))
    done

    echo "Done with \"$FILENAME\"."
    echo
done
