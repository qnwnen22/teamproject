<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                    키워드 : <input type="text" value="판교" id="keyword" size="15"> 
                    <button type="button" onclick="searchPlaces(); return false">검색하기</button> 
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c81a746382dcdac68829f1147ff5907b&libraries=services,clusterer,drawing"></script>
<script src="${path}/include/js/kakaoMap.js"></script>
