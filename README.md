# 1 效果图

- `GUI`下：

![](https://img-blog.csdnimg.cn/20201025101325276.png)

![](https://img-blog.csdnimg.cn/20201025184301309.png)

- `tty`下

![](https://img-blog.csdnimg.cn/20201025190837795.png)

![](https://img-blog.csdnimg.cn/20201025101325221.png)

# 2 使用

- 以`gui`为后缀的文件是在图形界面下使用的，256色+`Unicode`字符，非常的绚丽
- 以`tty`为后缀的文件是在`tty`下使用的，8色+`ASCII`字符，效果肯定不能跟`GUI`比
- `original`文件夹下面的两个文件是简单修改默认配置后的文件，含有完整注释以及大部分字段
- `customize`文件夹下是笔者个人高度定制的配置文件，删除了很多不必要的字段与大量的注释，不保证每个人都适用

使用时将上面的其中一个配置文件重命名为`.p10k.zsh`并放置到用户目录下即可，即可得到图片上的效果。

如果和图片的效果有出入，可能与终端本身的颜色配置有关，请修改终端本身的颜色配置。

# 3 建议

- 如果是想直接开箱即用，建议先选择笔者优化过之后的配置文件，如果不能满足需要在选择默认的简单修改后的配置文件
- 如果想再次定制，请使用默认的简单修改后的配置文件，其中文件中包含大量的注释，根据注释进行自定义修改即可

优化后的配置文件删除的字段如下：

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

另外为了方便提供了一张官方的颜色表图片，在`ColorTable`下，如果需要自定义颜色可以参考。

# 4 参考博客

[CSDN](https://blog.csdn.net/qq_27525611/article/details/109260917)
