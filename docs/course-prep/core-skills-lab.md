
> This document is made to support students in Lab 1: *Core skills and working with remote servers*. Everything you learn in this lab is directly applicable to working with your Raspberry Pi.


## SSH
---

If you are unable to SSH make sure your OS is completely up to date.

**What tool should I use to SSH?**

* Mac (Unix) and Linux machines: just use your terminal
* WIndows: a lightweight beginner friendly tool would be *Git for Windows*

<br>

**Making new ssh keys**

!!! info "why ssh keys?"

    When you SSH into a server you have the option of using a *password* or a *unique key*. A clear explanation: "Passwords are generally, predictably, unavoidably weak. While it is possible to have strong passwords, time and again it has been shown that people will use weak passwords and have poor password practices" [source](https://security.stackexchange.com/questions/69407/why-is-using-an-ssh-key-more-secure-than-using-passwords)


* With either *terminal* (for Mac & Linux) or *command line* (for Windows) run the following command: `ssh-keygen -t ed25519 -C YOUR_EMAIL` 
* You will be prompted for a file name for the private key. You may accept the default.
You will be prompted for a **passphrase**. This is important as it is used to protect your private key.
    * !!! warning "Do not forget this passphrase"
* By default, your private key should be stored in your home/user directory under `.ssh/id_ed25519`. This version of the key will be encrypted and protected with your passphrase. 
    * You’ll also find a public key in `.ssh/id_ed25519.pub`. 
    * Please note that the `.ssh` folder is hidden, you will want to use your command line to get to it.

> Your public key will sit on your server, and you will use your secret private key to to prove that you are you, and securely and remotely login to your server.

<br>

**Specify which private key to use**

Format: `ssh -i <pathToFile> <user>@<ip address OR hostname>` <br>
Example: `ssh -i ~/.ssh/id_ed25519 root@157.230.163.231`

<br>

## Web Server
---

> There are several web servers that work straight out of the box and are **super** easy to use. We reccomend using `nginx` or `apache2`.

**Add user**: It's not safe to do all of your work as `root`. Root is similar to an admin, they have full access to everything. Add a new user that has less privileges by doing 


* `sudo adduser <newUsername>`
* add them to the sudo group `sudo usermod -aG sudo <newUsername>`
* add ssh key for them: `ssh-copy-id -f -i ~/.ssh/<fileName> <userName>@<target>`

**Allow password auth** 
* `vim /etc/ssh/sshd_config`
* Find the `PasswordAuthentication no` setting and prefix it with a `#` comment character.
Settings don’t take effect automatically. Use the systemctl tool to restart the sshd service, i.e., `systemctl restart sshd`.



**Install web server** <br>
`sudo apt install nginx`

Verify that the service installed correctly by running `systemctl status nginx` and confirming that the nginx service is loaded and running.

**Copying files** <br>
For instructions go to Welcome > Bash commands > scroll to bottom of page

<br>