```mermaid
graph TB
a("head:&b")-->b("b:&c")
b-->c("c:&d")
c-->d("d:&e")
d-->e("e:&c")
e-->c
```