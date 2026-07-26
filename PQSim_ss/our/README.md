# Near Clifford Circuit Simulator
I have modified the `translator.py` so that the output .txt file has slightly different format (see observable_map.txt)

Also, I decided to read the stabilizer tableau directly from the .txt file.
In the `main.cpp`, check the `print_profile()` function, you can see that there is a unordered_map called `profile`, this is the profile gathered from sampling.

## Usage
```
make clean

make

./build/simulator

```

# Start-Up Near CLifford Circuit Simulator
The method is implemented based on the start-up paper

## Usage
```
cd SuperSim/qsplit_mlft
# Change the input circuit (uncut) flename in the SuperSim/qsplit_mlft/compute_fidelities.py
python3 compute_fidelities.py
```
In the `__main__` part, the `profile` is the final quantum circuit probability profile, can be used to calculate fidelities for comparison.


