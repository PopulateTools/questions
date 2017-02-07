$(document).on('ready page:change', function() {
  window.bus = new Vue({});

  window.app = new Vue({
    el: '#app',
    data: window.storage,
    mounted: function(){
      window.bus.$on('deckFinished', this.handleDeckFinished);
    },
    methods: {
      handleDeckFinished: function(){
        window.location.href = '/' + this.deck + '/end';
      }
    }
  });
});
