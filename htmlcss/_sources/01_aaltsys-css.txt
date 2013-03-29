

#############################
AAltsys CSS Rules
#############################

AAltsys documentation projects add a few CSS rules to the default Sphinxdoc CSS 
to accomodate better browser display and proper alignment of text in tables. 
This page documents these CSS rule changes with corresponding notes. 

#. Eliminate the 80-pixel side borders on the Sphinx pages, using a 5px border
   around the entire page including at the top::

      body {
          margin: 5px 5px 5px 5px;
      }

#. Change tables from collapsed borders to separate, with .25em spacing::

      table, table.docutils {
        margin: 0.5em -0.5em 0.5em -0.5em;
        border-collapse: separate;
        border-spacing: 0.25em;
      }

#. Change table head and detail to display margins even with paragraphs in 
   bulleted lists:: 
     
      table th, table td, table.docutils th, table.docutils td {
        padding: 0 0.25em 0 0.25em;
      }

#. Fix margins for headings and detail in tables in numbered lists::
   
      th p, td p, th p.first.last, td p.first.last {
        margin: 0 0 0 0; 
      }

#. Change tables in admonitions and warnings to display margins even with 
   paragraphs::
   
      .admonition table, .warning table, {
        margin: 0 0.5em 0.5em 0.5em;
      }

Tests of Table Formatting
=============================

Body paragraphs
-----------------------------

This body paragraph is at the left margin and has no indent. The following table 
text should align with this paragraph body text.

+----------------+----------------------------------------------+
| Table heading  | Description                                  |
+================+==============================================+
| Table detail   | This table is in an unindented body section  |
+----------------+----------------------------------------------+
    
   This paragraph has an indent level from the main body margin. The following 
   table text should align with this paragraph text.
    
   +----------------+----------------------------------------------+
   | Table heading  | Description                                  |
   +================+==============================================+
   | Table detail   | This table is in an indented body section    |
   +----------------+----------------------------------------------+
 
Bulleted lists
-----------------------------

+  This bulleted list is within the main body of a document. The table text 
   which follows should align with the text in this bulleted paragraph.
   
   +----------------+----------------------------------------------+
   | Table heading  | Description                                  |
   +================+==============================================+
   | Table detail   | This table is in a bulleted body section     |
   +----------------+----------------------------------------------+

Numbered lists
-----------------------------

#. This is a numbered list in the main body of a document.
   
   This paragraph is in a numbered list. The table text which follows should
   align with this numbered paragraph.
   
   +----------------+----------------------------------------------+
   | Table heading  | Description                                  |
   +================+==============================================+
   | Table detail   | This table is in a numbered body section     |
   +----------------+----------------------------------------------+
 
   +  This bulleted list is a paragraph within a numbered list. The following 
      table text should align with text in this bulleted paragraph.
         
      +----------------+----------------------------------------------+
      | Table heading  | Description                                  |
      +================+==============================================+
      | Table detail   | This table section is numbered and bulleted  |
      +----------------+----------------------------------------------+ 

Admonitions and Warnings
-----------------------------
      
.. warning:: This warning is within the main body text of the page. The border 
   of the warning should align with main body text, and the following table text 
   should align with this paragraph.
   
   +----------------+----------------------------------------------+
   | Table heading  | Description                                  |
   +================+==============================================+
   | Table detail   | A warning encloses this table body section   |
   +----------------+----------------------------------------------+
   
#. Numbered paragraph section.
      
   .. note:: This note text is embedded within a numbered paragraph. The note 
      encloses table text which should align with the note paragraph.
        
      +----------------+----------------------------------------------+
      | Table heading  | Description                                  |
      +================+==============================================+
      | Table detail   | An admonition encloses this table section    |
      +----------------+----------------------------------------------+ 
      
   