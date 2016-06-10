'use strict';

$(function(){

  if($(window).width() > 740) {
    function rebindAll() {
      $('.tipsit').tipsy({fade: true, gravity: 's'});
      $('.tipsit-n').tipsy({fade: true, gravity: 'n'});
      $('.tipsit-w').tipsy({fade: true, gravity: 'w'});
      $('.tipsit-e').tipsy({fade: true, gravity: 'e'});
    }
  }

  // init
  $('.dynatable').dynatable({
    inputs: {
      paginationPrev: 'Anterior',
      paginationNext: 'Siguiente',
      paginationGap: [1,2,2,1],
      perPageText: 'Mostrar: ',
      recordCountText: 'Mostrando ',
      processingText: 'Procesando...', 
      searchText: 'Buscar:'
    },
    dataset: {
      perPageDefault: 25,
      perPageOptions: [25,50,100, 300]
    }
  });
  
  // $(".sticky").sticky({topSpacing:0});
  
  // $('.datepicker').pickadate({
  //   selectYears: true,
  //   selectMonths: true
  // });
  // $('.timepicker').pickatime();

  

  /**** WYSIWYG ********/
  // var editorSelector = '.editor';
  // if($(editorSelector).length > 0){
  //   window.editor = new Quill('.editor', {
  //     theme: 'snow',
  //     modules: {
  //       'toolbar': { container: '#full-toolbar' },
  //       'link-tooltip': true
  //     },
  //   });
  // }

  // $('.js-text-receiver').hide();
  // $('form').on('submit', function(e){
  //   if(window.editor !== undefined){
  //     $('.js-text-receiver').val(window.editor.getHTML());
  //   }
  // });
  /**** WYSIWYG ********/

});
