Vue.component('question-option-stats', {
  template: '#question-option-stats-template',
  props: ['value', 'percentage'],
  computed: {
    cssStyle: function(){
      return "width: " + this.animatedPercentage + "%";
    }
  },
  data: function(){
    return {
      animatedPercentage: 0
    }
  },
  watch: {
    percentage: function(newValue, oldValue){
      var vm = this;
      var animationFrame;
      function animate (time) {
        TWEEN.update(time);
        animationFrame = requestAnimationFrame(animate);
      }
      new TWEEN.Tween({ tweeningNumber: oldValue })
        .easing(TWEEN.Easing.Quadratic.Out)
        .to({ tweeningNumber: newValue }, 300)
        .onUpdate(function () {
          vm.animatedPercentage = this.tweeningNumber.toFixed(0);
        })
        .onComplete(function () {
          cancelAnimationFrame(animationFrame)
        })
        .start()
      animationFrame = requestAnimationFrame(animate)
    }
  }
});
