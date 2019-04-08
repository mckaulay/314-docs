# Setup

## Install `tshark`
To perform captures from your pi you will need to install `tshark` (command line version of wireshark) on your Pi using the `apt` command. When prompted to allow non-root users to run packet captures, say **yes**.

After install, run `sudo usermod -aG wireshark pi` and **reboot**. This command is adding the `pi` user to the `wireshark` group. This group was created when you installed `tshark` and it is used to allow non-root users to run packet captures.

After rebooting, test `tshark` by running `tshark -i wlan0` and confirming that packets are captured. Type `CTRL-C` to quit capturing.

## Use `tshark`

### Viewing Capture in Wireshark
> Use the command `man tshark` from the pi for more info about tshark and how to use it.

You have two options for conducting the packet captures that are required in this project. 1) You can use ssh/scp to copy the files back to your computer to examine in Wireshark, or 2) you perform a live remote capture by piping the output of tshark through `ssh` into Wireshark on your computer.

If you choose the second option, the following command will launch the remote capture on your Pi (filtering for DNS traffic): `ssh pi@titan.local tshark -s0 -F libpcap -i wlan0 -w - 'port 53' | wireshark -k -i -`. **Windows users** will need to add the wireshark program directory (`c:\program files\wireshark\`) to the system path and should use the standard command prompt (not Powershell) to launch the remote capture.
