setup.git
=========
Prereq: submit ssh key to GitHub
```sh
ssh-keygen -t rsa -C “email_address”
cat .ssh/id_rsa.pub
```

Clone and run this on a new EC2 instance running Ubuntu 12.04.2 LTS to
configure both the machine and your individual development environment as
follows:

```sh
cd $HOME
sudo apt-get update
sudo apt-get install -y git-core
git clone https://github.com/wokumura/se001setup.git
./se001setup/setup.sh   
```

See also http://github.com/startup-class/dotfiles and
[Startup Engineering Video Lectures 4a/4b](https://class.coursera.org/startup-001/lecture/index)
for more details.





