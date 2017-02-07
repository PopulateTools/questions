$(document).on('ready page:change', function() {
  window.bus = new Vue({});

  window.app = new Vue({
    el: '#app',
    data: {
      sessionId: ''
    },
    mounted: function(){
      Vue.set(this, 'sessionId', window.sessionId);
    }
  });
});
