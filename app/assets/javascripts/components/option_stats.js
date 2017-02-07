Vue.component('question-option-stats', {
  template: '#question-option-stats-template',
  props: ['value', 'percentage'],
  computed: {
    cssStyle: function(){
      return "width: " + this.percentage + "%";
    }
  },
  methods: {}
});
