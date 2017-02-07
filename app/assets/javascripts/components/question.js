Vue.component('question', {
  template: '#question-template',
  props: ['deck'],
  data: function(){
    return {
      id: '',
      title: '',
      description: '',
      options: [],
      replied: false
    }
  },
  created: function(){
    this.fetchData();
    window.bus.$on('optionSelected', this.handleOptionSelected);
  },
  methods: {
    handleOptionSelected: function(option_id){
      var self = this;
      Vue.set(self, 'replied', true);
      $.ajax({
        type: "POST",
        data: {
          option_id: option_id
        },
        url: "/api/"+this.deck+"/questions/"+this.id+"/answers",
        beforeSend: function(xhr){
          xhr.setRequestHeader("Authorization", "Bearer " + window.app.sessionId);
          xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
        },
        success: function(response){
          Vue.set(self, 'options', response);
        }
      });
    },
    fetchData: function(){
      var self = this;
      Vue.set(self, 'options', []);
      Vue.set(self, 'replied', false);
      $.ajax({
        url: "/api/"+this.deck+"/question",
        beforeSend: function(xhr){
          xhr.setRequestHeader("Authorization", "Bearer " + window.app.sessionId);
          xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
        },
        success: function(response, textStatus, jqXHR){
          if(jqXHR.status == 204){
            window.bus.$emit('deckFinished');
          } else {
            self.id = response.id;
            self.title = response.title;
            self.body = response.body;
            self.options = response.options;
          }
        },
      });
    }
  }
});
