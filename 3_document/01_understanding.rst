.. _understand:

#############################
 Right Understanding
#############################

Word Processing
=============================

Word processing and destop publishing are based on page layout software which 
integrates document design with management of hardware, storage, editing and 
display functions. These technologies were developed for publishers and graphic 
designers to replace traditional typography and printing systems. WYSIWYG 
Desktop Publishing systems fall short when challenged to produce sophisticated 
typography such as mathematical expressions, however. 

Markup Systems
=============================

The alternative to WYSIWYG is markup. Here, formatting instructions are 
embedded within source document content, and a program compiles output for 
printing or display. Markup replaces a formatting task with a programming task, 
and naturally markup systems were developed by and for programmers. 

The prototypical markup composition system is 
`TeX <http://en.wikipedia.org/wiki/TeX>`_, by Donald Knuth. TeX was written 
to address bad typography in the galleys of his book, "The Art of Computer 
programming." At a simpler level, many computer languages include a feature to 
compile source code literals, or `here documents 
<http://en.wikipedia.org/wiki/Here_document>`_,  into formatted documentation.

Web Servers, Web Browsers
=============================

Web servers deliver marked up content pages to browsers, and browsers interpret 
that markup to generate a display. HTML webpage markup is designed for 
programmers to use. You would think that HTML would be easy to use, and that it 
would have great markup features, with directives for indexes, pagination, 
footnotes, sidebars, math rendering, [#]_ and so forth. But you would be wrong.

Content Management Systems
=============================

Most content management systems include primitive WYSIWYG editing, and lack 
directives for real document management. These systems were designed for 
blogging, not for publishing. They are a small improvement over HTML pages, 
in that they recast page editing in a form familiar to the non-programmer.

Restructured Text (reST)
=============================

`reStructuredText <http://en.wikipedia.org/wiki/ReStructuredText>`_ is a 
lightweight markup language for publishing documentation, specifically as a 
Python programming language tool. It is designed to be processed easily by both 
machine and human. Other programming languages have similar tools: JavaDoc for 
Java, POD for Perl, RDoc for Ruby.

Sphinx Documents
=============================

"Sphinx is a tool that makes it easy to create intelligent and beautiful 
documentation ...." [#]_ This guide is evidence of the power of Sphinx, as it 
is entirely created in a text editor with reST and Sphinx markup. Sphinx tools 
include a compiler which will directly output HTML websites, ePub files, 
LaTeX documents, or LaTeX pdf files.

Understanding Summary
=============================

The simplest way to produce documents for web publication is through basic 
editing and a markup language. This guide demonstrates this point using the 
Sphinx toolkit.

------

.. rubric:: Footnotes

.. [#] Test your browser's ability to render math at this page: 
   http://www.w3.org/Math/XSL/csmall2.xml.

.. [#] From the Sphinx home page at http://sphinx.pocoo.org/index.html.