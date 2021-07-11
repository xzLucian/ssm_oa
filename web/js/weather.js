let information = document.querySelector('.weather-side'); //当前天气div
let todayInfo = document.querySelector(".today-info-container"); //获取天气预报 div
let week = document.querySelector(".week-list");
let list_wrap = document.querySelector("#list_wrap");
var cityName = returnCitySN.cname; //通过搜狐接口获取到城市地址
console.log(cityName);
var key = cutString(cityName); //调用截取方法将所需要的字符串提取出来并赋值给key变量

//创建截取字符串的方法
function cutString(cityName) {
    var start = cityName.indexOf("省");
    var end = cityName.indexOf("市");
    var resultCity = cityName.substr(start + 1, end - 3);
    return resultCity;
}

// 调用自动渲染的方法 传递的参数是城市名字key
autorend("南昌");

/* 自动渲染方法*/
function autorend(cityName) {
    let nowurl = "https://free-api.heweather.net/s6/weather/now?location=" + cityName + "&key=26be256aca2c43a7bb7f9a72e0f99a6b";
    let dailyurl = "https://free-api.heweather.net/s6/weather/forecast?location=" + cityName + "&key=26be256aca2c43a7bb7f9a72e0f99a6b";
    let lifestyleurl = "https://free-api.heweather.net/s6/weather/lifestyle?location=" + cityName + "&key=26be256aca2c43a7bb7f9a72e0f99a6b";
    console.log("执行自动渲染")
    rendweather(nowurl, cityName, dailyurl, lifestyleurl);

}
// 获取时间的方法
function getTime() {
    let date = new Date();
    let year = date.getFullYear();
    let month = date.getMonth() + 1;
    let day = date.getDate();
    let house = date.getHours();
    house = house < 10 ? '0' + house : house;
    let minutes = date.getMinutes();
    minutes = minutes < 10 ? '0' + minutes : minutes;
    let second = date.getMinutes();
    second = second < 10 ? '0' + second : second;
    // let time = year + "年 - " + month + "月 - " + day + "日 - " + house + ":" + minutes + ":" + second;
    let time = year + "年" + month + "月" + day + "日";
    return time;
}
//获取当前是星期几
function getDate(num) {
    return "星期" + "日一二三四五六".charAt(new Date().getDay() + num);
}

