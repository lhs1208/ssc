<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=64d0efe96681e6b5848a9df1d4bd2373"></script>
<%@ include file="/WEB-INF/views/inc/head.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.form.js"></script>
<script>
	$(function() {
	    $("#Datepicker1").datepicker({
	        changeMonth: false,
	        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
	        monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        minDate: 0,
	        maxDate: "+60D",
	        dateFormat: "yymmdd",
	        onSelect: function(selected) {
	            $("#Datepicker2").datepicker("option", "minDate", selected);
	        }
	    });
	
	    $("#Datepicker2").datepicker({
	        changeMonth: false,
	        dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
	        monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
	        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        minDate: 0,
	        maxDate: "+60D",
	        dateFormat: "yymmdd",
	        onSelect: function(selected) {
	            $("#Datepicker1").datepicker("option", "maxDate", selected);
	        }
	    });
	
	    var dt = new Date();
	    var month = dt.getMonth() + 1;
	    var day = dt.getDate();
	    var year = dt.getFullYear();
	    $("#Datepicker1").val(year + "" + month + "" + day);
	    $("#Datepicker2").val(year + "" + month + "" + day);
	});
</script>



<style type="text/css">
.regionlist {
	display: inline-block;
	margin-right: 10px;
}

.regionlist:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/inc/topbar.jsp"%>

	<!-- 내용영역 -->
	<div class="main" id="c">
		<div class="container" id="b">
			<!-- 검색 form -->
			<form id="comment_form" onsubmit="return false;">
				<div class="col-sm-4">
					<input class="form-control" name="zonelist" id="zonelist" type="text" placeholder="존 검색">
				</div>
				<div class="col-sm-2">
					<button id="abc" type="button" class="btn btn-primary" onclick="location.href='#go'">검색</button>
				</div>
				<div class="col-sm-6">
					<ul>
						<li class="regionlist seoul">서울</li>
						<li class="regionlist ggincheon">인천·경기</li>
						<li class="regionlist gangwon">강원</li>
						<li class="regionlist daejeon">대전·충청</li>
						<li class="regionlist daegu">대구·경북</li>
						<li class="regionlist gwangju">광주·전라</li>
						<li class="regionlist busan">부산·경남</li>
						<li class="regionlist jeju">제주</li>
					</ul>
				</div>
			</form>
			
			<hr>
			<!--탭 bar 끝-->

			<script type="text/javascript">
				$(document).ready(function() {
				    $("#comment_form input[name=zonelist]").keydown(function(e) {
				        if (e.keyCode == 13) {
				            setTimeout(function() {
				                e.cancelBubble = true;
				                $("#abc").click();
				                return false;
				            }, 100);
				        }
				    });
				});
			</script>
			
			<script type="text/javascript">
				$("#zonelist").on("click keyup", function(e) {
				    if (this.createTextRange) {
				        var range = this.createTextRange();
				        range.move('character', this.value.length);
				        range.select();
				    } else if (this.selectionStart || this.selectionStart == '0') {
				        this.selectionStart = this.value.length;
				    }
				});
			</script>

			<script type="text/javascript">
				$(function(){
					$(document).on('click','.fff', function(e){
						
						var a = $(this).attr('value');
					
					
					$(document).on('click',"#kkk", function(){
						$("#startDate").val($("#Datepicker1").val());
						$("#endDate").val($("#Datepicker2").val());
						$("#carId").val(a);
					})//kkk 클릭 끝
					
						//날짜 작을경우 처리하는 변수 선언 
						var template = Handlebars.compile(
							$("#tmpl_time_item").html());
							$("#test").html(template);
						
						var yymmdd1 = $("#Datepicker1").val();
						var yymmdd2 = $("#Datepicker2").val();
						//끝
						

						//날짜가 같을경우 b는 a보다 무조건 작게 만드는 처리
						if (yymmdd1 == yymmdd2) {
							$(document).on('click','.valueA',function(){
								var ss1 = $("select[name=valueA]").val();
								
								for (var k = 1; k < 25; k++) {
									if (k <= ss1){
										$('select[name=valueB] option[value="'+ k+ '"]').attr('disabled','disabled')
									}
								}
							})
						}
						//끝
						
						
						$.ajax({
						    type: 'post',
						    url: "${pageContext.request.contextPath}/book_ok.do",
						    dataType: "json",
						    data: {
						        car_id: a
						    },
						    success: function(json) {
						        // 템플릿 HTML을 로드한다.
						        var template = Handlebars.compile($("#tmpl_book_item").html());
						        // 지우고 다시 뿌림
						        $("#book_list").html("");
						
						        for (var i = 0; i < json.itemBook.length; i++) {
						            // 변수 선언
						            var a = json.itemBook[i];
						            // 시작
						            var yymmdd1 = $("#Datepicker1").val();
						            var yymm1 = yymmdd1.substring(0, 8);
						            // 종료
						            var yymmdd2 = $("#Datepicker2").val();
						            var yymm2 = yymmdd2.substring(0, 8);
						            var hh1 = $("select[name=valueA]").val();
						            var hh2 = $("select[name=valueB]").val();
						            var yymmddhh1 = yymmdd1 + hh1;
						            var yymmddhh2 = yymmdd2 + hh2;
						
						            var sdate = json.itemBook[i].startDate;
						            var edate = json.itemBook[i].endDate;
						
						            var sdatetime = sdate.substring(8, 10);
						            var edatetime = edate.substring(8, 10);
						            ///////////테스트////////
						            var sdateyymm = sdate.substring(0, 8);
						            var edateyymm = edate.substring(0, 8);
						
						            sdatetime1 = parseInt(sdatetime);
						            edatetime1 = parseInt(edatetime);
						
						            sdate = parseInt(sdate);
						            edate = parseInt(edate);
						            sdateyymm = parseInt(sdateyymm);
						            edateyymm = parseInt(edateyymm);
						            yymmdd1 = parseInt(yymmdd1);
						            yymmdd2 = parseInt(yymmdd2);
						            sdate1 = sdateyymm + sdatetime1;
						            edate1 = edateyymm + edatetime1;
						            // 변수 선언 끝
						
						            // 시간 비교 시작 value A 선택
						            if (sdateyymm == yymmdd1 && yymmdd1 == edateyymm) {
						                for (var k = 1; k < 25; k++) {
						                    if (sdatetime1 <= k && k <= edatetime1) {
						                        $('select[name=valueA] option[value="' + k + '"]').attr('disabled', 'disabled');
						                    }
						                }
						            } else if (sdateyymm < yymmdd1 && yymmdd1 < edateyymm) {
						                for (var k = 1; k < 25; k++) {
						                    $('select[name=valueA] option[value="' + k + '"]').attr('disabled', 'disabled');
						                }
						            } else if (sdateyymm == yymmdd1 && yymmdd1 < edateyymm) {
						                for (var k = 1; k < 25; k++) {
						                    if (sdatetime1 <= k) {
						                        $('select[name=valueA] option[value="' + k + '"]').attr('disabled', 'disabled');
						                    }
						                }
						            } else if (sdateyymm != yymmdd1 && yymmdd1 == edateyymm) {
						                for (var k = 1; k < 25; k++) {
						                    if (k <= edatetime1) {
						                        $('select[name=valueA] option[value="' + k + '"]').attr('disabled', 'disabled');
						                    }
						                }
						            }
						
						            // 시간 비교 value A 선택 시 value B 값 선택
						            $(document).on('click', '.valueA', function() {
						                for (var i = 0; i < json.itemBook.length; i++) {
						                    // value B 선택 변수 선언
						                    var ss1 = $("select[name=valueA]").val();
						                    var sdate7 = json.itemBook[i].startDate;
						                    var edate7 = json.itemBook[i].endDate;
						                    var sdatetime7 = sdate7.substring(8, 10);
						                    var edatetime7 = edate7.substring(8, 10);
						                    var sdateyymm7 = sdate7.substring(0, 8);
						                    var edateyymm7 = edate7.substring(0, 8);
						
						                    sdateyymm7 = parseInt(sdateyymm7);
						                    edateyymm7 = parseInt(edateyymm7);
						                    yymmdd1 = parseInt(yymmdd1);
						                    yymmdd2 = parseInt(yymmdd2);
						                    sdatetime7 = parseInt(sdatetime7);
						                    edatetime7 = parseInt(edatetime7);
						
						                    var yymmdd1 = $("#Datepicker1").val();
						                    var yymmdd2 = $("#Datepicker2").val();
						                    // 변수 선언 끝
						
						                    // 날짜가 같을 경우 시간 처리
						                    if (yymmdd1 == yymmdd2) {
						                        for (var k = 1; k < 25; k++) {
						                            if (k <= ss1) {
						                                $('select[name=valueB] option[value="' + k + '"]').attr('disabled', 'disabled');
						                            }
						                        }
						                    }
						
						                    // 날짜 같을 경우 시간 비교 시작 value B 선택
						                    if (yymmdd1 == yymmdd2) {
						                        if (sdateyymm7 == yymmdd2 && edateyymm7 == yymmdd2) {
						                            for (var k = 1; k < 25; k++) {
						                                if (k <= ss1) {
						                                    $('select[name=valueB] option[value="' + k + '"]').attr('disabled', 'disabled');
						                                } else if (ss1 <= sdatetime7 && sdatetime7 <= k) {
						                                    $('select[name=valueB] option[value="' + k + '"]').attr('disabled', 'disabled');
						                                }
						                            }
						                        }
						
						                        if (sdateyymm7 == yymmdd2 && yymmdd2 < edateyymm7) {
						                            for (var k = 1; k < 25; k++) {
						                                if (k <= ss1) {
						                                    $('select[name=valueB] option[value="' + k + '"]').attr('disabled', 'disabled');
						                                } else if (ss1 <= sdatetime7 && sdatetime7 <= k) {
						                                    $('select[name=valueB] option[value="' + k + '"]').attr('disabled', 'disabled');
						                                }
						                            }
						                        } else if (sdateyymm7 < yymmdd2 && yymmdd2 == edateyymm7) {
						                            for (var k = 1; k < 25; k++) {
						                                if (k <= ss1) {
						                                    $('select[name=valueB] option[value="' + k + '"]').attr('disabled', 'disabled');
						                                }
						                            }
						                        } else if (yymmdd2 < sdateyymm7 && yymmdd2 < edateyymm7) {
						                            for (var k = 1; k < 25; k++) {
						                                if (k <= ss1) {
						                                    $('select[name=valueB] option[value="' + k + '"]').attr('disabled', 'disabled');
						                                }
						                            }
						                        } else if (yymmdd2 > sdateyymm7 && yymmdd2 > edateyymm7) {
						                            for (var k = 1; k < 25; k++) {
						                                if (k <= ss1) {
						                                    $('select[name=valueB] option[value="' + k + '"]').attr('disabled', 'disabled');
						                                }
						                            }
						                        }
						                    }
						
						                    // 날짜 다를 경우 시간 비교 시작 value B 선택
						                    if (yymmdd1 != yymmdd2) {
						                        if (sdateyymm7 == yymmdd2 && edateyymm7 == yymmdd2) {
						                            for (var k = 1; k < 25; k++) {
						                                if (sdatetime7 <= k) {
						                                    $('select[name=valueB] option[value="' + k + '"]').attr('disabled', 'disabled');
						                                }
						                            }
						                        } else if (sdateyymm7 == yymmdd2 && yymmdd2 < edateyymm7) {
						                            for (var k = 1; k < 25; k++) {
						                                if (sdatetime7 <= k) {
						                                    $('select[name=valueB] option[value="' + k + '"]').attr('disabled', 'disabled');
						                                }
						                            }
						                        } else if (sdateyymm7 < yymmdd2 && yymmdd2 == edateyymm7) {
						                            for (var k = 1; k < 25; k++) {
						                                $('select[name=valueB] option[value="' + k + '"]').attr('disabled', 'disabled');
						                            }
						                        } else if (sdateyymm7 < yymmdd2 && yymmdd2 < edateyymm7) {
						                            for (var k = 1; k < 25; k++) {
						                                $('select[name=valueB] option[value="' + k + '"]').attr('disabled', 'disabled');
						                            }
						                        } else if (sdateyymm7 < yymmdd2 && edateyymm7 < yymmdd2) {
						                            if (yymmdd1 < sdateyymm7) {
						                                for (var k = 1; k < 25; k++) {
						                                    $('select[name=valueB] option[value="' + k + '"]').attr('disabled', 'disabled');
						                                }
						                            }
						                        }
						                    }
						                } // 두 번째 value A document 함수의 for 구문 끝
						            }); /// valueA 클릭 스크립트
						
						            var html = template(json.itemBook[i]);
						            $("#book_list").append(html);
						
						            var html = template(json.itemBook[i]);
						            $("#book_list").append(html);
						            // $("#comment_form").trigger('reset');
						        } // 전체 for문
						    },
						    error: function() {
						        alert(json.rt);
						    }
						}); // 시간 ajax 끝
					});//fff 클릭 끝
				})
			</script>


			<script type="text/javascript">
				window.onload = function() {
				    // 다중 마커와 인포윈도우 표시    
				    $.ajax({
				        type: 'post',
				        url: "${pageContext.request.contextPath}/book1.do",
				        dataType: "json",
				        success: function aa(json) {
				            // 지도의 중심
				            var position = new daum.maps.LatLng(37.501205, 127.026512);
				            // 기본 지도 표시
				            var map = new daum.maps.Map(document.getElementById('map'), {
				                center: position,
				                level: 5,
				                mapTypeId: daum.maps.MapTypeId.ROADMAP
				            });
	
				            // 지도 콘트론 표시
				            var zoomControl = new daum.maps.ZoomControl();
				            map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
				            var mapTypeControl = new daum.maps.MapTypeControl();
				            map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
	
				            var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
	
				            for (var i = 0; i < json.item.length; i++) {
				                // 마커 이미지의 이미지 크기 입니다
				                var imageSize = new daum.maps.Size(24, 35);
				                // 마커 이미지를 생성합니다    
				                var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
				                // 마커를 생성합니다
				                var marker = new daum.maps.Marker({
				                    map: map, // 마커를 표시할 지도
				                    position: new daum.maps.LatLng(json.item[i].zoneLat, json.item[i].zoneLng), // 마커를 표시할 위치
				                    title: json.item[i].zoneName, // 마커의 타이틀
				                    image: markerImage // 마커 이미지 
				                });
	
				                // 마커를 클릭했을 때 표시할 인포윈도우 생성
				                var iwContent = 
				                    '<div class="container" style="width: 300px"><div>' +
				                    '<h4>' +
				                    '<em style="display:none;">' + json.item[i].num + '</em>' +
				                    '<span title="' + json.item[i].zoneName + '">' + json.item[i].zoneName + '</span><span class="bg"></span>' +
				                    '</h4>' +
				                    '<p title="' + json.item[i].zoneAddr + '">' + json.item[i].zoneAddr + '</a><br />' +
				                    '<p>' +
				                    '<a class="btn btn-danger" id="zone_' + json.item[i].num + '" href="#">' +
				                    '예약하러 가기</a></p>' +
				                    '<input type="hidden" id="zone_name" name="zone_name" value="' + json.item[i].zoneName + '">' +
				                    '<input type="hidden" id="zoneLat" name="zoneLat" value="' + json.item[i].zoneLat + '">' +
				                    '<input type="hidden" id="zoneLng" name="zoneLng" value="' + json.item[i].zoneLng + '">' +
				                    '</div>';
	
				                iwRemoveable = true;
	
				                // 인포윈도우 생성
				                var infowindow = new daum.maps.InfoWindow({
				                    content: iwContent,
				                    removable: iwRemoveable
				                });
	
				                daum.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow));
	
				                var prev_infowindow = false;
	
				                function makeClickListener(map, marker, infowindow) {
				                    return function() {
				                        if (prev_infowindow) {
				                            prev_infowindow.close();
				                        }
	
				                        prev_infowindow = infowindow;
				                        infowindow.open(map, marker);
				                    };
				                }
				            }
	
				            // 인포창에서 예약하러가기 클릭시 검색에 값 전달       
				            $(document).on('click', 'a', function() {
				                $("#zonelist").val($("#zone_name").val());
				            });
	
				            // 마커 클릭시 지도 움직임
				            $(document).on('click', 'map', function setCenter() {
				                var moveLatLon = new daum.maps.LatLng($("#zoneLat").val(), $("#zoneLng").val());
				                map.panTo(moveLatLon);
				            });
	
				            // 각 지역명 클릭시 각 지역의 중심좌표로 이동
				            $(document).on('click', '.regionlist', function(index) {
				                var moveLatLon;
				                switch ($(".regionlist").index(this)) {
				                    case 0: moveLatLon = new daum.maps.LatLng(37.498525, 127.027466); break; // 서울
				                    case 1: moveLatLon = new daum.maps.LatLng(37.454693, 126.709785); break; // 경기 인천
				                    case 2: moveLatLon = new daum.maps.LatLng(37.8813153, 127.729970); break; // 강원
				                    case 3: moveLatLon = new daum.maps.LatLng(36.3504119, 127.384547); break; // 대전 충청
				                    case 4: moveLatLon = new daum.maps.LatLng(35.8714354, 128.601445); break; // 대구 경북
				                    case 5: moveLatLon = new daum.maps.LatLng(35.1595454, 126.852601); break; // 광주 전라
				                    case 6: moveLatLon = new daum.maps.LatLng(35.1795543, 129.075641); break; // 부산 경남
				                    case 7: moveLatLon = new daum.maps.LatLng(33.4890113, 126.498302); break; // 제주
				                    default: alert("지역을 다시 선택해주세요.");
				                }
				                map.panTo(moveLatLon);
				            });
	
				            $('#abc').click(function() {
				                setTimeout(function() {
				                    var moveLatLon = new daum.maps.LatLng($("#lat").val(), $("#lng").val());
				                    map.panTo(moveLatLon);
				                }, 100);
				            });
				        },
				        error: function() {
				            alert("book1 ajax에러 발생");
				        }
				    });
				};
			</script>


			<script type="text/javascript">
				$(function() {
				    $(document).on('click', "#abc", function(e) {
				        var a = $("#zonelist").val();
				        $.ajax({
				            type: 'post',
				            url: "${pageContext.request.contextPath}/book2.do",
				            dataType: "json",
				            data: {
				                zonelist: a
				            },
				            success: function(json) {
				                // 템플릿 HTML을 로드한다.
				                var template = Handlebars.compile($("#tmpl_comment_item").html());
				                // 지우고 다시 뿌림
				                $("#zone_list").html("");
				                for (var i = 0; i < json.item.length; i++) {
				                    $("#comment_list").html("");
				                    if (json.item.length == 0) {
				                        var html = "<tr><td colspan='6' class='text-center'>존에 소속된 차량이 없습니다.<br>다른존은 이용해 주세요.</td></tr>";
				                        $("#comment_list").append(html);
				                    }
				                    if (a == "" || a == null) {
				                        alert("존을 선택해주세요.");
				                        return false;
				                    }
				                    for (var i = 0; i < json.item.length; i++) {
				                        var html = template(json.item[i]);
				                        $("#zone_list").append(html);
				                        var lat = json.item[i].zoneLat;
				                        var lng = json.item[i].zoneLng;
				                        $("#lat").val(lat);
				                        $("#lng").val(lng);
				                    }
				                }
				            },
				            error: function() {
				                alert(json.rt);
				            }
				        });
				    });
	
				    $("#zonelist").autocomplete({
				        source: function(request, response) {
				            $.ajax({
				                type: 'post',
				                url: "${pageContext.request.contextPath}/book1.do",
				                dataType: "json",
				                data: {
				                    term: request.term
				                },
				                success: function(data) {
				                    response($.map(data.item, function(json) {
				                        var zonelistval = $("#zonelist").val();
				                        // filtering results
				                        if (json.zoneName.indexOf(zonelistval) != -1) {
				                            return {
				                                label: json.zoneName,
				                                value: json.zoneName
				                            };
				                        }
				                    }));
				                },
				                error: function(data) {
				                    alert("자동완성 ajax에러 발생");
				                }
				            });
				        },
				        focus: function(event, ui) {
				            return false;
				        }
				    });
				});
			</script>


			<!-- 지도 담을 영역 -->
			<div id="mapbox" class="col-sm-12">
				<div id="map" style="width: 100%; height: 600px;"></div>
			</div>

			<!-- 동적으로 생성될 태그 -->
			<div class="col-sm-12">
				<form>
					<div class="form-group">
						<div class="col-sm-3">
							<p>
								대여일: <input readonly class="" type="text" id="Datepicker1" name="Datepicker1" placeholder="날짜를 선택하세요." >
							</p>
						</div>

						<div class="col-sm-3">
							<p>
								반납일: <input readonly class="" type="text" id="Datepicker2" name="Datepicker2" placeholder="날짜를 선택하세요.">
							</p>
						</div>

					</div>
				</form>

				<div class="table" id="go">
					<table class="table">
						<thead>
							<tr>
								<th>이미지</th>
								<th>차 이름</th>
								<th>차 종류</th>
								<th>차 가격</th>
								<th>존 위치</th>
							</tr>
						</thead>
						<tbody id="zone_list">
							<tr>
								<td colspan="5" class="text-center">존을 선택하시면 차를 볼수 있습니다</td>
							</tr>
						</tbody>
					</table>
				</div>

				<!-- 예약 정보 -->
				<div id="book_list"></div>
				<input type="hidden" id="car_id" name="car_id">
			</div>
			
			<div id="test"></div>
			
