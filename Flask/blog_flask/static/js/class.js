

window.οnlοad=function (){
 o.imgRandom();
}
var o={
aImg:['1','2','5461d1423dfae93416000001','5461d1723dfae94c22000001'],/*图片路径*/
imgRandom:function (){
    var img=document.getElementsByTagName("img")[0];
    var b=Math.random()*10;
    b=Math.floor(b)%(this.aImg.length);
    img.src=this.aImg[b]+".jpg";
}
};