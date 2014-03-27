#在UITextView中加UITextField作为Header

不做任何处理，`UITextField`成为`firstResponder`后会移动到中间。

之前

![](./defualt.png)

点击以后

![](./become_first_responder.png)

用reveal查看DayOne后发现它在`TextField`下面加了一层`UIScrollView`, 问题解决。

![](./dayone_textview.png)