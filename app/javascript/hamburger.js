function post (){
  const opendtn = document.getElementById("opendtn");
  opendtn.addEventListener("click", () => {
    $(this).toggleClass('active');//ボタン自身に activeクラスを付与し
    $("#g-nav").toggleClass('panelactive');//ナビゲーションにpanelactiveクラスを付与
    });
};
window.addEventListener('load', post);