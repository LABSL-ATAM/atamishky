#!/bin/bash
md5sum *.xsl | perl -nE '/(.+) (.+)/ and say $1,$2' > md5s.sec
