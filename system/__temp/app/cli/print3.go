package cli

import (
	"github.com/spf13/cobra"
)

func Print3() *cobra.Command {
	var cmdPrint3 = &cobra.Command{
		Use:   "print3 [string to print]",
		Short: "Print3 anything to the screen",
		Args:  cobra.MinimumNArgs(1),
		Run: func(cmd *cobra.Command, args []string) {
			println("Third", args[0])
		},
	}
	return cmdPrint3
}
