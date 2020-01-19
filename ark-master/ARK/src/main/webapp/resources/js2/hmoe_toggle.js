
            $(function(){
                $('.lili').hover(
				
               function () {
                  $('.none',this).css({display:'block',});
               }, 
				
               function () {
                  $('.none',this).css({display:'none',
                                       marginTop:'0',
		                              paddingTop:'22px',
		                              paddingBottom:'5px',
                                      });
               }
            );
            });
            $(function(){
                $(".lili").hover(function(){
                    $(".top-menu-wrap_none").css({height:'120px'});
                })
            });
            $(function(){
                $(".lili").mouseleave(function(){
                    $(".top-menu-wrap_none").css({height:'63px'});
                })
            });