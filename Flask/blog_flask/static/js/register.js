function bindEmailCatchaClick(){
     $("#captcha-btn").click(function (event){
       //this包装为jquery对象
       var $this=$(this);

      //阻止默认事件
       event.preventDefault();

       var email=$("input[name='email']").val();            //获取输入框信息
       $.ajax({
           //auth.py中获取邮箱验证码的地址
           url:"/auth/captcha/email?email="+email,
           method: 'GET',
           success:function (result){
               var code=result['code'];
               if (code == 200){
                   //倒计时60秒
                   var countdown=10;
                   //开始倒计时前，取消按钮点击事件
                   $this.off("click");
                   var timer=setInterval(function (){
                       $this.text(countdown);
                       countdown -=1;
                       //倒计时结束后执行
                       if (countdown <= 0){
                           //清楚计时器
                           clearInterval(timer);
                           //将按钮的字段重新改回来
                           $this.text("获取验证码");
                           //重新绑定事件
                           BindEmailCatchaClick();
                       }

                   },1000);
                   // alert('邮箱发送成功');
               }else{
                   alert("邮箱发送失败");
               }
           },
           fail: function (e){
               console.log(e);
           }
       })
   });
}
$(function (){
    bindEmailCatchaClick();
});

