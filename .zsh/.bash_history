ls
ruby -e "$(curl -fsSLk https://gist.github.com/raw/323731/install_homebrew.rb)"
ls -al
ls -tl
ls -atl
pwd
which brew
echo $PATH
brew update
brew install git
brew update
ls
ls -a
cd /usr/local/
ls
ls -a
cat .gitignore 
mv .gitignore{,.bak}
brew update
brew help
brew doctor
vim ~/.profile
vim ~/.profile
echo $PATH
vim ~/.profile
vim ~/.profile
gs
ls
brew doctor
brew doctor
brew update
ruby --version
sudo gem list
brew search ext
brew search fuse
brew search virtualbox
curl -s https://rvm.beginrescueend.com/install/rvm | bash
git clone https://github.com/bitprophet/dotfiles
mv dotfiles/* dotfiles/.* ./
rmdir dotfiles/
. .bashrc
rvm
rvm info
rvm install 1.8.7
rvm --default 1.8.7
ruby --version
which ruby
geml
alias | grep gem
rvm 1.8.7@global gem install wirble
geml
rvm gemset create testgemset
rvm use testgemset
rvm use 1.8.7@testgemset
geml
gemi thor
geml
rvm use 1.8.7
geml
rvm gemset delete testgemset
rvm 1.8.7@global gem install vagrant
geml
v status
cd /tmp
v init
v box list
v box help
v box add lucid64 http://files.vagrantup.com/lucid64.box
vim Vagrantfile 
v up
v ssh
v destroy
v status
v up
v ssh
v destroy
brew install tmux
mkdir /usr/local/tmp
brew install tmux
cd /Volumes/Time\ Machine/Backups.backupdb/ytram/Latest/
ls
cd Ytram/
ls
cd Users/jforcier/
cd .ssh
ls
cat authorized_keys 
cat id_rsa
cat id_rsa.pub 
diff id_rsa.pub authorized_keys 
cp id_rsa* ~/.ssh/
cd
ssh www.bitprophet.org
cd Documents/
ls
mkdir Code
ls
cd Code/
ls
git clone git@github.com:WhiskeyMedia/diplomatico
git clone git@github.com:WhiskeyMedia/vines
git clone git@github.com:WhiskeyMedia/rubix
sudo easy_install virtualenv virtualenvwrappeer
sudo easy_install virtualenv virtualenvwrapper
. ~/.bashrc
mkvirtualenv diplomatico
wk diplomatico 
cd ..
mkdir whiskey
mv * whiskey/
ls
wk diplomatico 
ls
pip install -r requirements.txt 
fab -l
pip install -r ../vines/requirements.txt 
fab -l
pip install -e . && pip install -e ../vines
fab -l
paver help
brew search vin
brew search vim
cd ../...
cd ../..
git clone git@git.bitprophet.org:wiki2
git clone git@www.bitprophet.org:~/wiki/BPO.git wiki2
git clone www.bitprophet.org:~/wiki/BPO.git wiki2
cd wiki2
ls
vim laptop_stands.mdwn
ssh bitprophet.org
wk diplomatico 
ls
vim config/templates/dbslave/postgres_streaming.pl 
gs
paver deploy -M -H dbslave1.whiskeymedia.com
vim requirements.txt 
pip install -r requirements.txt 
paver deploy -M -H dbslave1.whiskeymedia.com
paver deploy -M -H dbslave1.whiskeymedia.com -F dbslave
paver deploy -M -H dbslave1.whiskeymedia.com
ssh dbslave1.whiskeymedia.com
ssh dbslave2.whiskeymedia.com
wk diplomatico 
gs
gs
gd
gcm "Update threshold for PG replication alerts" config/
gcam "We use jinja...:)"
gs
gps
cd ~/.ssh
ls
cp id_rsa.pub authorized_keys
ls
cd Desktop/
ls
du -scm iTunes
wk diplomatico 
gpl
vim diplomatico/cluster/host.py 
vim diplomatico/cluster/host.py 
stty size
stty size
stty size
ls
wk cookbooks 
v status
knife cookbook help
gems cookbook
gems chef
gems opcode
geml
ls
vim Gemfile
bundle help
bundle open
bundle open vagrant
bundle help
bundle init
gs
vim Gemfile 
bundle install
knife cookbook help
knife help
knife help list
knife help cookbook site
knife cookbook help
knife cookbook site search python
knife cookbook site install python
knife configure
rm -rf ~/.chef/
knife help
knife cookbook site --help
knife cookbook site install --help
knife cookbook site install python
knife configure -r `pwd`
knife cookbook site install python
gs
tree
gs
ls -a
cat .git/config 
gs
ls
ls cookbooks/
gs
ls
ls cookbooks/
knife cookbook help
knife cookbook metadata base
knife cookbook test
gs
v reload
v destroy
v up
v reload
v reload
v destroy
v up
gs
cat Gemfile
git add Gemfile cookbooks/
gs
git rm cookbooks/base/metadata.json 
git rm cookbooks/base/metadata.json -f
gs
echo "Gemfile.lock" >> .gitignore
git add .gitignore 
gs
gcamp "Gemfile, slight reorg, packages, python"
ls cookbooks/
ssh dbslave2.whiskeymedia.com
ssh dbslave1.whiskeymedia.com
cd 
gpl
cd Documents/Code/
ls
git clone git@git.bitprophet.org:cookbooks
git clone git@github.com:bitprophet/vagrant
cd vagrant/
ls
geml
rvm info
rvm gemset use global
geml
geml | egrep -v "^\*"
geml | egrep -v "^\*" | awk '{print $1}'
geml | egrep -v "^\*" | awk '{print $1}' | xargs gemu
geml | egrep -v "^\*" | awk '{print $1}' | xargs gem uninstall
geml
gemi wirble bundler
wk vagrant
ls
wk cookbooks 
rvm gemset create cookbooks
wk cookbooks 
geml
cd ../vagrant/
ls
bundle gem jforcier-vagrant
rm -rf jforcier-vagrant/
bundle help
ls
gem help
gem build vagrant.gemspec 
ls
cd -
geml
gemi ../vagrant/vagrant-0.7.6.dev.gem 
v status
cat Vagrantfile 
v box list
v up
ls
v ssh -p
ls
gs
tree
brew install tree
tree
mkdir -p cookbooks/minecraft/recipes
vim cookbooks/minecraft/recipes/default.rb
gs
vim cookbooks/base/recipes/default.rb 
gs
git mv cookbooks/base/recipes/{default,users}.rb
gs
gcm "Split things up more"
vim cookbooks/base/recipes/packages.rb
echo "Applications, homedir, homebrew" > Desktop/Arq-targets.txt
wk cookbooks 
gpl
v status
v destroy
v up
v ssh -p
v destroy
v up
v destroy
v up
v ssh -p
gs
gd
gcamp "Fix sudoers mode"
v ssh -p
scp -P2200 localhost:/etc/ssh/sshd_config ./
scp -P2201 localhost:/etc/ssh/sshd_config ./
netstat -tan | grep LIST
scp -P2222 localhost:/etc/ssh/sshd_config ./
ls
mv sshd_config cookbooks/base/files/default/
v ssh -p
ssh -i lol -p 2222 localhost
man ssh
man ssh
SSH_AUTH_SOCK=no ssh -p 2222 localhost
v provision
SSH_AUTH_SOCK=no ssh -p 2222 localhost
v ssh
v provision
SSH_AUTH_SOCK=no ssh -p 2222 localhost
SSH_AUTH_SOCK=no ssh -p 2222 localhost
v destroy ; v up
v provision
v status
v halt
v destroy
v up
v provision
SSH_AUTH_SOCK=no ssh -p 2222 localhost
v provision
SSH_AUTH_SOCK=no ssh -p 2222 localhost
v provision
SSH_AUTH_SOCK=no ssh -p 2222 localhost
v provision
SSH_AUTH_SOCK=no ssh -p 2222 localhost
SSH_AUTH_SOCK=no ssh -p 2222 localhost
gs
gd
git add cookbooks/
gs
gcm "Force key based auth"
gps
v ssh -p
knife cookbook site search apt
knife cookbook site install apt
v provision
irb
v provision
v provision
v ssh
v provision
v provision
v provision
v ssh
v destroy ; v up
v destroy
v up
v ssh
mkdir -p cookbooks/minecraft/files/default
v provision
v ssh
gs
git add cookbooks/
gs
gd Vagrantfile
gs
gdc
gs
git add Vagrantfile 
gcm "Java6 for Minecraft"
gps
wk cookbooks 
vim cookbooks/base/recipes/users.rb 
wk wiki2
ls
gpl
git rm tvs.mdwn 
vim index.mdwn 
gs
gcamp "Bought a TV"
vim cars.mdwn 
open /Applications/Vine\ Server.app/
pgrep Vine
ps -ax
ps -ax | grep Vine
kill 80586
ps -ax | grep Vine
echo ".vagrant, Music, Virtualbox VMs" >> Desktop/Arq-Excludes.txt
wk wiki2
gpl
vim index.mdwn 
wk cookbooks 
gpl
wk wiki2
ls
vim cars.mdwn 
gs
gl
git reset --hard HEAD^^
gps --force
git push --force origin master
git push origin :master
gpl
gs
gl
git revert HEAD
git log
git revert HEAD^^
gs
gps
brew search python
brew info python
ssh www.bitprophet.org
wk diplomatico 
ack Supervisor
ack supervisor
wk cookbooks 
v ssh -p
cd Documents/Code/
git clone https://github.com/linsomniac/cony.git
ls
cd cony/
ls
./cony.py 
ls
vim cony.py 
./cony.py 
vim cony.py 
cd /tmp
ls
cd
cd Documents/Code/
ls
git clone https://github.com/opscode/chef.git
cd chef
ls
ack "def running"
cd chef/lib/chef
ack "def running"
vim resource/service.rb 
ack pattern
vim provider/service/simple.rb 
vim provider/service/simple.rb 
wk cony 
ls
./cony.py 
./cony.py 
vim local_settings.py
./cony.py 
vim local_settings.py 
./cony.py 
irb
gs
gpl
git add .vim/ftplugin/ini.vim 
gs
gcm "Ini syntax"
gps
gps
git remote show
git remote show origin
vim .git/config 
gps
wk diplomatico 
ack supervisor
vim diplomatico/cluster/roles.py 
irb
wk wiki
wk wiki2 
gs
ls
vim insurance.mdwn 
wk vagrant 
be vagrant status
be vagrant up
v ssh -p
be vagrant ssh -p
be vagrant ssh -p
be vagrant halt
be vagrant up
v destroy
be vagrant destroy
v up
be vagrant up
v destroy
be vagrant destroy
wk cookbooks 
gs
v up
v destroy
v up
v ssh -p
ls
v package
v box list
v box
cd ~/.vagrant/
ls
cd boxes/
ls
mv base{,.bak}
cd ~/Documents/Code/Coo
cd ~/Documents/Code/cookbooks/
ls
v box add base package.box 
ls
rm package.box 
v status
v destroy ; v up
v reload
gs
gs
gd
gcamp "vfile update"
cd /tmp
wget http://www.minecraft.net/download/minecraft_server.jar?v=1306088833288
brew install wget
brew install wget
wget http://www.minecraft.net/download/minecraft_server.jar?v=1306088833288
wget http://www.minecraft.net/download/minecraft_server.jar
ls
file minecraft_server.jar*
ls -lh minecraft_server.jar*
ls -l minecraft_server.jar*
rm minecraft_server.jar\?v\=1306088833288 
rm minecraft_server.jar 
wk cookbooks 
v status
v destroy
v up
knife cookbook site search java
knife cookbook site install java
gs
gd
gcamp "trying java cookbook"
knife cookbook site install java
v reload
v ssh -p
v reload
v reload
v ssh -p
v ssh -p
v ssh -p
v ssh -p
v ssh -p
v ssh -p
v ssh -p
ssh live -t screen -x irc
wk cookbooks 
v status
v up
v ssh -p
gs
gd
v ssh -p
v provision
v ssh -p
v reload
v help
v help reload
v --help
ls
ls cookbooks/
tree
wk vagrant 
gs
rvm list
rvm list gemsets
be
ls
rvm gemset create vagrant
rvm use ruby-1.8.7-p334@vagrant
bundle install
v status
be vagrant status
wk cookbooks 
v status
v destroy
wk vagrant 
ls
cp ../cookbooks/Vagrantfile ./
vim Vagrantfile 
vim Vagrantfile 
wk cookbooks 
vim Vagrantfile 
gs
gco cookbooks/
gs
gl
git help revert
gs
gl
git revert HEAD..HEAD^^
git revert HEAD...HEAD^^
gs
gl
gs
vim Vagrantfile 
vim Vagrantfile 
cp ~/Downloads/vim-ini-syntax-03/ini.vim ~/.vim/ftplugin/
vim Vagrantfile 
wk diplomatico 
tree config/
cat config/templates/dbslave/pg_backup.rb 
wk cookbooks 
v provision
v provision
v provision
gs
gd
gcamp "Obtain Minecraft server jar"
v provision
v provision
gs
gd
gcamp "Set up screen 'service' for server"
gs
gd
gcamp "tweak"
v destroy; v up
v provision
v destroy ; v up
v provision
v provision
v provision
gs
gd
gd
git add -p
gs
gdc
gcm "Comment cleanup"
git add -p
gs
gdc
gd
git add -p
gs
gd
gdc
gcm "Don't create dotfiles"
gd
gcamp "More robust manual 'process' management"
v reload
netstat -tan | grep LIST
gs
gd
gcamp "Port forward for testing minecraft"
ls
gs
mkdir -p cookbooks/minecraft/templates/default
mv cookbooks/minecraft/{files,templates}/default/minecraft.conf
gs
mv cookbooks/minecraft/templates/default/minecraft.conf{,.erb}
gs
gd
git co .
gs
git clean -fd
gs
irb
gs
ls
rmdir cookbooks/supervisor
rm -rf cookbooks/supervisor
gs
tree
tree mi
tree cookbooks/minecraft/
ls
mv cookbooks/minecraft/templates/default/minecraft.conf{,.erb}
tree cookbooks/minecraft/
v reload
v status
v ssh -p
v provision
v destroy ; v up
v status
v destroy
v up
v provision
v provision
v provision
v destroy ; v up
gs
git add cookbooks/minecraft/templates/
gs
gd
gd
gs
git add cookbooks/
gcamp "Supervisor yay"
netstat -tan | grep LIST
v provision
v provision
gs
gs
gd
git add cookbooks/
gs
gcm "First stab at server customization"
gps
gs
gco cookbooks/
gs
rm cookbooks/minecraft/templates/default/world_backup.rb 
gs
gps
git rel
cd ..
ls
mg rel
wk co
wk cony 
./cony.py 
wk cookbooks 
v destroy
ls
vim TODO
gs
git add TODO
gcamp "TODO"
wk cookbooks 
v ssh -p
wk wiki2
vim minecraft.mdwn 
gcamp "more seeds"
ls
vim minecraft.mdwn 
gs
cd
wk wiki2
vim minecraft.mdwn 
gcamp "lol"
wk wiki2
gs
gd
vim cars.mdwn 
gs
vim cars.mdwn 
gs
gps
fgl
gl
git remote show
git remote show orig
git remote show origin
vim .git/config 
git pull
gs
git rel
gps
wk wiki2
gpl
vim index.mdwn 
git rm yogurt.mdwn 
gs
git add index.mdwn 
gs
gcm "yogurt now google doc"
gps
vim insurance.mdwn 
gfs
gs
gcamp "ins"
wk cookbooks 
gpl
wk wiki2
vim cars.mdwn 
gs
git stash
gpl
git stash apply
gs
gd
gcamp "update to ins"
vim cars.mdwn 
gs
wk cookbooks 
gpl
ls
vim cookbooks/minecraft/recipes/default.rb 
cd Documents/Code/
ls
cd whiskey/
ls
echo "a b c" | while read line; do echo $line; done
for x in "a b c"; do echo $x; done
echo "animevice
comicvine
giantbomb
tested
screened
whiskey-corp
whiskey-cookbooks
petrol
distillery" | while read $repo; do git clone git@github.com:WhiskeyMedia/$repo; done
ssh dbslave1.whiskeymedia.com
ssh dbslave2.whiskeymedia.com
ssh fortress.enemykite.com
wk diplomatico .
cd ..
git clone git@github.com:WhiskeyMedia/diplomatico.wiki
wk diplomatico.wiki 
gs
vim Monitoring-research.md 
wk diplomatico.wiki 
gs
gd
vim Monitoring-research.md 
gs
gcamp "Monitoring notes"
wk diplomatico.wiki 
gs
gpl
vim Monitoring-research.md 
gs
gcamp "Attempting to figure out collectd data types"
cd Documents/Code/
ls
cd whiskey/
ls
echo "a b c" | while read line; do echo $line; done
for x in "a b c"; do echo $x; done
echo "animevice
comicvine
giantbomb
tested
screened
whiskey-corp
whiskey-cookbooks
petrol
distillery" | while read $repo; do git clone git@github.com:WhiskeyMedia/$repo; done
ls
echo "animevice
comicvine
giantbomb
tested
screened
whiskey-corp
whiskey-cookbooks
petrol
distillery" | while read $repo; do echo "git@github.com:WhiskeyMedia/$repo"; done
echo "animevice
comicvine
giantbomb
tested
screened
whiskey-corp
whiskey-cookbooks
petrol
distillery" | while read repo; do echo "git@github.com:WhiskeyMedia/$repo"; done
echo "animevice
comicvine
giantbomb
tested
screened
whiskey-corp
whiskey-cookbooks
petrol
distillery" | while read repo; do git clone git@github.com:WhiskeyMedia/$repo; done
gs
ls
cd ..
cd cookbooks/
gpl
ls
cat TODO
git mv TODO cookbooks/minecraft/
gcamp "derp"
v status
ls
wk cookbooks 
v status
v up
v status
v destroy client
v status
v up client
gs
v status
v ssh server -p
v ssh client -p
cd /tmp/
git clone https://github.com/indygreg/collectd-carbon.git
cd collectd-carbon/
ls
gl
v ssh server -p
wk cookbooks 
v ssh server -p
v ssh server -p
sudo pip uninstall graphite-web
v ssh server -p
v ssh server -p
wk cookbooks 
ls
vim cookbooks/monitoring/recipes/collectd.rb 
gs
git mv cookbooks/monitoring/recipes/{collectd_,}client.rb
gs
git mv cookbooks/monitoring/recipes/{collectd_,}source.rb
git mv cookbooks/monitoring/recipes/{collectd_,}server.rb
gs
git reset HEAD cookbooks/monitoring/recipes/{server,source}.rb
gs
git reset HEAD cookbooks/monitoring/recipes/collectd_{server,source}.rb
gs
git reset HEAD cookbooks/monitoring/recipes/default.rb
gs
mv cookbooks/monitoring/recipes/{,collectd_}server.rb
mv cookbooks/monitoring/recipes/{,collectd_}source.rb
gs
git co cookbooks/monitoring/recipes/default.rb
gs
git add cookbooks/
gs
gcamp "WIP re: carbon plugin"
gs
git mv cookbooks/monitoring/recipes/{collectd_,}server.rb
git mv cookbooks/monitoring/recipes/{collectd_,}source.rb
gs
git rm cookbooks/monitoring/recipes/default.rb 
gs
tree cookbooks/monitoring/
git mv cookbooks/monitoring/recipes/{collectd_,}client.rb
gs
tree cookbooks/monitoring/
vim cookbooks/monitoring/recipes/collectd_carbon.rb 
tree cookbooks/monitoring/
gs
vim cookbooks/monitoring/recipes/collectd
vim cookbooks/monitoring/recipes/collectd.rb 
gs
vim cookbooks/monitoring/recipes/graphite.rb
gs
vim cookbooks/monitoring/templates/default/collectd.conf.erb 
wk co
wk cookbooks 
v ssh client -p
ls
tree cookbooks/monitoring/
ls cookbooks/monitoring/attributes/
gs
git add cookbooks/
gs
gcamp "WIP reorg"
v provision client
v provision client
v provision server
gs
tree cookbooks/monitoring/
git mv cookbooks/monitoring/recipes/{collectd_,}carbon.rb
gs
v provision server
v provision server
v provision server
v provision server
v provision server
gs
gd
gs
gcamp "tweaks"
vim cookbooks/monitoring/recipes/server.rb 
v provision server
ack pip
ack python
ack python cookbooks/monitoring/
ack python cookbooks/ba
ack python cookbooks/base/
v provision server
v provision server
cd cookbooks/monitoring/
ls
cd templates/
ls
cd default/
ls
wget http://bazaar.launchpad.net/~graphite-dev/graphite/graphite-0.9.8/download/head:/examplegraphitevhost-20090914212853-ipw2xv62m5qk672r-1/example-graphite-vhost.conf
ls
wk woo
pwd
wk cookbooks 
ls
mv cookbooks/monitoring/templates/default/{example-graphite-vhost,vhost}.conf
v provision server
v provision server
v provision server
irb
gs
gco cookbooks/python/
gs
v ssh server -p
ssh localhost -p 2200
ssh localhost -p 2201
ssh localhost -p 2222
scp -p 2222 localhost:/opt/graphite/conf/{carbon.conf,graphite.wsgi}.example cookbooks/monitoring/templates/default/
scp -P 2222 localhost:/opt/graphite/conf/{carbon.conf,graphite.wsgi}.example cookbooks/monitoring/templates/default/
mv cookbooks/monitoring/templates/default/carbon.conf{.example,}
mv cookbooks/monitoring/templates/default/graphite.wsgi{.example,}
gs
v reload
mv cookbooks/monitoring/templates/default/graphite.wsgi{,.erb}
gs
git add cookbooks/
gs
git add Vagrantfile 
gs
gcamp "Graphite webapp up but uninitialized"
scp -P 2222 localhost:/opt/graphite/conf/storage-schemas.example cookbooks/monitoring/templates/default/
scp -P 2200 localhost:/opt/graphite/conf/storage-schemas.example cookbooks/monitoring/templates/default/
scp -P 2222 localhost:/opt/graphite/conf/storage-schemas.conf.example cookbooks/monitoring/templates/default/
mv cookbooks/monitoring/templates/default/storage-schemas.conf.{example,erb}
mv cookbooks/monitoring/templates/default/carbon.conf{,.erb}
gs
git add cookbooks/
gs
git rm cookbooks/monitoring/templates/default/carbon.conf
gs
gcamp "Webapp db initialized"
tree cookbooks/monitoring/templates/default/
mv cookbooks/monitoring/templates/{,default/}carbon-cache.supervise.erb
ls
tree cookbooks/monitoring/templates/
gs
git add cookbooks/
gs
gdc
gcamp "Carbon listener daemon"
gs
gd
gcamp "Tweaks/bugfixes"
gs
gs
gr
gpl
vim .vimrc
gs
gcamp "Long-line highlighting mostly just annoying. as long as I can autoformat to 79 I should be ok"
wk co
wk cookbooks 
vim cookbooks/minecraft/TODO 
gcamp "todo update"
vim cookbooks/minecraft/TODO 
gs
gd
gcamp "plugin"
wk wiki2
vim cars.mdwn 
gas
gs
gpl
wk cookbooks 
v ssh -p
v ssh -p
v ssh -p
env
env | grep RACK
cat ~/.bash_local
vim ~/.bash_local
. .bashrc
env | grep OPEN
vim ~/.bash_local
. .bashrc
nova flavor-list
wk cookbooks 
ls
vim fabfile.py 
cd ..
ls
git clone git@git.bitprophet.org:dp_fabfile
git clone git@git.bitprophet.org:fabfile
ls
ls fabfile/
mv fabfile/ dp_fabfile
cd dp_fabfile/
ls
wk cookbooks 
vim fabfile.py 
cp ../dp_fabfile/cloud.py ./
mkdir fabfile
mv fabfile.py fabfile/__init__.py
mv cloud.py fabfile/
ls
cd fa
cvd fabfile/
cd fabfile/
ls
vim __init__.py 
gs
gd
gs
cd ..
gs
git add fabfile
git add requirements.txt 
gs
git rm fabfile.py
gs
gcm "Shitty beefup of chef related fab tasks"
gps
fab -l
ls
wk cookbooks 
ls -al
cd ..
cd cookbooks/
ls
gs
fab -l
fab -d converge
fab -d spinup
fab spinup:test,256,"recipe[base]"
gs
wk cookbooks 
ls
v ssh -p
v ssh -p
v ssh -p
date
v ssh -p
v ssh -p
v ssh -p
v destroy
vim Vagrantfile 
cd /tmp
ls
cat Vagrantfile 
vim Vagrantfile 
v status
v up
v destroy ; v up
vim Vagrantfile 
v destroy
vim Vagrantfile 
vim Vagrantfile 
v destroy
v up
v ssh
ls ~/.vagrant/boxes/
v destroy
cd ~/.vagrant/bixes
cd ~/.vagrant/boxes/
ls
mv base{,.newer}
mv base{.bak,}
cd -
vim Vagrantfile 
v destroy ; v up
v ssh
v ssh -p
v ssh -p
v package
cd ~/.vagrant/boxes
ls
mv base{,.slightly_older}
ls
cd -
ls
v box add base package.box 
rm package.box 
ls
mv ~/.vagrant/boxes/base.* ./
ls
cd
wk cookbooks 
cd ~/.virtualenvs/cookbooks/src/littlechef/
ls
cd littlechef
ls
ack "mkdir -p tmp"
vim chef.py 
vim chef.py 
wk cookbooks 
gs
ls
ls nodes
vim .gitignore 
gs
wk cookbooks 
gs
vim .gitignore 
gs
git add cookbooks/minecraft/metadata.
git add cookbooks/minecraft/metadata.rb 
gs
git add .gitignore fabfile/ requirements.txt 
gs
rm ohai.out 
gcamp "Littlechef integration works ok"
gs
gcamp "wtf RSC has no lsof"
gs
stty size
wk cookbooks 
v up
v ssh -p
v ssh -p
v reload
 gs
git add cookbooks/
gs
gdc
gs
gc, 
gcm "First stab at attribute-ifying everything"
gs
scp -r -p 2200 localhost:/srv/minecraft/plugins ./
scp -r -P 2200 localhost:/srv/minecraft/plugins ./
scp -r -P 2201 localhost:/srv/minecraft/plugins ./
scp -r -P 2222 localhost:/srv/minecraft/plugins ./
ls
ls
ls plugins/
scp -r -P 2222 localhost:/srv/minecraft/*.jar ./
ls
mv craftbukkit-0.0.1-SNAPSHOT.jar cookbooks/minecraft/files/default/
ls
mv plugins/Backup.jar cookbooks/minecraft/files/default/
mv plugins/Backup/config.ini cookbooks/minecraft/files/default/Backup-config.ini
gs
ls
irb
gs
git add cookbooks/
gs
gcamp "First stab at plugins (untested)"
ls -lh cookbooks/minecraft/files/default/
v package
mv package.box minecraft.box
gs
v up
v provision
v destroy
v up
gs
gd
gcamp "Bugfix"
ls
tree cookbooks/minecraft/
git mv cookbooks/minecraft/files/default/Backup-config.ini cookbooks/minecraft/templates/default/
git mv cookbooks/minecraft/templates/default/Backup-config.ini{,.erb}
gs
git add cookbooks/
gs
gcamp "Template-ify backup plugin"
v destroy
v up
v ssh -p
v destroy
v up
v ssh -p
v provision
v reload
v reload
gs
v package
cd ~/.vagrant/boxes/
ls
rm -rf base.bak
mv base{,.bak}
cd -
ls
v box add package.box base
v box add base package.box 
v destroy
gl
gs
rm package.box 
v destroy
gd
gcm "Bugfix" cookbooks/minecraft/attributes/
gs
gd
gcamp "Plugin notes"
v up
ls
gs
gd
gcamp "Let's have friendlies on"
v provision 
v provision 
gds
gs
gd
gs
git add cookbooks/
gs
gs
git add cookbooks/
gs
gcm "Logrotate"
gps
gs
gcamp "gc not worth it for now, offsite no point since going w rsc"
gs
ls
cat requirements.txt 
cat fabfile.py 
vim fabfile.py 
gs
rm minecraft.box 
gs
gd TODO
gd
gd cookbooks/
gcm "just gonna use fab meh" cookbooks/
gs
gd
gs
fab -l
cat requirements.txt 
vim requirements.txt 
pip install -r requirements.txt 
brew search pip
sudo easy_install pip
fab -l
pip install -r requirements.txt 
pip search openstack
pip install python-novaclient
nova --help
nova help boot
nova flavors
python --version
nova flavor-list
. ~/.bashrc
nova help
nova image-list
nova flavor-list
ssh live
ssh live
fab -l
ls
wk cookbooks 
deac
deactivate
pip freeze
mkvirtualenv --no-site-packages cookbooks
wk cookbooks 
geml
rvm info
vim ~/.bash_prompt 
. ~/.bashrc
ls
pip freeze
cat requirements.txt 
pip install -r requirements.txt 
fab -l
vim requirements.txt 
fab -l
pip install -r requirements.txt 
pip search nova
vim requirements.txt 
pip install -r requirements.txt 
fab -l
fab -d cloud_create
fab cloud_create:test
nova help
nova list
fab enable_backups:name=test
nova delete test
nova list
fab cloud_create:test2
nova delete test2
nova list
nova delete test
fab cloud_create:test2 prep2
pip install littlechef
fab cloud_create:test2 prep2
vim requirements.txt 
pip install -r requirements.txt 
nova delete test2
fab cloud_create:test prep2
fab --help
fab -H 184.106.199.217 -p testTa11hMW3k -- ls /
fab -H root@184.106.199.217 -p testTa11hMW3k -- ls /
fab -H root@184.106.199.217 -p testTa11hMW3k prep2
fab -H root@184.106.199.217 -p testTa11hMW3k converge2
fab -H root@184.106.199.217 -p testTa11hMW3k converge2
knife help
knife help cookbook
knife cookbook metadata base
fab -H root@184.106.199.217 -p testTa11hMW3k converge2
fab -H root@184.106.199.217 -p testTa11hMW3k converge2 --show=debug
fab -V
ls
mkdir roles
fab -H root@184.106.199.217 -p testTa11hMW3k converge2 --show=debug
fab -H root@184.106.199.217 -p testTa11hMW3k converge2
ls
mkdir nodes
fab -H root@184.106.199.217 -p testTa11hMW3k converge2
fab -H root@184.106.199.217 -p testTa11hMW3k converge2
fab -H 184.106.199.217  converge2
fab -H 184.106.199.217 prep2
nova list
nova delete test
fab spinup:test2
nova list
nova delete test2
fab spinup:test
fab -H 173.203.88.84 -- ls /
ls cookbooks/
ls cookbooks/monitoring/
ls cookbooks/monitoring/recipes/
fab -H 173.203.88.84 -- ohai > ohai.out
fab -H 173.203.88.84 -- ohai
nova list
nova delete test
nova spinup:minecraft,512
fab $*
fab spinup:minecraft,512
fab run_chef:minecraft
fab -H 184.106.199.249 run_chef:minecraft
knife cookbook metadata minecraft
fab -H 184.106.199.249 run_chef:minecraft
cp cookbooks/{base,minecraft}/metadata.rb 
vim cookbooks/minecraft/metadata.rb 
knife cookbook metadata minecraft
fab -H 184.106.199.249 run_chef:minecraft
ping minecraft.bitprophet.org
dscacheutil -flushcache
ping minecraft.bitprophet.org
ssh 184.106.199.249
vim Downloads/cluster_fabric.diff 
vim Downloads/cluster_fabric.diff 
cd Documents/Code/
ls
ls
ls
alias
brew install coreutils
ls
ls
mg pull
wk cookbooks 
v status
v destroy
cd /tmp
vim Vagrantfile
v init
vim Vagrantfile 
v up
v ssh -p
v destroy
wk cookbooks 
ls
gpl
v up
v destroy
vim Vagrantfile 
gs
vim cookbooks/minecraft/TODO 
gs
gd cookbooks/minecraft/recipes/
git add -p
gs
gcm "MC TODO update"
git add -p
gcm "Trying bukkit, seems to run ok"
git add -p
gcm "New seed"
gs
gps
vim cookbooks/minecraft/TODO 
gs
gcm "note" cookbooks/
gs
gps
gs
gd
vim cookbooks/minecraft/TODO 
gs
vim fabfile/__init__.py 
cd
gs
gd
gco .bash_prompt
gs
wk wiki2
gpl
vim cars.mdwn 
ssh live -t screen -x irc
ssh live -t screen -x irc
ssh live -t screen -x irc
ssh www.bitprophet.org
cat ~/.ssh/config
vim ~/.ssh/config
ssh www.bitprophet.org
man tmux
man tmux
brew install bash-completion
ln -s "/usr/local/Library/Contributions/brew_bash_completion.sh" "/usr/local/etc/bash_completion.d"
wk wiki2
. ~/.bashrc 
ls
vim ca
vim cars.mdwn 
wk fabric
gpl
cd Documents/Code/
ls
git clone git@git.fabfile.org:fabric
wk fabric 
mkvirtualenv fabric
deactivate 
rmvirtualenv fabric
mkvirtualenv --help
mkvirtualenv -p `which python2.5` --no-site-packages fabric
wk fabric
ls
fab -V
pip install -r requirements.txt 
pip install -e .
fab -V
ls
gba
gco origin/1.0
git --version
brew search git
brew info git
gco -b origin/1.0
gs
gco master
gb -d origin/1.0
gb -d "origin/1.0"
gb -D "origin/1.0"
gs
gba
git help checkout
git help branch
git help checkout
gco -t origin/1.0
gba
gco -t origin/1.1
gco -t origin/0.9
gba
gco 1.1
gco 1.0
fab -V
tmux -ls
tmux --help
tmux -l
man tmux
tmux list-clients
tmux list-sessions
man tmux
tmux attach -t 7
tmux list-sessions
tmux attach -t 1
tmux attach -t
tmux list-sessions
tmux attach -t 11
tmux attach -t 10
ssh live
ssh live
ping --help 184.106.199.249
ping -c 10 184.106.199.249
ssh 184.106.199.249
ssh minecraft.bitprophet.org
. .bashrc
ssh minecraft.bitprophet.org 
ping minecraft.bitprophet.org
ssh 184.106.199.249
ssh 184.106.199.249
ping minecraft.bitprophet.org
ssh minecraft.bitprophet.org
ssh live -t screen -x irc
ssh live -t screen -x irc
deactivate
cd
pwd
ls
vim INSTALL 
./configure --prefix=/usr/local/Cellar/tig/0.17
ls
vim INSTALL 
make configure
make configure
./configure --prefix=/usr/local/Cellar/tig/0.17
make install documentation
ls
vim INSTALL 
make configure && make install install-doc
make configure
exit
make configure && make install
brew search iconv
brew install libiconv
make configure && make install
./configure
make install
make configure
./configure --prefix=/usr/local/Cellar/tig/0.17
vim INSTALL 
make
brew search curses
brew search curse
brew search ncurses
ls /usr/local/include/
ls /usr/lib
ls /usr/lib/libiconv.
brew install libiconv
make configure
./configure --prefix=/usr/local/Cellar/tig/0.17
make
ssh minecraft.bitprophet.org 
ssh minecraft.bitprophet.org 
wk wiki2
gs
vim minecraft.mdwn 
wk fabric
fab build_docs:y,y
fab build_docs
fab build_docs
gs
gs
gd
gd
gs
gcamp 
gcamp "Clarify rsync_project docstring re: trailing slashes"
gco master
git merge 1.0
gps
gco 1.1
git merge master
gs
vim fabric/version.py
gs
git add fabric/version.py
gs
gdc
vim fabric/version.py
git add fabric/version.py
gdc
gs
gc
gco 1.0
gco master
vim fabric/version.py
gs
gps
gr
gs
gco 1.1
gs
gco 0.9
fab test
gco 1.0
fab test
gco 1.1
fab test
gco master
fab test
gco 1.1
gba
gem search hub
gem search -b hub
gemi hub
gemu hub
which hub
alias | grep git
curl http://defunkt.io/hub/standalone -sLo ~/bin/hub && chmod 755 ~/bin/hub
ls ~/bin
cd
gs
gd
git add bin/hub "Stick hub in \$HOME, why not"
git commit bin/hub "Stick hub in \$HOME, why not"
git add bin/hub
git commit bin/hub "Stick hub in \$HOME, why not"
git commit -m  "Stick hub in \$HOME, why not"
gs
gps
alias
hub
hub alias
vim ~/.bash_alias
vim /Users/jforcier/.bash_aliases 
. .bashrc
alias | grep hub
git
wk fabric
git remote
git remote add goosemo
git fetch goosemo
gco -t goosemo/76-task-decorator 
gco master
gb -d 76-task-decorator 
gco 1.1
gl goosemo/76-task-decorator...
gs
gco -b 76-task-decorator goosemo/76-task-decorator 
git rebase --onto 1.1
git help rebase
git log 1.1..HEAD
git help rebase
git rebase 1.1
gl
git show 1.1:fabric/contrib/files.py
gs
git add fabric/contrib/files.py
git rebase --continue
git add fabric/contrib/files.py
git rebase --continue
git add fabric/contrib/files.py
git rebase --continue
gs
git rebase --skip
git rebase --abort
gs
gl
gs
gba
gco 1.1
gb -d 76-task-decorator 
gco -b 76-task-decorator-and-all
gs
gd ..goosemo/76-task-decorator 
gd ...goosemo/76-task-decorator 
gd ...goosemo/76-task-decorator > 76.diff
git help apply
git apply 76.diff
gs
ls
vim /Users/jforcier/.virtualenvs/postmkvirtualenv 
pip install bpython
bpython
ls
cd fabric
bpython
ls
cd ..
rmpyc
env | grep PY
ls
cd fabric
bpython
ls
cd /tmp/
ls
mkdir pytest
cd pytest
touch __init__.py
echo "foo = 'bar'" > foo.py
vim __init__.py 
python __init__.py 
wk fabric
git apply 76.diff
git apply 76.diff
git apply 76.diff
git apply 76.diff
man diff
info diff
info diff
git apply 76.diff
gs
 git blame fabric/decorators.py
git show cf61564f
git apply 76.diff
git apply 76.diff
git apply 76.diff
git apply 76.diff
git apply 76.diff
fab build_docs:y,y
git apply 76.diff
git help apply
git apply 76.diff
git apply 76.diff --recount
git apply 76.diff -v
git apply 76.diff
git apply 76.diff -v
git apply 76.diff
git apply 76.diff -v
git blame -L138,142 fabric/main.py
git apply 76.diff -v
git blame -L138,142 fabric/main.py
git apply 76.diff 
git apply 76.diff -v
git apply 76.diff -v
git apply 76.diff -v
git apply 76.diff -v
git apply 76.diff -v
gs
gco 1.1
git merge master
gco 76-task-decorator
git apply 76.diff -v
git apply 76.diff
git apply 76.diff -v
git apply 76.diff -v
gl
gco 1.1
git apply 76.diff -v
git apply 76.diff -v
git apply 76.diff -v
git apply 76.diff -v
git apply 76.diff -v
git apply 76.diff -v
git apply 76.diff -v
git apply 76.diff -v
git apply 76.diff -v
git apply 76.diff -v --check
git help apply
git apply 76.diff -v --check
git apply 76.diff -v --check
git apply 76.diff -v --check
gba
gb -d 76-task-decorator
gco 76-task-decorator
gb -d 76-task-decorator
gco 1.1
gb -d 76-task-decorator
gco 76-task-decorator-and-all 
gl
gs
git apply 76.diff -v --check
git blame -L125,130 tests/test_main.py
git show 85fe7bdc
git blame -L125,130 tests/test_main.py
git apply 76.diff -v --check
git apply 76.diff -v --check
git apply 76.diff -v --check
git apply 76.diff -v --check
git apply 76.diff -v --check
git apply 76.diff -v --check
git apply 76.diff -v --check
git apply 76.diff -v --check
git apply 76.diff -v --check
git apply 76.diff -v
gs
git add fabric/tasks.py
git add tests
gs
git add fabric/
gs
gdc
gdc | tig
brew install tig
brew update
cd /usr/local/
ls
brew help
brew outdated
ls -al
brew update
sudo du -scm Library
sudo cp -a Library{,.bak}
ls
brew update
brew update | egrep "^ "
brew doctor
git remote
git remote add origin https://github.com/mcxl/homebrew
git fetch origin
vim .git/config 
git fetch origin
git reset --hard origin/master
gs
brew update
brew update
gs
ls
brew outdated
brew upgrade git
brew install tig
ls
gs
rm -rf Library.bak/
vim Library/Formula/tig
vim Library/Formula/tig.rb 
git install tig
brew install tig
git install tig
vim Library/Formula/tig.rb 
gs
brew install tig
vim Library/Formula/tig.rb 
gs
brew help
brew help install
man brew
brew help install
brew install -vd tig
gs
git stash
brew install tig
wk fabric
gs
gdc
cd /usr/local/
ls
vim Library/Formula/tig.rb 
git stash apply
vim Library/Formula/tig.rb 
brew install tig
cd /tmp/
wget http://repo.or.cz/w/tig.git/snapshot/c2e1c3fc6576afe962ebaa82a8578210563be99d.tar.gz
md5 c2e1c3fc6576afe962ebaa82a8578210563be99d.tar.gz 
cd -
vim Library/Formula/tig.rb 
brew install tig
brew install tig -vd
brew install -vd tig
brew install -vd tig
brew install -vd tig
brew install -vd tig
brew install -vd tig
brew list
brew uninstall libiconv
brew install tig
brew doctor
brew missing
brew install -vd tig
brew install -vd tig
wk fabric
gs
gdc
git reset HEAD tests/test_version.py
gs
git co tests/test_version.py
gs
gs
gc
gb --help
gb --help
gb -m 76-task-decorator-and-all 76-task-decorator
gs
git help push
git push -u origin 76-task-decorator 
gpl
fab test
fab test
gs
gd
ack with_patched_object
gs
gcm "Update test env munging" tests
gs
fab test
fab test
gs
gd fabric/main.py
gs
git add -p fabric/main.py
gs
git co fabric/main.py
gs
git reset HEAD fabric/main.py
gs
gd fabric/main.py
gs
fab test
gs
gd
gcamp "Bit of cleanup"
bpython
wk fabric
vim fabric/contrib/project.py
vim fabric/contrib/files.py
vim 76.diff 
gs
vim TODO
gs
gd
gcamp "callable is a builtin :)"
wk fabric
vim TODO
gs
gd
fab test
tmux list-sessions
wk wiki2
vim cars.mdwn 
gs
gd
gcamp "more mc"
cd
ssh live -t screen -x irc
ssh live -t screen -x irc
ssh minecraft.bitprophet.org 
ssh live -t screen -x irc
ssh minecraft.bitprophet.org 
wk wiki2
ls
vim rabbit.mdwn
gs
git add rabbit.mdwn index.mdwn
gcm "rabbit"
gps
gpl
vim cars.mdwn 
gs
cd ..
mg pull
wk wiki2
vim cars.mdwn 
gpl
vim cars.mdwn 
wk wiki2
gpl
vim cars.mdwn 
gs
wk wiki2 
gpl
vim cars.mdwn 
tmux attach
tmux attach
tmux list-sessions
tmux attach -t 17
tmux attach -t 16
tmux list-sessions
tmux attach
tmux
gr
gps
cd Documents/Code/
ls
cd cony/
ls
git remote show origin
gs
gl
gd
ls
gs
ls
ls local_settings.py 
cat local_settings.py
ls
./cony.py 
brew search super
pip install supervisor
gs
pip freeze
rm -rf build/
gs
man tmux
screen
ps
kill 30918
ps
which screen
brew search screen
./cony.py 
ssh live -t screen -x irc
cd /Volumes/TI
cd /Volumes/Time\ Machine/
ls
cd Backups.backupdb/
ls
sudo rm -rf ytram
cd
cd /Volumes/Time\ Machine/
ls
cd Backups.backupdb/
ls
cd ytram/
ls
cd 2009-07-18-123600/
ls
ls -al
cd ..
ls
sudo rmdir *
ls
cd
wk cookbooks 
cd cookbooks/minecraft/files/default/
wget http://procrafter.de/downloads/mywarp/MyWarp.jar
gs
ssh minecraft.bitprophet.org 
ssh minecraft.bitprophet.org 
wk wiki2
wk cookbooks 
gs
fab -l
fab -H minecraft.bitprophet.org -- ls /
fab -H minecraft.bitprophet.org run_chef:minecraft
knife cookbook metadata --all
gs
fab -H minecraft.bitprophet.org run_chef:minecraft
ls
gs
mv cookbooks/minecraft/templates/default/MyWarp.settings{,.erb}
fab -H minecraft.bitprophet.org run_chef:minecraft
gs
git add coo
git add cookbooks/
gs
gcm "Add MyWarp plugin"
gps
gs
wk cookbooks 
cat cookbooks/minecraft/To
cat cookbooks/minecraft/TODO 
git rm cookbooks/minecraft/TODO
gs
gcm "ugh just use the wiki"
gps
gpl
gps
wk wiki2
gpl
vim minecraft.mdwn 
gs
gcamp "mc"
vim minecraft.mdwn 
gcamp "lol"
wk coo
ls
wk cookbooks 
ls
ls plugins/
ls
rm -rf plugins/
gs
git clean -nd
vim cookbooks/minecraft/
wk fabric
gpl
gco 1.0
gpl
cd
gpl
. .bashrc
cd -
ack Exception
bpython
bpython
bpython
vim
gco 76-task-decorator 
gs
gr
tmux list-sessions
tmux attach -t 13
tmux list-sessions
tmux attach 20
tmux attach -t 20
tmux list-sessions
tmux attach 21
tmux attach -t 21
tmux list-sessions
tmux new-session
tmux list-sessions
tmux --help
man tmux
tmux list-sessions
tmux rename-session -t 24 cony
tmux list-sessions
tmux list-sessions
ls
gr
git help pull
git help pull
gco 1.1
gpl
gco 1.0
gpl
gco master
gpl
gr
gco 76-task-decorator 
ls
gl
wk fabric
fab build_docs:y,y
fab build_docs:y,y
fab build_docs
fab build_docs
fab build_docs
fab build_docs
fab build_docs
fab build_docs
fab build_docs
gs
cd /tmp
ls
mkdir fabfile
cd fabfile
touch {__init__,django,provision,lb}.py
ls
tree .
mkdir db
touch db/migrate.py
touch db/fixtures.py
tree
wk fabric
fab build_docs
cd /tmp
ls
cd fabfile
ls
vim django.py
ls
vim db/migrate.py 
gs
ls
cd ..
bpython
ls
ls fabfile
wk fabric
gs
ls
cat TODO
rm TODO
gs
git add docs/api/core/tasks.rst
gs
git add docs fabric
gs
gc
gs
gps
wk fabric
vim docs/changes/1.1.rst 
wk fabric
gr
git --version
gco hudsontest 
wk fabric
gco 76-task-decorator 
gs
gl
vim docs/usage/execution.rst 
gs
gd
gcam "Reword how @task helps with namespaces"
gps
vim docs/usage/execution.rst 
gs
git add docs
git rebase -i HEAD^
gs
gcm "lol"
git rebase -i HEAD^^
gs
gl
git show HEAD
gs
gps --force
wk fabric
fab test
gl
fab build_docs:y,y
ack tasks-and
fab build_docs:y,y
fab build_docs
fab build_docs
cd /tmp/
ls
rm -rf fabfile
mkdir -p fabfile/db
touch fabfile/{__init__.py,db/{__init__.py,migrations.py},lb.py}
tree fabfile
cd fabfile
tree
wk fabric
bui
fab build_docs
gs
git add docs/usage/tasks.rst
vim docs/index.rst 
gs
git add docs/usage/execution.rst
gs
gcm "Big fleshing-out of docs re #76"
gps
gl
gs
rm 76.diff 
g
wk cony
./cony.py 
ls
gs
gd
git remote show origin
gs
ls
cat local_settings.py 
cp local_settings.py /tmp/
cp local_settings.py ~/tmp/
mkdir ~/tmp/
cp local_settings.py ~/tmp/
ls
gs
git stash
vim .git/config 
git pull
gs
git stash apply
gs
vim cony/__init__.py 
gs
gd
git reset HEAD cony
gs
gco cony
gs
git reset --hard HEAD
gs
ls
cat local_settings.py 
./cony-server 
gs
ls
./cony-server --help
cd ~/Documents/Code/cony/
ls
w3m
brew search elinks
brew install elinks
elinks "http://localhost:8080/?q=gh bitprophet/dotfiles"
elinks "http://localhost:8080/?query=gh bitprophet/dotfiles"
elinks "http://localhost:8080/?s=gh bitprophet/dotfiles"
ps -ax | grep cony
tmux list-sessions
tmux attach cony
tmux attach -t cony
tmux attach -t cony
gs
gr
gcam "Speling"
gs
gpl
gs
gps
open /Applications/Vine\ Server.app/
ps -ax | grep Vine
kill 50263
ps -ax | grep Vine
ssh minecraft.bitprophet.org 
wk wiki2
gpl
vim cars.mdwn 
gs
cd
gs
gd
gcamp "Speling"
wk fabric
gpl
vim fabric/main.py
gs
gd
gr
ssh minecraft.bitprophet.org 
gpl
gco master
gpl
gco 1.1
gpl
gr
gco master
gco 56-namespaces 
wk cookbooks 
gpl
vim cookbooks/minecraft/templates/default/server.properties.erb 
vim cookbooks/minecraft/attributes/default.rb 
gs
gcamp "ugh fuck passives"
fab -H minecraft.bitprophet.org run_chef:minecraft
gs
ssh minecraft.bitprophet.org 
ssh minecraft.bitprophet.org htop
ssh -t minecraft.bitprophet.org htop
free -m
ssh minecraft.bitprophet.org 
ssh live -t screen -x irc
ssh minecraft.bitprophet.org 
ssh minecraft.bitprophet.org
scp minecraft.bitprophet.org:/srv/minecraft/backups/11062011* /tmp/
wk cookbooks 
vim cookbooks/cony/files/default/
gs
gcamp "Fab code search"
fab -H www.bitprophet.org run_chef:cony
knife metadata --all
knife metadata create --all
knife cookbook metadata --all
fab -H www.bitprophet.org run_chef:cony
wk fabric
gco 1.0
vim fabric/state.py
ack output_prefix
vim fabric/io.py
ssh 184.106.199.249
host minecraft.bitprophet.org
wk wiki2
gpl
ls
vim minecraft.mdwn 
cd ..
mg branch
mg pull
rm -rf cony/
ls
rm -rf chef
cd wk
cd whiskey/
ls
mg pull
wk fabric
gr
ls
gco 56-namespaces 
gs
gl
ssh minecraft.bitprophet.org 
cd Backups/
ls
ls ../Documents/
mkdir minecraft
cd minecraft/
scp -r minecraft.bitprophet.org:/srv/minecraft/backups/* ./
rm -rf 01062011-074756.zip 01062011-074756.zip 
scp minecraft.bitprophet.org:/srv/minecraft/backups/10062011-065917.zip ./
wk cookbooks 
nova --help
nova help resize
nova resize minecraft 1024
nova list-flavors
nova flavor-list
nova resize minecraft 3
nova list
nova help
nova help resize-confirm
nova list
nova resize-confirm minecraft
ssh minecraft.bitprophet.org 
vim cookbooks/minecraft/attributes/
gcamp "MOAR RAM"
fab -H minecraft.bitprophet.org run_chef:minecraft
ssh minecraft.bitprophet.org 
ssh minecraft.bitprophet.org 
uptime
ssh live -t screen -x irc
ssh live -t screen -x irc
ssh live -t screen -x irc
ssh live -t screen -x irc
ssh live -t screen -x irc
cd Library/Application\ Support/minecraft/
ls
ln -s ~/Library/Application\ Support/minecraft/texturepacks/ ~/Downloads/
ln -s ~/Library/Application\ Support/minecraft/texturepacks/ ~/Downloads/texturepacks
ls ~/Downloads/
ls ~/Downloads/texturepacks
ls
cd texturepacks/
ls
zip -l 1307946167.3158.zip 
man zip
unzip -l 1307946167.3158.zip 
ls
mkdir painterlycustom
cp 1307946167.3158.zip painterlycustom/
cd painterlycustom/
unzip 1307946167.3158.zip 
ls
open .
cd ..
ls
mkdir painterlydefault
cp 1307942734.7367.zip painterlydefault/
cd .
cd painterlydefault/
ls
unzip 1307942734.7367.zip 
open .
ssh live -t screen -x irc
ssh live
ssh live -t screen -x irc
wk cookbooks 
ls
v status
cat Vagrantfile 
vim Vagrantfile 
v status
vim Vagrantfile 
gs
geml
rvm info
gemi sahara
v up
v sandbox on
v status
v ssh
v sandbox rollback
v ssh
v sandbox rollback && v ssh
v sandbox commit
v ssh
v sandbox rollback
v ssh
v sandbox commit
v sandbox off
gs
gd
gcm "Cleanup vfile"
gs
gcamp "Cleanup Vagrantfile"
python -m test.pystone
wk wiki2
gpl
vim minecraft.mdwn 
wk cookbooks 
vim cookbooks/cony/files/default/local_settings.py 
gs
gcamp "MC wiki search" && fab run_chef:cony -H www.bitprophet.org
vim cookbooks/cony/files/default/local_settings.py 
gcamp "MC wiki search" && fab run_chef:cony -H www.bitprophet.org
vim cookbooks/cony/files/default/local_settings.py 
gcamp "MC wiki search" && fab run_chef:cony -H www.bitprophet.org
cd
gr
gpl
wk wiki2
gpl
vim index.mdwn 
vim tv_box.mdwn
gs
git add index.mdwn tv_box.mdwn
gs
gcm "lol already decided on appletv whatevs"
gps
vim minecraft.mdwn 
gs
ssh live -t screen -x irc
ssh live -t screen -x irc
wk cookbooks 
vim cookbooks/cony/files/default/local_settings.py 
gs
gcamp "Alias tweaks"
fab -H www.bitprophet.org run_chef:cony
cd ..
ls
mg b
mg branch
ssh git.bitprophet.org
sh db.animevice.cm
sh db.animevice.com
ssh db.animevice.com
ssh db.animevice.com
cd Documents/Code/
ls
git glone git@git.bitprophet.org:bpo
git clone git@git.bitprophet.org:bpo
cd bpo
ls
cat Gemfile 
man env
wk fabric
gba
ls
gb
stty size
stty size
stty size
stty size
stty size
wk fabric
vim fabric/operations.py
wk fabric
gco 1.0.1
vim f.py
fab -f f.py -H localhost test
vim f.py
fab -f f.py -H localhost test
vim f.py
fab -f f.py -H localhost test
vim f.py
fab -f f.py -H localhost test
wk cookbooks 
vim cookbooks/cony/files/default/local_settings.py 
gs
gcamp "WowHead"
fab -H www.bitprophet.org run_chef:cony
vim .bash_aliases 
gs
gs
vim .bash_aliases 
. .bashrc
lsof | grep -i terminus
which rm
alias
ls
mkdir -p foo/bar
rm foo/bar -rf
gs
gcamp "GNU rm"
echo "jpeg, jasper, libicns, pkg-config, libgpg-error, libgcrypt, libtasn1, gnutls" | sed "s/,//g"
brew update
brew update
brew search cabe
brew info cabextract
man env
env -i zsh
wk fabric
vim fabric/operations.py
ls
wk fabric
gb
git remote
git remote rm goosemo 
gba
ls
tree docs
tree docs --help
tree docs -I _build
stty size
wk fabric
vim fabric/operations.py
wk fabric
vimf abrop
vim fabric/operations.py
ssh live -t screen -x irc
defaults --help
defaults -currentHost read -globalDomain AppleFontSmoothing
defaults -currentHost read -globalDomain AppleFontSmoothing -int
defaults -currentHost write -globalDomain AppleFontSmoothing -int 2
ls
ls
wk fabric 
vim fabric/
ls
stty size
ls
wk fabric 
vim fabric/operations.py
man tmux
tmux wat
tmux ssh
man tmux
tmux -c ssh live
man tmux
tmux attach "ssh live"
man tmux
tmux -l -c "/bin/bash"
tmux -l -c "ssh live"
ls
tmux -c "vim"
tmux list
tmux list-s
tmux delete
tmux help
tmux -h
man tmux
tmux destroy-unattached
man tmux
vim .tmux.conf 
ssh live -t screen -x irc
ssh live
ssh live -t screen -x irc
ssh live -t screen -x irc
ssh live -t screen -x irc
ssh live -t screen -x irc
ssh live -t screen -x irc
tmux list-sessions
tmux destroy-session -t 0
tmux kill -t 0
tmux kill-sess -t 0
tmux kill-sess -t 1
tmux list-sessions
stty size
gs
gd
find . -name "*bash*"
ls *bash*
ls *bash
ls bash*
ls .bash*
ls .bash* | ack Darwin
ls .bash* | xargs ack Darwin
alias foo=bar baz
ls
echo " foo " | sed
echo " foo " | sed "s/[[:white:]]//g"
echo " foo " | sed "s/[[:space:]]//g"
echo " foo " | /usr/bin/sed "s/[[:space:]]//g"
alias | grep sed
echo " foo " | /usr/bin/sed "s/f(.+)/b\1/g"
echo " foo " | sed "s/f(.+)/b\1/g"
gs
git add .bash_{linux,mac}
gs
git add .bash_aliases
gs
cat .gitignore 
vim .gitignore 
vim .gitconfig 
vim .gitexcludes 
gs
vim .gitexcludes 
gs
vim .gitexcludes 
vim .gitexcludes 
vim .gitignore 
gs
gd
gdc
vim .bash_aliases
gdc
git add .bash_aliases
gdc
gs
gcm "Clean up platform specific aliasing"
gs
gd
gcamp "Fix edge case in gitignore re: bashfiles"
which ps
which gps
brew search ps
man sed
man gsed
gsed
brew install gsed
brew search sed
brew install gnu-sed
gsed --help
ssh live
ps
env -i zsh
ssh live -t screen -x irc
ls /foo
stty size
