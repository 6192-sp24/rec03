Continuing on our Fibonacci example.

We will be discussing:
- Konata traces
- Loading into memory
- Concurrency and EHRs
- Using FIFOs
- and more!

## Fibonacci 5 Structure

- We will be adding Konata trace to our Fibonacci module.
- We will be adding better tests that are less ad hoc.
- Some tests we'll be looking at:
  - Descending numbers
  - Ascending numbers
  - Random numbers
  - Random numbers with 30% repeat bias
- Time permitting, we may inspect synthesis.

## Testing Infrastructure

Q: Where do we generate the Konata trace? Inside the inner module or in the top module?
A: Probably inside, though it's not such a big deal right now.

Q: What do we want to see in our Konata?
A: When our calculation starts and ends.

### To generate test cases

- Generate in Python
- Store prompts in one, store answers in another file as hex files.
- Load these into their respective BRAMs.
- In the top level module, we will feed in the prompts and we will compare responses to the answers.

### To test an implementation

- We will run each test case and then store the summary in a log.
- We will casually ignore synthesis this time, but there are two main ways:
  - Take the Verilog and synthesize it using some tool (we would probably just use 6.191's synth tool for Minispec)
  - Use the new open-source [SiliconCompiler](https://github.com/siliconcompiler/siliconcompiler)