---
layout: post
title: "Tools of the Trade"
date: 2014-09-18 18:25:24 -0400
comments: true
<!-- published: false -->
categories:
- sublime
- emmet
- devtools
---

So day four just wrapped up at [@HackerYou](https://twitter.com/hackeryou) and because I was fortunate enough to have taken the part-time course previously most of the lessons have been review. So I spent most of the time fiddling around with tooling. Today I focused my efforts on adding some customizations to Sublime and devtools and fixing a few annoyances that have come up in class.

###Devtools

I recently ran across a tweet from [@pixelpurity](https://twitter.com/pixelpurity/status/502225973295992832) showing off a matching inspector and sublime text. But when I set out to recreate it I ran into a few issues. My researching took me to [Darcy Clarke's blog](http://darcyclarke.me/) where he outlined how to do it. Unfortunately the feature has since been removed. You can now only load custom css for the Chrome inspector via a chrome extension. Now I couldn't find (still can't actually) the base16-eighties-dark theme as a chrome extension but I did find a tool that could help build one.
<!-- more -->
It's a wonderful little less project compiled with grunt that builds the extension folder for you. It's called [Zero-Base-Themes by Maurice Cruz](https://github.com/mauricecruz/zero-base-themes). Now this tool is awesome because it organizes all of the color variables into seperate theme files, and then you specify which theme file you want to use in the config.less and run grunt and a ready to go extension folder is created. You can then go into chrome://extensions, click the developer checkbox and load that directory using "Load unpacked extension..." The only problem is I don't really know which variable in the theme files correspond to what in the inspector, but I'm sure countless hours of fiddling will reveal the knowledge.

###Sublime

I've stumbled across a number of things I didn't know about sublime this week.

First off is the ability to filter your tab completions. You add filters by using the pipe `|` character after your emmet shorthand and then passing it a flag that corresponds to a filter. A list of filters and explanation of there use can be found [here](http://docs.emmet.io/filters/)
Now let's say you were to type `.outerWrapper>.innerWrapper>header>nav` and then added `|c` after it and hit tab. You would be applying the "comment tags" filter that's incredibly useful in helping to avoid div soup.
This:
```
.outerWrapper>.innerWrapper>header>nav|c
```

becomes this:
``` HTML
<div class="outerWrapper">
  	<div class="innerWrapper">
  		<header>
  			<nav></nav>
  		</header>
  	</div>
  	<!-- /.innerWrapper -->
  </div>
  <!-- /.outerWrapper -->
```
You can enable this functionality by default so you don't have to to type `|c` all the time by going into `Preferences -> Package Settings -> Emmet -> Settings - User` and adding
``` json
{
	"syntaxProfiles": {
		"html" : {
			"filters" : "html, c"
		}
	}
}
```
Now [Brenna](https://twitter.com/brnnbrn) (our teacher) mentioned that she preferred closing comments on the same line as the closing tag. Realizing that I agreed with her I set out to find a way to make that happen, and after a while of searching google I found this [post](http://iaintnoextra.tumblr.com/post/68089741466/automatically-add-closing-comments-to-html-using-emmet) by Christopher G. Herbert showing how to do it. All you have to do is add another little bit of JSON to your emmet settings - user file:

``` json
{
	"preferences": {
		"filter.commentAfter": "<!-- /<%= attr(\"id\", \"#\") %><%= attr(\"class\", \".\") %> -->"
	},
	"syntaxProfiles": {
		"html" : {
			"filters" : "html, c"
		}
	}
}
```

[Now lastly I stumbled across another really neat emmet trick: control + shift + enter](http://www.sitepoint.com/faster-workflow-mastering-emmet-part-4/)

If you select a list of items on their own lines like:
``` plain
Home
About
Portfolio
Contact
```
And then hit Control + Alt + Enter you'll get a little dialog box like you would with Control + W. You can then enter a chain of emmet abbreviations and whichever element you append an `*` to will be generated around each line. (Click the link above for a beautiful animated gif of it in action).

Now to make things even crazier you can refer to the contents of each line by using `$#` which makes it possible to do some really crazy stuff if you know what you're doing.

``` plain
nav>ul>li[title=$#]*>a[href=$#.html]{$#}>img[src=$#.png alt="$#"].nav-bg
```
becoming
``` html
<nav>
	<ul>
		<li title="Home">
			<a href="Home.html">Home
			<img src="Home.png" alt="Home" class="nav-bg">
			</a>
		</li>
		<li title="About">
			<a href="About.html">About
			<img src="About.png" alt="About" class="nav-bg">
			</a>
		</li>
		<li title="Portfolio">
			<a href="Portfolio.html">Portfolio
			<img src="Portfolio.png" alt="Portfolio" class="nav-bg">
			</a>
		</li>
		<li title="Contact">
			<a href="Contact.html">Contact
			<img src="Contact.png" alt="Contact" class="nav-bg">
			</a>
		</li>
	</ul>
</nav>
```
is really just kind of nuts, isn't it?

I think I probably spend way too much time fiddling with tools, but it's just so much fun!










