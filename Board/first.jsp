<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="/0319_before_flex.css">
    <link rel="stylesheet" href="/try.css">

    <title>WeCart</title>

    <script src="https://kit.fontawesome.com/a623128410.js" crossorigin="anonymous"></script>

    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Source+Sans+Pro:ital,wght@1,700&display=swap"
        rel="stylesheet">

</head>
<body>
    <div class="wrapper_contatiner">
      <div class="wrapper">
       
        <header>
            <div class="container">
                <div class="site_name">
                         <div class="WeCart">
                            <span>우리동네<br>장바구니</span>
                        </div> <!--WeCart-->
                </div>  <!--site_name-->

                <ul class="headerbar_menu">
                    <li>가격비교</li>
                    <li>커뮤니티</li>
                    <li>Q&A</li>
                </ul><!--headerbar_menu-->

                <ul class="header_login">
                    <li>개포동 <i class="fa-solid fa-location-dot"></i></li>
                    <li>로그인</li>
                </ul><!--header_login-->

            </div> <!--container-->
        
        </header>



        <main>
        <!--*********************************************메인 내용은 여기부터*********************************************-->
            <div class="main_container">
                <div class="content">
                    당신의 장바구니가 더 가벼워집니다.<br>가장 합리적으로 소비하는 방법
                </div>
        
                <div class="adr_start">
                    <!-- <input class="adr" type="text" name="adr" placeholder="당신의 동네를 입력해주세요."> -->
                    <!-- <input class="start" type="button" onclick="sample6_execDaumPostcode()" value="start"> -->

                    <input type="text" id="sample5_address" placeholder="주소">
                    <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
                    <div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>

                </div>
    
                </div>
        </div>
        <!--*********************************************메인 내용은 여기까지*********************************************-->
        </main>

    </div> <!-- wrapper: header+main-->

        <footer>
            <div class="footerText">
                <p>
                    WeCart
                    <span>
                        <a href="">사업자 정보</a>
                        <a href="">이용약관</a>
                        <a href="">개인정보처리방침</a>
                    </span>
                </p>
                
                <p>
                    Woojungjo
                    <a href="https://github.com/zuxico123">감성현</a>
                    <a href="https://github.com/KimYongSae">김용세</a>
                    <a href="https://github.com/JeongHwan95">김정환</a>
                    <a href="https://github.com/comdesk">김지연</a>
                    <a href="https://github.com/Juyeonjoo">조연주</a>
                    <span class="copyright">&copy; 2023 WeCart, Inc. All Rights Reserved</span>
                 </p>
            </div>
        </footer>
    </div> <!--wrapper_contatiner-->
</body>


<!-- 카카오API -->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=be8f3b8bf2f892c159cfeb384998199"></script>
<!-- <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은 API KEY를 사용하세요&libraries=services"></script> -->

<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476 ), // 지도의 중심좌표
            <!-- 37.4992, 127.0332  kh
                37.537187, 127.005476 원래
            -->
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476 ),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
</html>