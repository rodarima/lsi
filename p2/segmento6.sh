#!/bin/bash

for i in {0..255}; do
	printf "2002:0a0a:66%02x::1\n" $i
done

