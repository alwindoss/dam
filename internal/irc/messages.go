package irc

import (
	"errors"
	"log"
	"strings"
)

type Message struct {
	Prefix        string
	Command       string
	CommandParams [15]string
}

func (m *Message) Parse(msg string) error {
	// first trim the message, ensure this is the first operation done in this method
	// as further operations assume that there are no leading and trailing spaces in the msg
	msg = strings.TrimSpace(msg)

	if msg == "" || msg == "\r\n" {
		return errors.New("message is empty")
	}
	if strings.HasPrefix(msg, ":") {
		log.Printf("message has a prefix")
	}
	return nil
}
