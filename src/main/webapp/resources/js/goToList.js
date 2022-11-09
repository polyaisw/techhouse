function goToList(value) {

			switch (value) {
			case '자유게시판':
				location.href="/board/community/free";
				break;
			case '인증게시판':
				location.href="/board/community/mysetting";
				break;
			case '취미공유':
				location.href="/board/community/hobby";
				break;
			case '거래게시판':
				location.href="/board/trade/tradeBoard";
				break;
			case '벤치마킹인증':
				location.href="/board/trade/mybench";
				break;
			case '거래후기':
				location.href="/board/trade/aftertrade";
				break;
			case 'IT/트렌드':
				location.href="/board/news/trend";
				break;
			case '핫이슈':
				location.href="/board/news/issue";
				break;
			case '게임출시정보':
				location.href="/board/news/gameInfo";
				break;
			case '꿀딜/장터':
				location.href="/board/news/hotDeal";
				break;
			case '사기피해신고':
				location.href="/board/center/report";
				break;
			case 'Qna':
				location.href="/admin/admin_qna";
				break;
			case '공지사항':
				window.history.back();
				break;
			}
		}
		
function setUrl(value) {

			switch (value) {
			case '자유게시판':
				url ="/board/community/free";
				return url;
			case '인증게시판':
				url ="/board/community/mysetting";
				return url;
			case '취미공유':
				url ="/board/community/hobby";
				return url;
			case '거래게시판':
				url ="/board/trade/tradeBoard";
				return url;
			case '벤치마킹인증':
				url ="/board/trade/mybench";
				return url;
			case '거래후기':
				url ="/board/trade/aftertrade";
				return url;
			case 'IT/트렌드':
				url ="/board/news/trend";
				return url;
			case '핫이슈':
				url ="/board/news/issue";
				return url;
			case '게임출시정보':
				url ="/board/news/gameInfo";
				return url;
			case '꿀딜/장터':
				url ="/board/news/hotDeal";
				return url;
			}
		}