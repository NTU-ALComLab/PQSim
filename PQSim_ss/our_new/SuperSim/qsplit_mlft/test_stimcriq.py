import cirq
a, b = cirq.LineQubit.range(2)
c = cirq.Circuit(
    cirq.H(a),
    # cirq.CNOT(a, b),
    cirq.measure(a, key="a"),
    cirq.measure(b, key="b"),
)
sampler = cirq.Simulator()
result = sampler.run(c, repetitions=30)

print("cirq: ", result)
import stimcirq
sampler = stimcirq.StimSampler()
result = sampler.run(c, repetitions=30)

print("stim: ", result)
# prints something like:
# a=000010100101000011001100110011
# b=000010100101000011001100110011