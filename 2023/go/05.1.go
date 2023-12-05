package main

import (
	"fmt"
	"io"
)

func init() {
	resolvers["05.1"] = func(r io.Reader) error {
		b, _ := io.ReadAll(r)
		fmt.Println(string(b))
		return nil
	}
}
