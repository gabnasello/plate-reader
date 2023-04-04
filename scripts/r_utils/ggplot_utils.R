#' ggplot minimal aesthetics
#'
#' This function renders high quality ggplots with minimal aesthetics.
#' 
#' List of theme parameters from https://github.com/tidyverse/ggplot2/blob/HEAD/R/theme.r
#'
#' @param ggplt ggplot object on minimal aesthetics is performed
#' @param width Set plot width
#' @param height Set plot height
#' @param expand Move the plot origin (default c(0,0)). The ggplot default value is restored with expand=waiver()
#' @param plot.title plot title (text appearance) ([element_text()]; inherits
#'   from `title`) left-aligned by default
#' @param strip.text facet labels ([element_text()];
#'   inherits from  `text`). Horizontal facet labels (`strip.text.x`) & vertical
#'   facet labels (`strip.text.y`) inherit from `strip.text` or can be specified
#'   separately
#' @param legend.position the position of legends ("none", "left", "right",
#'   "bottom", "top", or two-element numeric vector)
#' @param scale_color change line colors using the ggplot functions
#' @export

ggplotMinAethetics <- function(ggplt, 
                               width=NULL, height=NULL,
                               title=NULL,
                               expand = c(0,0),
                               plot.title=element_text(size = 16), strip.text=element_text(size = 11),
                               xlabel=NULL, ylabel=NULL,
                               legend.position='right',
                               scale_color=NULL
                               ){
    
    if (!is.null(width)){
        options(repr.plot.width=width)
    }
    
    if (!is.null(height)){
        options(repr.plot.height=height)
    }
    
    plt <- ggplt + theme_minimal()
    
    if (!is.null(title)){
        plt <- plt + labs(title = title)
    }
    
    if (!is.null(xlabel)){
        plt <- plt + labs(x = xlabel)
    }
    
    if (!is.null(ylabel)){
        plt <- plt + labs(y = ylabel)
    }
    
    # “the condition has length > 1 and only the first element will be used”
    plt <- plt + scale_y_continuous(expand=expand)
    
    plt <- plt + theme(panel.grid.major = element_blank(), 
                       panel.grid.minor = element_blank())
    
    plt <- plt + theme(plot.title=plot.title, strip.text = strip.text)
    
    plt <- plt + theme(axis.text=element_text(size=14),
                       axis.title=element_text(size=16),
                       axis.text.x = element_text(vjust = 0.3),
                       axis.line.x = element_line(color="black", linewidth = 0.5),
                       axis.line.y = element_line(color="black", linewidth = 0.5))
    
    plt <- plt + theme(legend.position = legend.position,
                       legend.title = element_text(size=16), #change legend title font size
                       legend.text = element_text(size=16), #change legend text font size
                       legend.title.align = 0.5) # Title alignment. Number from 0 (left) to 1 (right) 
   
    if (!is.null(scale_color)){
        
        switch(scale_color, 
                npg={
                  # case 'npg' here...
                  # you need ggsci library
                   library(ggsci) 
                   plt <- plt + scale_color_npg()
                },
                {
                   plt <- plt + scale_color
                }
              )
    }
       
    plt
}