#knit a pdf document
bookdown::render_book('index.Rmd', 'bookdown::pdf_document2')


#knit a pdf document
bookdown::render_book('index.Rmd', 'bookdown::pdf_book')

#knit a html document
bookdown::render_book('index.Rmd', 'bookdown::html_document2')

source()