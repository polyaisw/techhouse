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
			}

		}