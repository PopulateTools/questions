Vue.component('question', {
  template: '#question-template',
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
        url: "/api/corruption/questions/"+this.id+"/answers",
        beforeSend: function(xhr){
          xhr.setRequestHeader("Authorization", "Bearer " + window.sessionId);
        },
        success: function(response){
          self.fetchData();
        }
      });
    },
    fetchData: function(){
      var self = this;
      $.ajax({
        url: "/api/corruption/question",
        beforeSend: function(xhr){
          xhr.setRequestHeader("Authorization", "Bearer " + window.sessionId);
        },
        success: function(response){
          self.id = response.id;
          self.title = response.title;
          self.body = response.body;
          self.options = response.options;
        }
      });
    }
  }
});
