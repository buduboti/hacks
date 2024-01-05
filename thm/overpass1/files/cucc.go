//usr/bin/env go run "$0" "$@"; exit

package main

import (
	// "bufio"
	"encoding/json"
	"fmt"
	"io/ioutil"
	// "os"
	// "strconv"
	"strings"
)

type passListEntry struct {
	Name string `json:"name"`
	Pass string `json:"pass"`
}

func rot47(input string) string {
	var result []string
	for i := range input[:len(input)] {
		j := int(input[i])
		if (j >= 33) && (j <= 126) {
			result = append(result, string(rune(33+((j+14)%94))))
		} else {
			result = append(result, string(input[i]))
		}
	}
	return strings.Join(result, "")
}

func main() {
	filepath := "/Users/buduboti/Documents/thm/overpass/files/overpass"
	buff, err := ioutil.ReadFile(filepath)
	if err != nil {
		fmt.Println(err.Error())
	}
	//Decrypt passwords
	buff = []byte(rot47(string(buff)))
	//Load decrypted passwords
	var passlist []passListEntry
	err = json.Unmarshal(buff, &passlist)
	if err != nil {
		fmt.Println(err.Error())
	}
	fmt.Println(passlist)
}
