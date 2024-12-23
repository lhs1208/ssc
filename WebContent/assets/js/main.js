	<!--탭 메뉴 스크립트 -->
	$(function() {
		/** 탭 페이지가 보여질 경우의 이벤트 */
		// 탭 안의 모든 <a>태그에 대한 이벤트 -->  모든 탭 페이지가 열릴 때 이 이벤트가 호출됨
		$('#mytab a').on('shown.bs.tab', function (e) {
			// data-deptno 속성의 값을 취득한다.
			var current_deptno = $(this).data("deptno");
			
			// Ajax요청을 통한 학과 데이터 조회
			$.get('dept_item.do', {deptno: current_deptno}, function(json) {
				var h = $("<h3>").html(json.dname);
				var p1 = $("<p>").html(json.loc);
				var p2 = $("<p>").html(json.loc);
				// #dept 내의 모든 내용을 지우고, 준비한 요소들을 추가한다.
				$("#dept").empty().append(h).append(p1).append(p2);
			});
		});

		/** 첫 번째 링크에 연결된 탭 페이지 표시하기 */
		// 이벤트가 적용된 후의 처리이므로 탭이 표시되면서 미리 정의한 이벤트가 호출된다.
		$("#mytab a:eq(0)").tab('show');
	});
	
	$(function() {
		// 로딩이미지를 표시하기 위한 div를 jquery로 추가하기
		var loader = $("<div>").addClass('ajax-loader');
		loader.hide();
		$("body").prepend(loader);

		$.ajaxSetup( {
			/** ajax 기본 옵션 */
			cache: false,			// 캐쉬 사용 금지 처리
			dataType: 'json',		// 읽어올 내용 형식 (html,xml,json)
			timeout: 30000,			// 타임아웃 (30초)

			// 통신 시작전 실행할 기능 (ex: 로딩바 표시)
			beforeSend: function() {
				// 현재 통신중인 대상 페이지를 로그로 출력함
				console.log(">> Ajax 통신 시작 >> " + this.url);
				loader.show();
			},
			// 통신 실패시 호출될 함수 (파라미터는 에러내용)
			error: function(error) {
				// 404 -> Page Not Found
				// 50x -> Server Error(웹 프로그램 에러)
				// 200, 0 -> 내용의 형식 에러(JSON,XML)
				console.log(">> 에러!!!! >> " + error.status);

				var error_msg = "[" + error.status + "] " + error.statusText;

				var code = parseInt(error.status / 100);
	            if (code == 4) {	// 400번대의 에러인 경우
	                error_msg = "잘못된 요청입니다.\n" + error_msg;
	            } else if (code == 5) {
	                error_msg = "서버의 응답이 없습니다.\n" + error_msg;
	            } else if (code == 2 || code == 0) {
	            	error_msg = "서버의 응답이 잘못되었습니다.\n" + error_msg;
	            }
	            
	            alert(error_msg);
			},
			// 성공,실패에 상관 없이 맨 마지막에 무조건 호출됨 ex) 로딩바 닫기
			complete: function() {
				console.log(">> Ajax 통신 종료!!!!");
				loader.hide();
			}
		} );
	});


	// HTML 특수문자를 원래의 구문으로 되돌리는 함수.
	function htmlspecialchar_decode(content) {
		// 임의의 HTML 태그를 생성하여 내용을 출력시킨다.
		// --> append 등의 출력 처리를 하지 않았으므로 화면에 표시되지는 않는
		var div = $("<div>").html(content);
		// 브라우저에 표시될 내용을 리턴한다.
		return div.text();
	}