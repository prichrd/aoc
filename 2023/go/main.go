package main

import (
	"fmt"
	"io"
	"os"
)

type resolver func(io.Reader) error

var resolvers = map[string]resolver{}

func main() {
	if len(os.Args) != 2 {
		panic("missing resolver")
	}

	resolver := os.Args[1]
	fn, ok := resolvers[resolver]
	if !ok {
		panic(fmt.Sprintf("resolver '%s', not implemented", resolver))
	}

	if err := fn(os.Stdin); err != nil {
		panic(fmt.Sprintf("error while resolving '%s': %s", resolver, err))
	}
}
