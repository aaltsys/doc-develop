.. _rst-syntax:

#############################
 Re-Structured Text Syntax
#############################

.. note:: The following guide to reST and Sphinx markup is intended to be 
   helpful but not exhaustive. More comprehensive and less comprehendable 
   documentation is available from official Sphinx sources. [#]_

Headings
=============================

At the top of each reST document is a title surrounded with markers: [#]_ ::

   ##############################
   A Document Title Goes Here
   ##############################

Each document section or subsection is indicated with an underlined heading::

   This is a heading
   ==============================
 
   And so this is a sub-heading
   -------------------------------

Page break lines are inserted with a series of dashes

``----------------``

-------------

Paragraphs
=============================

Paragraphs are indicated by entering two newlines, which shows as a blank line 
in the text. Single newlines are ignored except in lists or other directives.

When using a text editor, lines are typically broken by newline characters and 
word wrapping is not performed. This corresponds to programming practice, 
where each statement of a program is marked by a newline. 

Inline Style Formatting
=============================

The following table displays inline or embedded markups for text styles:

+---------------------------+-------------------------------+
| Markup                    | Result                        |
+===========================+===============================+
| \*italicized text\*       | *italicized text*             |
+---------------------------+-------------------------------+
| \*\*bold text\*\*         | **bold text**                 |
+---------------------------+-------------------------------+
| \`emphasized text\`       | `emphasized text`             |
+---------------------------+-------------------------------+
| \`\`unformatted text\`\`  | ``unformatted text``          |
+---------------------------+-------------------------------+

Inline Markup Directives
=============================

.. note :: Inline Markup Directives are supported in Sphinx but not in basic reST. 
   Therefore these commands will generate errors in the interactive editor at
   `<http://rst.ninjs.org>`_.

+----------------------------------+-----------------------------------------------+
| Markup                           | Result                                        |
+==================================+===============================================+
| \:kbd\:\`text\`                  | :kbd:`text`                                   |
+----------------------------------+-----------------------------------------------+
| \:guilabel\:\`text\`             | :guilabel:`text`                              |
+----------------------------------+-----------------------------------------------+
|\:menuselection\:\`menu --> item\`| :menuselection:`menu --> item`                |
+----------------------------------+-----------------------------------------------+
| \:command\:\`git add .\`         | :command:`git add .`                          |
+----------------------------------+-----------------------------------------------+
| \:file\:\`../path/to/file\`      | :file:`../path/to/file`                       |
+----------------------------------+-----------------------------------------------+
| \:download\:\`script <path.sh>\` | :download:`script <_downloads/doc-deploy.sh>` |
+----------------------------------+-----------------------------------------------+
| \:ref\:\`Tables <tables_label>\` | :ref:`Tables <tables_label>`                  |
+----------------------------------+-----------------------------------------------+

.. _tables_label:

Tables
=============================

Build table layouts as shown below::
 
   +------------------------------------+--------------------------------+
   | Markup                             | Result                         |
   +====================================+================================+
   | \:kbd\:\`text\`                    | :kbd:`text`                    |
   +------------------------------------+--------------------------------+
   | \:guilabel\:\`text\`               | :guilabel:`text`               |
   +------------------------------------+--------------------------------+
   | \:menuselection\:\`menu --> item\` | :menuselection:`menu --> item` |
   +------------------------------------+--------------------------------+
   | \:command\:\`git add .\`           | :command:`git add .`           |
   +------------------------------------+--------------------------------+

List Entries
=============================

| | The Pipe symbol starts a separate text line.
| | Use this for simple lists.

| The Pipe symbol starts a separate text line.
| Use this for simple lists.

| +  Plus or minus signs start bulleted items.
| +  Use this for item lists.

+  Plus or minus signs start bulleted items.
+  Use this for item lists.

| #. Hash-dot starts a numbered line.
| #. Use this for numbered lists.

#. Hash-dot starts a numbered line.
#. Use this for numbered lists.

When a paragraph ends with a double colon (::)::

   Following indented lines are blocked.
   Use this for code examples.

Indent lists with spaces or tabs to indent the displayed text:

 Indent lists with spaces or tabs to indent the displayed text::

     Additionally indented lines are blocked.
     Use this for code examples.

.. hint:: When the double-colon is preceded with a space, no colon shows in the 
   output. 

Link Directives
=============================

\.\. _label_reference\:

\.\. image \:\: \`_images/04_self-publish_new.png\`

\[\#\]\_ (footnote number insertion)

\`Online reST Editor <http://rst.ninjs.org/>\`\_

.. Tip:: The underscore preceding "label_reference" is part of the directive, 
   not part of the label. The same is true for the underscore following 
   footnote brackets, and the underscore following a URL link.

Paragraph Directives
=============================

The following directives should be followed by an indented paragraph of text. 
The text will appear in a message window, a sidebar, or otherwise set off 
from the main document text.

\:\: The following paragraph will display as unformatted code.

\.\. \[\#\] This paragraph is a footnote paired with a text reference. \[\#\]\_

\.\. tip \:\: This paragraph is the text of a short tip.

\.\. hint \:\: This paragraph is a hint.

\.\. note \:\: This paragraph is the text of a note.

\.\. warning \:\: This paragraph is (not) a warning.

\.\. sidebar \:\: The following (titled) paragraph will appear in a sidebar.

\.\. rubric \:\: This heading is not in the Table of Contents.

\.\. centered \:\: THIS TEXT IS CENTERED.

----------------

.. rubric:: Footnotes

.. [#] `Sphinx documentation <http://sphinx-doc.org/contents.html>`_.

.. [#] Characters for marking headings are arbitrarily set within a project 
   by usage. This is an example of simplifing a task by
   `Convention over Configuration 
   <http://en.wikipedia.org/wiki/Convention_over_configuration>`_. 

.. _pubstructure:

#############################
RST Publication Structuring
#############################

RST features extend beyond document markup to provide for structuring multiple
document pages into sections, chapters, and entire publications or books. 
AAltsys scripts (:file:`doc-newproject.sh`, :file:`doc-deploy.sh`, and 
:file:`doc-addproject.sh`) manage git repositories of RST documents with 
multiple section folders, where indexing and referencing between sections is
expected. Follow this guide to setup a document project in multiple sections.

Identify Document Sections
=============================

To create a document with chapters or sections, begin by creating a folder in 
:file:`~Projects` to hold the entire project. Within this folder, edit text file 
:file:`sections`, entering one-word section names on consecutive lines. If your 
project will contain referenced material such as appendices, then make a 
**resource** section at the top of the list. The final line should be section 
**master**, which will contain the project master index. So the :file:`sections` 
text will look like::

   resources
   chapter01
   chapter02
   chapter03
   master
   
Create New Project
=============================

From within the project folder, run the script command::

   ../doc-newproject.sh

This script will initialize a Sphinxdoc folder for each listed chapter section. 
Sphinx will prompt you to use InterSphinx for each folder, and always answer 
:kbd:`yes`. The :file:`doc-newproject.sh` script will link all the projects 
together in the master section. However, the link statements will be missing in 
other sections. Later, you may need to reorganize the section compilation order,
that is, reorder the section list, and add InterSphinx Mapping commands to the 
:file:`conf.py` program in the section folders.

InterSphinx Mapping
=============================

For the project section list previously mentioned, the **master** folder would 
contain a :file:`conf.py` program ending in the following statement:

::

   intersphinx_mapping = {
      'resources': ('resources', '../_deploy/resources/objects.inv'),
      'chapter01': ('chapter01', '../_deploy/chapter01/objects.inv'),
      'chapter02': ('chapter02', '../_deploy/chapter02/objects.inv'),
      'chapter03': ('chapter03', '../_deploy/chapter03/objects.inv'),
   }

Creating references between sections requires entering similar statements in 
:file:`conf.py` programs for other chapters, with subtle differences. Suppose 
**chapter02** needs to reference labels in **resources** and **chapter01**. Then 
the mapping statement at the end of its :file:`conf.py` should read:

::

   intersphinx_mapping = {
      'resources': ('../resources', '../_deploy/resources/objects.inv'),
      'chapter01': ('../chapter01', '../_deploy/chapter01/objects.inv'),
   }

Notice that for the chapters, the internal mapping names begin with a 
folder dereference (:file:`../`). This is not necessary for the **master** 
section because the compilation script moves this one index folder out one level 
when building the project deployment files.

.. note::
   Documentation for **chapter02** is compiled preceding **chapter03**. 
   Therefore **Chapter02** will not be able to reference **chapter03**, and 
   adding **chapter03** to the mapping in **chapter02** will trigger a 
   compilation error message.

Labels and Reference Links
=============================

Sphinxdoc markup provides for linking references to labels within a document. 
Where labels precede a heading, the reference will be replaced with the section 
heading text by default. Labels are entered as directives on blank lines, as 
shown following. Note that label directives start with :kbd:`.. _` and end with 
:kbd:`:`, as in:

::

   .. _mylabel:

Use the ``:ref:`` inline markup directive to reference a label within a 
document. For example, the directive ``:ref:`pubstructure``` would take you to
:ref:`pubstructure` at the start of this article.

By extension, a label in another chapter section of a project is referenced by 
adding the section name into the directive, as for example::

   :ref:`resources:mylabel`

Section Index Documents
=============================

Each chapter section of a document will contain an :file:`index.rst` file. 
The directives in each index file except **master** should be organized as 
follows::

   .. _index:
   
   Chapter or Section Title
   =============================
   
   .. toctree::
      :maxdepth: 2
      :glob:
      
      [0-9]*

There may be other text, comments, or directives in the index page as well, of 
course. 

.. note::
   In this example, a ``:glob:`` directive is used to automatically accumulate 
   documentation files into an index. ``:glob:`` requires a further parameter 
   indicating the files to be collected, the ``[0-9]*`` above. This will collect 
   all documents starting with a number, in sorted sequence.

Master Index Document
=============================

The :file:`index.rst` file in the **master** section requires a hand-compiled 
table of contents for the project chapters:

:: 

   .. _index:
   
   Master Document Title
   =============================
   
   #. :ref:`chapter01:index`.
   #. :ref:`chapter02:index`.
   #. :ref:`chapter03:index`.
   #. :ref:`resources:index`.

Again, other text and formatting directives may be included to fill out this 
page.

Master Index Back References
=============================

Since sections are compiled before the master document, there is no way for a 
chapter or section to contain an internal reference to the corresponding master 
index. The :program:`doc-deploy.sh` script can fix this by editing deployed 
:file:`index.html` pages, replacing the "here links" at the top and bottom of 
section index pages with external references to the corresponding project master 
index page. 

Implement this feature by adding a document named :file:`backreference` in the 
:file:`_static` folder with the desired html link, such as::

   <a class="external reference" href="../index.html">AAltsys Development Main Index</a> 

Similar to section index backlinks, :program:`doc-deploy.sh` will add navigation 
links to source URLs. This is helpful when multiple projects are published as 
subdomains of an apex domain containing a documentation index page.

Add these links with a :file:`master/_static/backreference` document in any 
multi-section project, or with a :file:`_static/backreference` document in other 
projects. The html link format should look like::

   <a href="http://aaltsys.info">AAltsys Information Master Index</a> 

Obviously you should use your own text to replace the "aaltsys.info" domain name 
and the corresponding titles.

.. tip::
   :file:`doc-deploy.sh` inserts back reference links in folder :file:`_deploy`. 
   The compiler output in :file:`_build` within chapters is unchanged.