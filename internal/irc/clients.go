package irc

type ClientClass int

const (
	OperatorClientClass ClientClass = iota
)

type Client struct {
	Nickname     string
	RealHostName string
	UserName     string
}
