.. _structure:

#############################
 Right Structure
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
| \:download\:\`script <path.sh>\` |:download:`script <_downloads/rest-install.sh>`|
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

| + Plus or minus signs start bulleted items.
| + Use this for item lists.

+ Plus or minus signs start bulleted items.
+ Use this for item lists.

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

\.\. note \:\: This paragraph is the text of a note.

\.\. warning \:\: This paragraph is (not) a warning.

\.\. sidebar \:\: The following paragraph will appear in a sidebar.

\.\. rubric \:\: This heading is not in the Table of Contents

\.\. centered \:\: THIS TEXT IS BOLD CENTERED

----------------

.. rubric:: Footnotes

.. [#] For Sphinx documentation, see <http://sphinx.pocoo.org/contents.html>.

.. [#] Characters for marking headings are arbitrarily set within a project 
   by usage. This is an example of simplifing a task by
   `Convention over Configuration 
   <http://en.wikipedia.org/wiki/Convention_over_configuration>`_. 