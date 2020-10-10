# My config

## Vim

-   put `.vimrc` and `.vim/` in `~`

-   install Prettier

    ```bash
    yarn add prettier --dev --exact
    # or globally
    yarn global add prettier
    ```

    or

    ```bash
    npm install --save-dev --save-exact prettier
    # or globally
    npm install --global prettier
    ```

## Tmux

-   install tmux

-   put `.tmux_conf` in `~`

## Zsh

-   install zsh and oh-my-zsh

-   put `.zshrc` in `~` and change the `TODO` in it

## ssh banner

-   modify `/etc/ssh/sshd_config` to designate issue.net

-   replace `/etc/issue.net` with `./issue.net`

## motd

-   clear `/etc/motd`

-   add `10-sys-info` to `/etc/update-motd.d/`

## change hostname

-   `hostnamectl set-hostname NAME`

## amend fcitx

```
sudo mkdir /usr/local/fcitx-amend && sudo cp fcitx-amend/fcitx_amend.sh /usr/local/fcitx-amend
sudo cp fcitx-amend/fcitx-amend.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable fcitx-amend.service
sudo systemctl start fcitx-amend.service
sudo systemctl status fcitx-amend.service
```
