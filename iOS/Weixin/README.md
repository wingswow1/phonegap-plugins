#Weixin

##Adding the Plugin to your project
1.add weixin.js to your www folder and include it to your html file below cordova.js
<pre><code>
<script type="text/javascript" charset="utf-8" src="cordova.js">
<script type="text/javascript" charset="utf-8" src="weixin.js">
</code></pre>
2.Add WeChatSDK & SinaWeixinPlugin src files to your project.
3.Add Weixin-SinaWeixinPlugin [key-value] to Cordova.plist->Plugins
##Usage
###sina.weixin.registerApp(onSuccess,onError,appId)


  * appId ID ([[http://open.weixin.qq.com/]])
  * onSuccess 
  * onError 
    * errCode 
    * errStr 

demo
<pre><code>
sina.weixin.registerApp(function(){
                            registed=true;
                            },onError,"wxd930ea5d5a258f4f");
function onError(response){
    var detail = document.getElementById("detail");
    detail.innerHTML="error:"+response.errCode;
    detail.innerHTML=detail.innerHTML+"<br>"+response.errStr;
}
</code></pre>
###sina.weixin.getWXAppInstallUrl(onSuccess,onError)
itunes
  * onSuccess 
  * onError 
    * errCode 
    * errStr 

function onSuccess(url){
}
url itunes

function onError(error){
}

demo
<pre><code>
sina.weixin.getWXAppInstallUrl(function(resultUrl){
                                   console.log(resultUrl);
                                   },function(error){
                                   console.log(error.errCode);
                                   console.log(error.errStr);
                                   });
</code></pre>
###sina.weixin.isWeixinInstalled(onSuccess,onError)

  * onSuccess 
  * onError 
    * errCode 
    * errStr 
demo
<pre><code>
sina.weixin.isWeixinInstalled(function(){
                          console.log('is installed');
                          },function(){
                          console.log('not installed');
                          });
</code></pre>
###sina.weixin.isSupportApi(onSuccess,onError)
OpenApi
  * onSuccess OpenApi
  * onError OpenApi
    * errCode 
    * errStr 
demo
<pre><code>
sina.weixin.isSupportApi(function(){
                                  console.log('is support api');
                                  },function(){
                                  console.log('not support api');
                                  });
</code></pre>
###sina.weixin.openWXApp(onSuccess,onError)

  * onSuccess 
  * onError 
    * errCode 
    * errStr 
demo
<pre><code>
sina.weixin.openWXApp(function(){
                          console.log('open success');
                          },function(){
                          console.log('open error');
                          });
</code></pre>
###sina.weixin.textContent(onSuccess, onError, types, text)
/ 

,


  * onSuccess 
  * onError 
  * types 
    * send 
    * get 
  * text 
demo
<pre><code>
function getTextContent() {
    sina.weixin.textContent(onSuccess,onError,"get","Sina App Engine");
}

function sendTextContent() {
    sina.weixin.textContent(onSuccess,onError,"send","hello world");
}

function onSuccess(){
    console.log('success');
}

function onError(response){
    var detail = document.getElementById("detail");
    detail.innerHTML="error:"+response.errCode;
    detail.innerHTML=detail.innerHTML+"<br>"+response.errStr;
}
</code></pre>

###sina.weixin.imageContent(onSuccess, onError, types, imageUrl, options)
/ 

,


  * onSuccess 
  * onError 
  * types 
    * send 
    * get 
  * imageUrl Url
  * options 
    * title 
    * description
demo
<pre><code>
function sendImageContent(){
/**/
    var app={
    onCameraSuccess:function(imageURI){
        sina.weixin.imageContent(onSuccess,onError,"send",imageURI,{
                                     title:"kris",
                                     description:"picture",
                                     });
    },
    onCameraFail:function(msg){
        console.log('error msg:'+msg);
    },
    getPicture:function(){
        navigator.camera.getPicture(app.onCameraSuccess, app.onCameraFail, {
                                    quality: 50,
                                    destinationType: Camera.DestinationType.FILE_URI,
                                    sourceType: Camera.PictureSourceType.PHOTOLIBRARY,
                                    saveToPhotoAlbum: false
                                    });
    }
    };
    app.getPicture();
}

function getImageContent(){
//
    sina.weixin.getImageContent(onSuccess,onError,"http://pluginlist.sinaapp.com/client/images/music.png",{
                                title:"kris",
                                description:"picture",
                                });
}

function onSuccess(){
    console.log('success');
}
 
function onError(response){
    var detail = document.getElementById("detail");
    detail.innerHTML="error:"+response.errCode;
    detail.innerHTML=detail.innerHTML+"<br>"+response.errStr;
}
</code></pre>
###sina.weixin.musicContent(onSuccess, onError, types, musicUrl, options)
/ musicUrllowBandUrl

,


  * onSuccess 
  * onError 
  * types 
    * send 
    * get 
  * musicUrl urlURLmusicUrllowBandUrl
  * options 
    * title 
    * description 
    * lowBandUrl lowbandurlURLmusicUrllowBandUrl
    * thumbUrl urlthumbUrlthumbDatathumbData
    * thumbData base6432KthumbUrlthumbDatathumbData
demo
<pre><code>
function sendMusicContent(){
    sina.weixin.musicContent(onSuccess,onError,"send",
                                 "http://pluginlist.sinaapp.com/client/music/Sunshine.mp3",
                                 {
                                 title:"Sunshine",
                                 description:"Happy Music",
                                 thumbUrl:"http://pluginlist.sinaapp.com/client/images/music.png"
                                 });
}
function getMusicContent(){
    sina.weixin.musicContent(onSuccess,onError,"get",
                                    "http://pluginlist.sinaapp.com/client/music/Sunshine.mp3",
                                    {
                                    title:"Sunshine",
                                    description:"Happy Music",
                                    thumbUrl:"http://pluginlist.sinaapp.com/client/images/music.png"
                                    });
}
function onSuccess(){
    console.log('success');
}
function onError(response){
    var detail = document.getElementById("detail");
    detail.innerHTML="error:"+response.errCode;
    detail.innerHTML=detail.innerHTML+"<br>"+response.errStr;
}
</code></pre>
###sina.weixin.videoContent(onSuccess, onError, types, videoUrl, options)
/ videoUrllowBandUrl

,



  * onSuccess 
  * onError 
  * types 
    * send 
    * get 
  * videoUrl urlURLvideoUrllowBandUrl
  * options 
    * title 
    * description 
    * lowBandUrl lowbandurlURLvideoUrllowBandUrl
    * thumbUrl urlthumbUrlthumbDatathumbData
    * thumbData base6432KthumbUrlthumbDatathumbData
demo
<pre><code>
function getVideoContent(){
    sina.weixin.videoContent(onSuccess,onError,"get",
                             "http://www.tudou.com/listplay/0nYp1obVv60/mA_xdJq7lSo.html",
                             {
                             title:"video",
                             description:"Get Happy Video",
                             thumbUrl:"http://pluginlist.sinaapp.com/client/images/video.png"
                             });
}
function sendVideoContent(){
    sina.weixin.videoContent(onSuccess,onError,"send",
                                 "http://www.tudou.com/listplay/0nYp1obVv60/mA_xdJq7lSo.html",
                                 {
                                 title:"video",
                                 description:"Happy Video",
                                 thumbUrl:"http://pluginlist.sinaapp.com/client/images/video.png"
                                 });
}
</code></pre>
###sina.weixin.webpageContent(onSuccess, onError, types, webpageUrl, options)
/ 




  * onSuccess 
  * onError 
  * types 
    * send 
    * get 
  * webpageUrl url
  * options 
    * title 
    * description 
    * thumbUrl urlthumbUrlthumbDatathumbData
    * thumbData base6432KthumbUrlthumbDatathumbData
demo
<pre><code>
function sendWebpageContent(){
    sina.weixin.webpageContent(onSuccess,onError,"send",
                                   "http://sae.sina.com.cn/?m=devcenter&catId=235",
                                   {
                                   title:"",
                                   description:"SAE+\nSAE",
                                   thumbUrl:"http://pluginlist.sinaapp.com/client/images/icon.png"
                                   });
}
function getWebpageContent(){
    sina.weixin.webpageContent(onSuccess,onError,"get",
                                  "http://sae.sina.com.cn/?m=devcenter&catId=235",
                                  {
                                  title:"",
                                  description:"SAE+\nSAE",
                                  thumbUrl:"http://pluginlist.sinaapp.com/client/images/icon.png"
                                  });
}
</code></pre>
###sina.weixin.APPContent(onSuccess, onError, types, options)
/ APPAPPsina.weixin.setResponser(responseString) [[http://team.sae.sina.com.cn/mobilewiki/doku.php?id=%E5%BE%AE%E4%BF%A1&#sinaweixinsetresponser_responsestring]]

APP,

APP
  * onSuccess 
  * onError 
  * types APP
    * send APP
    * get APP
  * options 
    * title APP
    * description APP
    * thumbUrl APPurlthumbUrlthumbDatathumbData
    * thumbData APPbase6432KthumbUrlthumbDatathumbData
    * extInfo 2KextInfofileData
    * fileData APPJSON10MextInfofileData
    * url urlApp
demo
<pre><code>
function getAPPContent(){
    sina.weixin.APPContent(onSuccess,onError,"get",
                           {
                           title:"App",
                           description:"App",
                           thumbUrl:"http://pluginlist.sinaapp.com/client/images/icon.png",
                           extInfo:"dictionary",
                           url:"http://sae.sina.com.cn",
                           fileData:JSON.stringify(
                                                   {title:"App",
                                                   description:"",
                                                   thumbUrl:""}
                                                   )
                           });
}
function sendAPPContent(){
    sina.weixin.APPContent(onSuccess,onError,"send",
                           {
                           title:"App",
                           description:"App",
                           thumbUrl:"http://pluginlist.sinaapp.com/client/images/icon.png",
                           extInfo:"send APP",
                           url:"http://www.sina.com.cn",
                           fileData:JSON.stringify(
                                                   {title:"App",
                                                   description:"",
                                                   thumbUrl:""}
                                                   )
                           });
}
</code></pre>
###sina.weixin.setResponser(responseString)

  * responseString receiveResponse

function receiveResponse(response);
  * type 
    * 0 APP
    * 4 
  * type==0response
    * extInfo [2K]
    * fileData APPJSON[10M]
    * thumbData APPbase64
demo
<pre><code>
sina.weixin.setResponser("receiveResponse");
function receiveResponse(response){
    if(response.type==0)
    {//APP
        var detail = document.getElementById("detail");
        detail.innerHTML="extInfo:"+response.extInfo;
        
        var a=JSON.parse(response.fileData);
        detail.innerHTML=detail.innerHTML+"<br>title:"+a.title;
        detail.innerHTML=detail.innerHTML+"<br>description:"+a.description;
        detail.innerHTML=detail.innerHTML+"<br>thumbUrl:"+a.thumbUrl;
        
        var viewport = document.getElementById('viewport');
        viewport.style.display = "";
        document.getElementById("picture").src = "data:image/jpeg;base64," + response.thumbData;
    }
    else if(response.type==4)
    {// 
        var btn1=document.getElementById("btn1");
        btn1.onclick=function(){sina.weixin.textContent(onSuccess,onError,"get","Sina App Engine");};
        btn1.innerHTML="";
    }
}
</code></pre>