/*主页面渲染*/
function rendweather(nowurl, cityName, dailyurl, lifestyleurl) {
    /*获取今日天气信息*/
    getAjax(nowurl, function (xhr) {
        let databoj = JSON.parse(xhr.response);
        let now = databoj.HeWeather6[0].now;
        /* 渲染今日天气*/
        information.innerHTML = `
        <div class="weather-gradient"></div>
        <div class="date-container">
        <h2 class="date-dayname">${getDate(0)}</h2>
        <span class="date-day">${getTime()}</span>
        <span class="location">${cityName}</span>
      </div>
      <div class="weather-container">
      <div class="weather" id="weather"></div>
        <h1 class="weather-temp">${now.tmp}°C</h1>
        <h3 class="weather-desc">${now.cond_txt}</h3>
      </div>
        `;

        todayInfo.innerHTML = `
        <div class="today-info">
          <div class="precipitation"> <span class="title">降水量</span><span class="value">${now.pcpn}%</span>
            <div class="clear"></div>
          </div>
          <div class="humidity"> <span class="title">湿度</span><span class="value">${now.hum}%</span>
            <div class="clear"></div>
          </div>
          <div class="wind"> <span class="title">风速</span><span class="value">${now.wind_spd}km/h</span>
            <div class="clear"></div>
          </div>
          <div class="wind"> <span class="title">风向</span><span class="value">${now.wind_dir}</span>
            <div class="clear"></div>
          </div>
          <div class="wind"> <span class="title">能见度</span><span class="value">${now.vis}%</span>
            <div class="clear"></div>
          </div>
        </div>
        `;
        var weather = document.getElementById("weather");
        // 创建雾的方法
        function createFog() {
            var div = document.createElement("div");
            div.className = "fog";
            div.id = "fog";
            weather.appendChild(div);
            var ulCloud1 = document.createElement("ul");
            ulCloud1.className = "cloud1";
            div.appendChild(ulCloud1);
            for (var i = 0; i < 4; i++) {
                var li = document.createElement("li");
                ulCloud1.appendChild(li);
            }
            var ulCloud2 = document.createElement("ul");
            ulCloud2.className = "cloud2";
            div.appendChild(ulCloud2);
            for (var i = 0; i < 4; i++) {
                var li = document.createElement("li");
                ulCloud2.appendChild(li);
            }
            var ulFogs = document.createElement("ul");
            ulFogs.className = "fogs";
            div.appendChild(ulFogs);
            for (var i = 0; i < 3; i++) {
                var li = document.createElement("li");
                ulFogs.appendChild(li);
            }
        }
        //创建小雨的方法
        function createLightRain() {
            var div = document.createElement("div");
            div.className = "light-rain";
            div.id = "light-rain";
            weather.appendChild(div);
            var ul = document.createElement("ul");
            div.appendChild(ul);
            for (var i = 0; i < 5; i++) {
                var li = document.createElement("li");
                li.className = "rain";
                ul.appendChild(li);
            }
            var ulCloud = document.createElement("ul");
            ulCloud.className = "cloud";
            div.appendChild(ulCloud);
            for (var i = 0; i < 4; i++) {
                var li = document.createElement("li");
                ulCloud.appendChild(li);
            }
        }
        //创建大雨的方法
        function createHeavyRain() {
            var div = document.createElement("div");
            div.className = "heavy-rain";
            div.id = "heavy-rain";
            weather.appendChild(div);
            var ulrain = document.createElement("ul");
            div.appendChild(ulrain);
            for (var i = 0; i < 12; i++) {
                var li = document.createElement("li");
                li.className = "rain";
                ulrain.appendChild(li);
            }
            var ulCloud = document.createElement("ul");
            ulCloud.className = "cloud";
            div.appendChild(ulCloud);
            for (var i = 0; i < 4; i++) {
                var li = document.createElement("li");
                ulCloud.appendChild(li);
            }
        }
        //创建雷阵雨的方法
        function createBreezy() {
            var div = document.createElement("div");
            div.className = "breezy";
            div.id = "breezy";
            weather.appendChild(div);
            var ulrain = document.createElement("ul");
            div.appendChild(ulrain);
            for (var i = 0; i < 12; i++) {
                var li = document.createElement("li");
                li.className = "rain";
                ulrain.appendChild(li);
            }
            var ulCloud = document.createElement("ul");
            ulCloud.className = "cloud";
            div.appendChild(ulCloud);
            for (var i = 0; i < 4; i++) {
                var li = document.createElement("li");
                ulCloud.appendChild(li);
            }
        }
        //创建多云的方法
        function createCloudy() {
            var div = document.createElement("div");
            div.className = "cloudy";
            div.id = "cloudy";
            weather.appendChild(div);
            var ulCloud1 = document.createElement("ul");
            ulCloud1.className = "cloud1";
            div.appendChild(ulCloud1);
            for (var i = 0; i < 4; i++) {
                var li = document.createElement("li");
                ulCloud1.appendChild(li);
            }
            var ulCloud2 = document.createElement("ul");
            ulCloud2.className = "cloud2";
            div.appendChild(ulCloud2);
            for (var i = 0; i < 4; i++) {
                var li = document.createElement("li");
                ulCloud2.appendChild(li);
            }
        }
        //创建阴天的方法
        function createOvercast() {
            var divOvercast = document.createElement("div");
            divOvercast.className = "overcast";
            divOvercast.id = "overcast";
            weather.appendChild(divOvercast);
            var divSun = document.createElement("div");
            divSun.className = "sun";
            divOvercast.appendChild(divSun);
            var ulCloud2 = document.createElement("ul");
            ulCloud2.className = "cloud2";
            divOvercast.appendChild(ulCloud2);
            for (var i = 0; i < 4; i++) {
                var li = document.createElement("li");
                ulCloud2.appendChild(li);
            }
        }
        // 创建晴天的方法
        function createHot() {
            var div = document.createElement("div");
            div.className = "hot";
            div.id = "hot";
            weather.appendChild(div);
            var span1 = document.createElement("span");
            var span2 = document.createElement("span");
            span1.className = "sun";
            span2.className = "sunx";
            div.appendChild(span1);
            div.appendChild(span2);
        }
        //创建夜晚晴天的方法
        function createNight() {
            var div = document.createElement("div");
            div.className = "night";
            div.id = "night";
            weather.appendChild(div);
            var spanMoon = document.createElement("span");
            spanMoon.className = "moon";
            div.appendChild(spanMoon);
            var spanspot1 = document.createElement("span");
            spanspot1.className = "spot1";
            div.appendChild(spanspot1);
            var spanSpot2 = document.createElement("span");
            spanSpot2.className = "spot2";
            div.appendChild(spanSpot2);
            var ul = document.createElement("ul");
            div.appendChild(ul);
            for (var i = 0; i < 4; i++) {
                var li = document.createElement("li");
                ul.appendChild(li);
            }
        }
        //创建小雪的方法
        function createLightSnow() {
            var div = document.createElement("div");
            div.className = "light-snow";
            div.id = "light-snow";
            weather.appendChild(div);
            var ul = document.createElement("ul");
            div.appendChild(ul);
            for (var i = 0; i < 4; i++) {
                var li = document.createElement("li");
                ul.appendChild(li);
            }
            var spanSnowe = document.createElement("span");
            spanSnowe.className = "snowe";
            div.appendChild(spanSnowe);
            var spanSnowex = document.createElement("span");
            spanSnowex.className = "snowex";
            div.appendChild(spanSnowex);
            var spanStick = document.createElement("span");
            spanStick.className = "stick";
            div.appendChild(spanStick);
            var spanStick2 = document.createElement("span");
            spanStick2.className = "stick2";
            div.appendChild(spanStick2);
            var spanSnowe = document.createElement("span");
            spanSnowe.className = "snowe";
            div.appendChild(spanSnowe);
        }
        //创建大雪的方法
        function createStormy() {
            var div = document.createElement("div");
            div.className = "stormy";
            div.id = "stormy";
            weather.appendChild(div);
            var ul = document.createElement("ul");
            div.appendChild(ul);
            for (var i = 0; i < 8; i++) {
                var li = document.createElement("li");
                ul.appendChild(li);
            }
            var spanSnowe = document.createElement("span");
            spanSnowe.className = "snowe";
            div.appendChild(spanSnowe);
            var spanSnowex = document.createElement("span");
            spanSnowex.className = "snowex";
            div.appendChild(spanSnowex);
            var spanStick = document.createElement("span");
            spanStick.className = "stick";
            div.appendChild(spanStick);
            var spanStick2 = document.createElement("span");
            spanStick2.className = "stick2";
            div.appendChild(spanStick2);
            var spanSnowe2 = document.createElement("span");
            spanSnowe2.className = "snowe2";
            div.appendChild(spanSnowe2);
            var spanSnowex2 = document.createElement("span");
            spanSnowex2.className = "snowex2";
            div.appendChild(spanSnowex2);
            var spanStick3 = document.createElement("span");
            spanStick3.className = "stick3";
            div.appendChild(spanStick3);
            var spanStick4 = document.createElement("span");
            spanStick4.className = "stick4";
            div.appendChild(spanStick4);
        }

        // 创建天气图标
        var myDate = new Date;
        var hours = myDate.getHours();
        switch (now.cond_txt) {
            case "晴":
                if (hours >= 18 && hours <= 23 && now.cond_txt == "晴") {
                    createNight();
                    break;
                } else {
                    createHot();
                    break;
                }
                case "阴":
                    createOvercast();
                    break;
                case "霾":
                    createFog();
                    break;
                case "多云":
                    createCloudy();
                    break;
                case "小雨":
                    createLightRain();
                    break;
                case "大雨":
                    createHeavyRain();
                    break;
                case "大雪":
                    createStormy();
                    break;
                case "雷阵雨":
                    createBreezy();
                    break;
                case "小雪":
                    createLightSnow();
                    break;
        }

        /*获取天气预告信息*/
        getAjax(dailyurl, function (xhr) {
            week.innerHTML = ""; /*清除之前的渲染*/
            let databoj = JSON.parse(xhr.response);
            let daily = databoj.HeWeather6[0].daily_forecast;
            /*渲染天气预报*/
            week.innerHTML += `
          <li><span class="day-name">${getDate(1)}</span><span
              class="day-temp">${daily[0].tmp_max}°C/${daily[0].tmp_min}°C</span></li>
          <li><span class="day-name">${getDate(2)}</span><span
              class="day-temp">${daily[1].tmp_max}°C/${daily[1].tmp_min}°C</span></li>
          <li><span class="day-name">${getDate(3)}</span><span
              class="day-temp">${daily[2].tmp_max}°C/${daily[2].tmp_min}°C</span></li>
          <div class="clear"></div>
              `;
        });
        //获取生活信息指数信息
        getAjax(lifestyleurl, function (xhr) {
            list_wrap.innerHTML = ""; /*清除之前的渲染*/
            let databoj = JSON.parse(xhr.response);
            let daily = databoj.HeWeather6[0].lifestyle;
            /*渲染天气预报*/
            list_wrap.innerHTML += `
            <div class="item">
               <span class="index">舒适度指数</span>
               <span class="suggest">建议：${daily[0].brf}</span>
               <div class="txt">${daily[0].txt}</div>
            </div>
            <div class="item">
               <span class="index">穿衣指数</span>
               <span class="suggest">建议：${daily[1].brf}</span>
               <div class="txt">${daily[1].txt}</div>
            </div>
            <div class="item">
               <span class="index">感冒指数</span>
               <span class="suggest">建议：${daily[2].brf}</span>
               <div class="txt">${daily[2].txt}</div>
            </div>
            <div class="item">
               <span class="index">运动指数</span>
               <span class="suggest">建议：${daily[3].brf}</span>
               <div class="txt">${daily[3].txt}</div>
            </div>
            <div class="item">
               <span class="index">旅游指数</span>
               <span class="suggest">建议：${daily[4].brf}</span>
               <div class="txt">${daily[4].txt}</div>
            </div>
            <div class="item">
               <span class="index">紫外线指数</span>
               <span class="suggest">建议：${daily[5].brf}</span>
               <div class="txt">${daily[5].txt}</div>
            </div>
            <div class="item">
               <span class="index">洗车指数</span>
               <span class="suggest">建议：${daily[6].brf}</span>
               <div class="txt">${daily[6].txt}</div>
            </div>
            <div class="item">
               <span class="index">空气污染扩散条件指数</span>
               <span class="suggest">建议：${daily[7].brf}</span>
               <div class="txt">${daily[7].txt}</div>
            </div>
            `;
        });
    });
}
// Ajax中的post 和 get 方式获取请求
function getAjax(httpUrl, callbackFn) {
    //创建xhr对象
    var xhr = new XMLHttpRequest();
    //设置请求的方法和路径，“Get”“POST”
    //get 表单提交的数据会拼接到请求的路径里，效率高
    //post 会将表单的数据放置到请求的body里，数据大，安全
    xhr.open("GET", httpUrl);
    //xhr.open("POST","地址")
    //xhr.open("GET","地址?数据")

    //发送数据
    xhr.send();
    xhr.onreadystatechange = function () {
        if (xhr.status == 200 && xhr.readyState == 4) {
            callbackFn(xhr);

        }
    }
}