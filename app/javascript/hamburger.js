window.addEventListener('click', function(){
  const pullDownButton = document.getElementById("openbtn")
	$(this).toggleClass('active');//ボタン自身に activeクラスを付与し
  $("#g-nav").toggleClass('panelactive');//ナビゲーションにpanelactiveクラスを付与
});
