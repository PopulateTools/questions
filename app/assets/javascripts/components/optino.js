Vue.component('question-option', {
  template: '#question-option-template',
  props: ['id', 'value', 'question_id'],
  data: function(){
    return {
      picked: null
    }
  },
  computed: {
    html_id: function(){
      return "opt_" + this.id;
    },
    name: function(){
      return "question_" + this.question_id;
    }
  },
  methods: {
    handleChange: function(e){
      window.bus.$emit('optionSelected', this.id);
    }
  }
});
