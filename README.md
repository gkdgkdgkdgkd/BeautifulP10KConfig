# 1 效果图

`GUI`主题：

![](https://img-blog.csdnimg.cn/20201025101325276.png?)

`tty`主题：

![](https://img-blog.csdnimg.cn/20201025101325221.png)

# 2 使用

- `p10k.zsh.gui`是在图形界面下使用的配置文件，256色+`Unicode`字符，非常的绚丽
- `p10k.zsh.tty`是在`tty`下使用的配置文件，8色+`ASCII`字符，效果肯定不能跟`GUI`比

将上面的其中一个配置文件重命名为`.p10k.zsh`并放置到用户目录下即可，即可得到图片上的效果。

如果和图片的效果有出入，可能与终端本身的颜色配置有关，请修改终端本身的颜色配置。

# 3 建议

由于文件是完整配置，建议按照博客或官网文档自定义一下，把多余的注释以及多余的提示段删除，另外为了方便提供了一张官方的颜色表图片，在`ColorTable`下，如果需要自定义颜色可以参考。

为了方便这里给出了笔者的优化后的配置文件，对于`GUI`/`tty`配置，删除了：

- `ASDF`：多版本运行时管理器，显示`Java`、`PHP`版本就是利用这个做的
- `nordvpn`
- `vi mode`
- `todo`
- `taskwarrior`
- `context`
- `virtualenv`
- `anaconda`
- `pyenv`
- `goenv`
- `nodeenv`
- `nvm`
- `node_version`
- `go_version`
- `rust_version`
- `dotnet_version`
- `laravel_version`
- `rb_env`
- `java_version`
- `rvm`
- `fvm`
- `luenv`
- `jenv`
- `plenv`
- `phpenv`
- `scalenv`
- `haskell_stack`
- `terraform`
- `kubecontext`
- `azure`
- `gcloud`
- `public_ip`
- `vpn_ip`
- `ip`
- `proxy`

另外简单地调节了一下颜色，效果如图：

![](https://img-blog.csdnimg.cn/20201025184301309.png)

![](https://img-blog.csdnimg.cn/20201025190837795.png]


# 4 请配合博客食用

[CSDN](https://blog.csdn.net/qq_27525611/article/details/109260917)
