# BlogDemos

### 1.CollectionView In UITableViewCell  

> 配套文章:[https://heisenbean.me/2017/03/Storyboard-use-Autolayout](https://heisenbean.me/2017/03/Storyboard-use-Autolayout)

通过storyboard和autolayout搭建CollectionView在UITableViewCell中的布局,**重点是把UICollectionView的数据源和代理交给控制器来处理而不是UITableViewCell.**  

> 参考:1.[https://github.com/ashfurrow/AFTabledCollectionView](https://github.com/ashfurrow/AFTabledCollectionView)

### 2.UITextView In UITableViewCell
通过storyboard和autolayout搭建UITextView在UITableViewCell中,支持UITextView自动升高,**重点是把UITextView高的约束设置为≥某个值, UITableView提前设置预估行高(estimatedRowHeight)以及自动行高(UITableViewAutomaticDimension),还有UITextView高度的计算.**

> 参考:  
> 1.[http://vit0.com/blog/2014/12/25/ios-textview-in-cell/#disqus_thread](http://vit0.com/blog/2014/12/25/ios-textview-in-cell/#disqus_thread)  
> 2.[http://stackoverflow.com/questions/28917923/uitableview-jumping-to-top-on-endupdates-while-typing-inside-a-cell-on-ios-8-aut](http://stackoverflow.com/questions/28917923/uitableview-jumping-to-top-on-endupdates-while-typing-inside-a-cell-on-ios-8-aut)

### 3.VideoDemo  

> 配套文章:[https://heisenbean.me/2017/06/GetPic-Title-From-Link](https://heisenbean.me/2017/06/GetPic-Title-From-Link)

通过视频地址,解析出来视频的缩略图和标题,目前支持优酷,土豆,腾讯视频,爱奇艺,哔哩哔哩.

