# You should probably not do this for your labs.
"""
Generates a BSV file for a particular test case.
"""
def generate_fibonacci_tests(filename: str, inputs: list):
    with open(filename + ".bsv", "w") as f:
        count = 0
        state = filename.capitalize()
        # start sends a request
        def start(i: int):
            nonlocal count
            s = f'''rule {filename}{count} if (state == {state} && count == {count}); call_start({i}); endrule\n'''
            f.write(s)
            count += 1

        # check checks that the response is correct
        def check(i: int):
            nonlocal count
            s = f'''rule {filename}{count} if (state == {state} && count == {count}); call_get({i}); endrule\n'''
            f.write(s)
            count += 1
        
        def finish():
            s = f'''rule finish_{filename} if (state == {state} && count == {count}); $display("Done"); $finish(0); endrule\n'''
            f.write(s)

        answers = do_fibonacci(inputs)

        for i in range(len(inputs)):
            start(inputs[i])
            check(answers[i])

        finish()

"""
For a given input, produce a list of the corresponding answers.

OK, not optimal, but whatever.
"""
def do_fibonacci(l: list):
    out = [0 for i in l]
    cache = dict()

    for i, e in enumerate(l):
        a = 1
        b = 0
        for j in range(e):
            a, b = a + b, a

        cache[e] = a
        out[i] = a
    return out

rising = [i for i in range(1, 44)]
generate_fibonacci_tests("rising", rising)

generate_fibonacci_tests("falling", rising[::-1])