<script id="tmpl_comment_item" type="text/x-handlebars-template">
			<tr>
				<td><img style="width:60px; height: 40px;" src="${pageContext.request.contextPath}/download.do?file={{carImg}}" /></td>
				<td>{{carName}}</td>
				<td>{{carKind}}</td>
				<td>{{carPay}}</td>
				<td>{{zoneName}}</td>
				<td>
					<a data-toggle="modal" href="#timeModal">
					<input class="fff" value="{{id}}" type="image" src="img/carcar.png" style="height: 37px; width: 104px; vertical-align: middle;">
					</a>
				</td>	
			</tr>
			<input type="hidden" id="lat" />
			<input type="hidden" id="lng" />
</script>


<script id="tmpl_book_item" type="text/x-handlebars-template">
		<input type="hidden" id="ggg" value="{{carId}}">
</script>

<script type="text/javascript">
		function setdisa(dival) {
			if (!(dival == "choice1")) {
				document.getElementById("valueB").disabled = false;
			}
		}
</script>

<script id="tmpl_time_item" type="text/x-handlebars-template">
<hr>
</script>

		</div>
		<!-- contain 끝-->
	</div>
	<!--main 끝-->


	<script type="text/javascript">
		$(function() {
			$(document).on('click', ".car", function(e) {
				$.ajax({
					type : 'post',
					url : "${pageContext.request.contextPath}/book3.do",
					dataType : "json",
					success : function(json) {
						for (var i = 0; i < json.item.length; i++) {
							json.item[i].startDate
							json.item[i].endDate
						}
					},
					error : function() {
						alert(json.rt);
					}
				})
			});
		})
	</script>
	
		<hr>

		<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

	<!-- 모달 -->
	<div id="timeModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">제목</h4>
				</div>
				<!-- 내용 -->
				<div class="modal-body">
					<form id="timeModalForm" action="${pageContext.request.contextPath }/book_insert.do">
						<input type="hidden" name="startDate" id="startDate"> <input type="hidden" name="endDate" id="endDate"> <input type="hidden" name="carId" id="carId" value="{{carId}}">
						<div class="col-sm-6">

							대여시간:
							<select name="valueA" class="valueA" onchange="setdisa(this.value);">
								<option value="choice1" selected="selected">선택하세요</option>
								<option value="1">1:00</option>
								<option value="2">2:00</option>
								<option value="3">3:00</option>
								<option value="4">4:00</option>
								<option value="5">5:00</option>
								<option value="6">6:00</option>
								<option value="7">7:00</option>
								<option value="8">8:00</option>
								<option value="9">9:00</option>
								<option value="10">10:00</option>
								<option value="11">11:00</option>
								<option value="12">12:00</option>
								<option value="13">13:00</option>
								<option value="14">14:00</option>
								<option value="15">15:00</option>
								<option value="16">16:00</option>
								<option value="17">17:00</option>
								<option value="18">18:00</option>
								<option value="19">19:00</option>
								<option value="20">20:00</option>
								<option value="21">21:00</option>
								<option value="22">22:00</option>
								<option value="23">23:00</option>
								<option value="24">24:00</option>
							</select>

						</div>
						<div class="col-sm-6">

							반납시간:
							<select name="valueB" id="valueB" disabled="disabled">
								<option value="choice2" selected="selected">선택하세요</option>
								<option value="1">1:00</option>
								<option value="2">2:00</option>
								<option value="3">3:00</option>
								<option value="4">4:00</option>
								<option value="5">5:00</option>
								<option value="6">6:00</option>
								<option value="7">7:00</option>
								<option value="8">8:00</option>
								<option value="9">9:00</option>
								<option value="10">10:00</option>
								<option value="11">11:00</option>
								<option value="12">12:00</option>
								<option value="13">13:00</option>
								<option value="14">14:00</option>
								<option value="15">15:00</option>
								<option value="16">16:00</option>
								<option value="17">17:00</option>
								<option value="18">18:00</option>
								<option value="19">19:00</option>
								<option value="20">20:00</option>
								<option value="21">21:00</option>
								<option value="22">22:00</option>
								<option value="23">23:00</option>
								<option value="24">24:00</option>
							</select>

						</div>
						<br>
						<br>
						<br>
						<br>
						<div>
							<button id="kkk" type="submit" class="btn btn-success btn-block">예약하기</button>
						</div>
					</form>
				</div>


				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>


			</div>

		</div>
	</div>

<script type="text/javascript">
	$(document).on('click', '.fff', function () {
		$("#timeModalForm")[0].reset();
	})
</script>
	
</body>
</html>
