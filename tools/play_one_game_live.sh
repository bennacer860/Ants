#!/usr/bin/env sh
./playgame.py -So --player_seed 42 --end_wait=0.25 --verbose --log_dir game_logs --turns 1000 --map_file maps/maze/maze_04p_01.map "$@" \
	"python sample_bots/python/HunterBot.py" \
	"python sample_bots/python/LeftyBot.py" \
	"python sample_bots/python/HunterBot.py" \
	"ruby ../MyBot.rb" |
java -jar visualizer.jar
