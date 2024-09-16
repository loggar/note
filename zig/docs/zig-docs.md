# zig

Getting started: https://ziglang.org/learn/getting-started/

## install

```
brew install zig
```

## hello-world

```
mkdir hello-world
cd hello-world
zig init
```

## Run test

```
zig test test_1.zig
```

Run all test under the test directory:

```sh
find ./src-test -name "*.zig" -printf "%p: " -exec zig test {} \;
```

## Run a file that has main function

```
zig run main.zig
```
