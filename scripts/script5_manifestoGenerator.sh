#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Interactive script to generate a personalized philosophy statement.

read -p "What open-source tool do you use daily? " TOOL
read -p "In one word, what does 'freedom' mean to you? " FREEDOM
read -p "What would you build and share freely? " BUILD

OUTPUT="manifesto_$(whoami).txt"

echo "--- The Open Source Manifesto of $(whoami) ---" > $OUTPUT
echo "Created on: $(date)" >> $OUTPUT
echo "I believe that $TOOL is essential for progress." >> $OUTPUT
echo "To me, freedom is $FREEDOM." >> $OUTPUT
echo "I commit to building $BUILD for the community." >> $OUTPUT

echo "Manifesto saved to $OUTPUT"
cat $OUTPUT
