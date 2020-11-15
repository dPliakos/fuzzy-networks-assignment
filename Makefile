# Runs the demo script
default:
	time octave ./demo/trained.m

# Runs the main script
run:
	time octave ./script.m

# Requires the envvar N
# Runs the script under the gnu-parallel
par:
	time seq $N | parallel ./parallel/run_script.sh
	python3 ./parallel/find-best.py
