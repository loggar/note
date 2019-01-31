edit (windows) -> run (linux)

```
sed -i 's/\r$//' ./test.sh

chmod +x ./test.sh && bash ./test.sh
```

combine

```
sed -i 's/\r$//' ./test.sh && sudo chmod +x ./test.sh && sudo bash ./test.sh
```