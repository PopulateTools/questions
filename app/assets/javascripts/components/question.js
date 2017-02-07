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
      $.ajax({
        type: "POST",
        data: {
          option_id: option_id
        },
        url: "/api/"+this.deck+"/questions/"+this.id+"/answers",
        beforeSend: function(xhr){
          xhr.setRequestHeader("Authorization", "Bearer " + window.app.sessionId);
        },
        success: function(response){
          self.fetchData();
        }
      });
    },
    fetchData: function(){
      var self = this;
      $.ajax({
        url: "/api/"+this.deck+"/question",
        beforeSend: function(xhr){
          xhr.setRequestHeader("Authorization", "Bearer " + window.app.sessionId);
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
