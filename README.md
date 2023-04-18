# nvim.nvim: A *no bullshit* NeoVim configuration.
**Just to be clear from the beginning this is a *personal* configuration!  
You can create issues and PRs, however unless they fix issues the  
probability of their getting merged is close to none!**  

Now then, the whys, the hows and the further details.  

# Why?
My old configuration wasn't quite what I imagined it to be.  
Not few a time did it run into issues, when launching or using the config.

Furthermore, I had made the *stupid* decision to install LSPs on my system.  
I quickly run into many issues and slight annoyances. The sum of all those  
lead to my quickly leaving that config behind and taking coverage under the  
[LunarVim](https://www.lunarvim.org/) flag.

Another common issue was the fact that [packer.nvim](https://github.com/wbthomason/packer.nvim) the plugin manager  
I used(and stil use now) was installed manually.  

This meant others using this config would also need to install LSPs and that  
manually. This new config aims to do this differently.  

Finally, error handling is a lot better in this new config. Commonly  
in the old config, when a `require` call would fail, the whole config would  
crap itself. This meant people(or I) would have to go and manually fix the issue,  
while also not being able to use utilities on the config. That is now also covered.  

# How?
Firstly, the packer issue:
- Copy some code from the official [packer repo](https://github.com/wbthomason/packer.nvim).
- Congrats! Now you have you own packer copy locally. Just restart Neovim and you are done.

Secondly, LSPs:
- LSPs now just need to be added to a list, along with any other specific configuration.
- Keybinds are now properly added to every buffer on LSP attach.
- Mason: Oh my, mason is a savior. Thanks to it everything can be installed through the config  
  without any need for external intervention.

Finally, error handling:
- When an error is thrown from the config, a notification will be shown.
- If an error is thrown from the config, the rest of the config *will continue* being loaded.
- If an error is thrown from the plugins, it will be caught and shown as a notification.
- In that case you can assume that *the plugin that threw, will **not** function properly*.

That makes is *almost(TM)* impossible to break.
**Update**: after 10 months of this config's creation, it still hasn't broken even once on me.

TLDR: Everything is covered for you automatically and safely!

# Installation
Logically speaking you should just be able to clone this repo in your `$XDG_CONFIG_HOME/nvim/`  
folder or in any folder you want.

To clone just run:
```sh
$ git clone https://github.com/0xJoeMama/nvim.nvim.git $XDG_CONFIG_HOME/nvim/
```

Now just launch nvim, wait a bit, and then restart nvim.  
You are done!
