Discussion from Boot Camp

### Day 2

### some favorite shell commands
*   ``cat <filename> | wc -l``
    +   counts lines in a file
*   `find <directory_to_search_from> -name <regex> -exec <command> {} \;`
    + start with `find -name <regex>` to first safely find all your files before executing anything (modifying them, deleting them, etc)
    + example: `find . -name "*.pdf" -exec rm {} \;` removes all pdf files in your current working directory and nested directories
*  probably  __never__ type `rm -r *`
    +   deletes everything in your current directory and in all nested directories
*   `more`/`less`
    +   preview files from the command line (go through with the space bar)
*   `head`/`tail -<number of lines>`
    +   see the first/last however many lines of a file
    + `head -1 | wc -w` gives the number of columns in a file (assuming the columns aren't multi-word, aka don't have white space)
*   `sort -k<column number>`
    +   sort by a given column in a file
    
### big reasons to use Git/GitHub
*   descriptive log of project development
*   version control with or without groups
*   sharing reproducible workflows
*   branching for major changes

### other resources
*   dabble in course "Git Essential Training" on [Lynda](https://www.lynda.com/) (you have a subscription to Lynda with your PSU ID)

### Day 3

*   [Galaxy 101](https://galaxyproject.org/tutorials/g101/)
*   Make a proposal for computing allocation with [Xsede](https://www.xsede.org/)

### other resources
*   make Markdown easy with a [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#links)
*   Get started with easy rendering of markdown locally, e.g. in [Chrome](https://stackoverflow.com/questions/9843609/view-markdown-files-offline) or [Sublime Text](http://plaintext-productivity.net/2-04-how-to-set-up-sublime-text-for-markdown-editing.html) (there are other ways)
*   [Jupyter and Galaxy: Easing entry barriers into complex data analyses for biomedical researchers](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005425)
*   Do you like JavaScript? Make attractice online notebooks with [ObservableHQ](https://observablehq.com/)

### Day 4
*   [A guide to reproducibile code in ecology and evolution](https://www.britishecologicalsociety.org/wp-content/uploads/2017/12/guide-to-reproducible-code.pdf)






