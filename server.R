function(input, output, session) {
        output$text <- renderText({

                word.input <- input$inputtext
                
                word.input <- str_to_lower(word.input)
                word.input <- gsub('[[:punct:]]','',word.input)
                
                word.count <- length(strsplit(word.input, split = " ")[[1]])
                
                predicted.word <- if (word.count == 3) {
                        quad3 <- read.quadgrams %>%
                                filter(ngram == word.input) %>%
                                group_by(ngram) %>%
                                sample_n(1) %>%
                                ungroup() %>%
                                select(output)
                        if (nrow(quad3) > 0) {
                                print(as.character(quad3))
                                
                        } else {quad2 <- read.trigrams %>%
                                filter(ngram == word(word.input, 2, -1)) %>%
                                group_by(ngram) %>%
                                sample_n(1) %>%
                                ungroup() %>%
                                select(output)
                        if (nrow(quad2) > 0) {
                                print(as.character(quad2))
                                
                        } else {quad1 <- read.bigrams %>%
                                filter(ngram == word(word.input, 3, -1)) %>%
                                group_by(ngram) %>%
                                sample_n(1) %>%
                                ungroup() %>%
                                select(output)
                        if (nrow(quad1) > 0) {
                                print(as.character(quad1))
                                
                        } else {print("the")}
                        }}
                        
                } else if (word.count == 2) {
                        tri2 <- read.trigrams %>%
                                filter(ngram == word.input) %>%
                                group_by(ngram) %>%
                                sample_n(1) %>%
                                ungroup() %>%
                                select(output)
                        if (nrow(tri2) > 0) {
                                print(as.character(tri2))
                                
                        } else {tri1 <- read.bigrams %>%
                                filter(ngram == word(word.input, 2, -1)) %>%
                                group_by(ngram) %>%
                                sample_n(1) %>%
                                ungroup() %>%
                                select(output)
                        if (nrow(tri1) > 0) {
                                print(as.character(tri1))
                                
                        } else {print("the")}
                        }
                        
                } else if (word.count == 1) {
                        bi1 <- read.bigrams %>%
                                filter(ngram == word.input) %>%
                                group_by(ngram) %>%
                                sample_n(1) %>%
                                ungroup() %>%
                                select(output)
                        if (nrow(bi1) > 0) {
                                print(as.character(bi1))
                                
                        } else {print("the")}
                }
                
                paste0(predicted.word)
        })
}       

        
        
        
        

        
        