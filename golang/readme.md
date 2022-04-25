# learning golang

## 1. install
1. download
2. $ rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.1.linux-amd64.tar.gz
3. export PATH=$PATH:/usr/local/go/bin
4. $ go version
ok!

## 2. helloworld

1. mkdir hello # mkdir hello
2. go mod init hello  # init dir
3. coding
```go
package main
import "fmt"

func main() {
    fmt.Println("Hello, World!")
}
```
