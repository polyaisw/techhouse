drop database if exists techhouse;
create database techhouse;
use techhouse;

-- 이미지 업로드는 후에 다시 수정할 필요가 있음... 

-- ***테이블중 가격부분은 문자열형 (varchar100) 이므로 스프링 내에서 형변환해서 사용하기


-- 9/29~
-- user테이블에 보유한 응모권 수 `ticket` INT NULL default 0, 추가

-- 10/5~
-- user테이블 address 추가
-- board테이블 `b_commentcount` int형으로 변경
-- board테이블 `b_title` varchar(100) not null 추가
-- trade테이블 `t_title` varchar(100) not null 추가
-- qna테이블 `q_title` varchar(100) not null, 추가
-- qna테이블 `q_text` text not null, 추가

-- 10/7~
-- apply테이블 속성중 not null인 부분들 null로 수정

CREATE TABLE `techhouse`.`user` (
  `email` VARCHAR(100) NOT NULL,	-- ID 겸 이메일 
  `password` VARCHAR(45) NOT NULL,	
  `name` VARCHAR(45) NOT NULL,		-- 닉네임
  `point` INT NULL,					-- 포인트 > 응모권구매가능
  `rank` VARCHAR(45) NOT NULL,		-- 회원등급, 기준은 미정, 관리자도 여기에
  `blacklist` INT NOT NULL,			-- 0 : 일반유저 1 : 밴당한 유저 (동일 휴대폰 번호로 가입 불가 / 아이디 로그인 불가 / 게시글 전부 삭제)
  `profileimg` VARCHAR(45) NULL,		
  `tel` VARCHAR(45) NOT NULL,		-- 연락처
   `address` varchar(100) null,
   `ticket` INT NULL default 0,		-- 유저가 보유한 응모권 수
  PRIMARY KEY (`email`));


CREATE TABLE `techhouse`.`board` (						-- 게시판	
  `b_seq` INT NOT NULL auto_increment,					-- 게시판id
  `b_title` varchar(100) not null,
  `b_writer` VARCHAR(45) NOT NULL,						-- 게시자
  `b_views` INT NOT NULL default 0,						-- 조회수
  `b_recommed` INT NOT NULL default 0,					-- 추천수
  `b_commentcount` int(45) NOT NULL default 0,			-- 리뷰수
  `b_text` TEXT NULL,									-- 내용
  `b_uploadimg` VARCHAR(45),							-- 업로드 이미지
  `b_category` VARCHAR(45) NOT NULL,					-- 게시판 카테고리
  `b_date` DATE NOT NULL default (current_date),		-- 게시날짜
	PRIMARY KEY (`b_seq`));

ALTER TABLE board AUTO_INCREMENT=10001;

CREATE TABLE `techhouse`.`trade` (						-- 중고거래게시판	
  `t_seq` INT NOT NULL auto_increment,					-- id
  `t_title` varchar(100) not null,
  `t_writer` VARCHAR(45) NOT NULL,						-- 게시자
  `t_prodname` VARCHAR(100) NOT NULL,					-- 판매 상품 명
  `t_price` VARCHAR(100) NULL default 0,				-- 상품 가격		
  `t_state` INT NOT NULL default 0,						-- 상태 	0 : 판매중, 1 : 거래중(안심거래에서 입금 완료 시), 2 : 거래완료
  `t_views` INT NOT NULL default 0,						-- 조회수
  `t_text` TEXT NULL,									-- 내용
  `t_uploadimg` VARCHAR(45),							-- 업로드 이미지
  `t_category` VARCHAR(45) NOT NULL,					-- 게시판 카테고리
  `t_date` DATE NOT NULL default (current_date),		-- 게시날짜
  PRIMARY KEY (`t_seq`));

ALTER TABLE trade AUTO_INCREMENT=1;


CREATE TABLE `techhouse`.`apply` (
  `a_seq` INT NOT NULL auto_increment,
  `a_productName` VARCHAR(100) NOT NULL,								-- 응모상품명
  `a_applyemail` VARCHAR(100)  NULL,									-- 응모자 이메일
  `a_applyname` VARCHAR(45)  NULL,									-- 응모자 닉네임
  `a_price` VARCHAR(100) NULL default 0,								-- 원래상품가격		
  `a_selectedEmail` VARCHAR(100)  NULL,  							-- 당첨자 이메일
  `a_selectedname` VARCHAR(45)  NULL,  								-- 당첨자 닉네임
  `a_selectedTel` VARCHAR(45)  NULL,									-- 당첨자 연락처
  `a_date` date not null default (current_date),						-- 등록시간 (service층에서 타이머만들어 계산하기)
  PRIMARY KEY (`a_seq`));
  
ALTER TABLE apply AUTO_INCREMENT=20001;
  
  
  
CREATE TABLE `techhouse`.`qna` (							-- 1:1 qna게시판
  `q_seq` INT NOT NULL auto_increment,		
  `q_title` varchar(100) not null,
  `q_writer` VARCHAR(45) NOT NULL,							-- 게시자닉네임 / 관리자인경우 닉네임이 아닌 관리자
  `q_text` text not null,
  `q_complete` INT NOT NULL default 0,						-- 답변 0 : 답변 미완료, 1 : 답변 완료
  `q_writetype` INT NOT NULL,								-- 0 : 질문글, 1 : 관리자가 작성한 글
  `q_uploadimg` VARCHAR(45) NULL,							-- 업로드 이미지 
  `q_boardseq` INT NOT NULL,								-- 질문에 해당하는 게시판ID
  `q_date` DATE NOT NULL default (current_date),			-- 게시 날짜
  PRIMARY KEY (`q_seq`));

ALTER TABLE qna AUTO_INCREMENT=30001;



CREATE TABLE `techhouse`.`comments` (					-- 댓글
  `c_seq` INT NOT NULL auto_increment,					
  `c_writer` VARCHAR(100) NOT NULL,						-- 댓글 게시자
  `c_text` TEXT NULL,									
  `c_category` VARCHAR(45) NULL,						-- 댓글 게시판 카테고리
  `c_boardseq` INT NOT NULL,							-- 댓글 작성판 게시판 id
  `c_date` DATE NOT NULL default (current_date),		
  PRIMARY KEY (`c_seq`));
  
  
CREATE TABLE `techhouse`.`sellList` (					-- 판매한 중고거래 기록 
	`sl_seq` INT NOT NULL auto_increment,
    `sl_buyerName` VARCHAR(45),							-- 구매자 명
    `sl_sellBoardSeq`	INT NOT NULL,					-- 판매한 중고거래 게시글 ID     = trade테이블의 t_seq
	`sl_sellProdName` VARCHAR(100),						-- 판매 상품 명
    `sl_sellPrice`	VARCHAR(100),						-- 판매 가격
    `sl_type`	INT NOT NULL,							-- 거래타입 종류 0 : 일반거래 1 : 안심거래
    `sl_date`	date not null default (current_date),
	PRIMARY KEY (`sl_seq`));
    
    
CREATE TABLE `techhouse`.`buylist` (					-- 구마한 중고거래 기록 
	`bl_seq` INT NOT NULL auto_increment,
    `bl_sellerName` VARCHAR(45),						-- 판매자 명
    `bl_buyBoardSeq`	INT NOT NULL,					-- 구매한 게시글 ID
    `bl_state`		INT NOT NULL,						-- 구매한 상품 상태 	0 : 구매완료버튼 and 취소버튼 활성화 (여기서 구매완료를 누르면 판매자에게 입금되게끔하기)	30일 지나면 자동으로 구매완료가 되게끔하기
														-- 						안심거래를 이용하지 않았다면 안심거래 테이블에 0원이 들어오기 때문에 버튼을 누르든 안누르든 무관하다.
														-- 					1 :	취소된 거래
														-- 					2 : 거래완료..
																			
	`bl_buyProdName` VARCHAR(100),						-- 구매 상품 명
    `bl_buyPrice`	VARCHAR(100),						-- 구매 가격
	`bl_type`	INT NOT NULL,							-- 0 : 일반거래 1 : 안심거래
    `bl_date`	date not null default (current_date),
	PRIMARY KEY (`bl_seq`));
    

CREATE TABLE `techhouse`.`ansim` (
	`an_seq` INT NOT NULL auto_increment,
    `an_buyerName`	VARCHAR(45) NOT NULL,			-- 구매자 닉네임
    `an_buyerEmail`	 VARCHAR(100) NOT NULL,			-- 구매자 이메일
    `an_buyerTel`	VARCHAR(45) NOT NULL,			-- 구매자 연락처
    `an_payedmomey` VARCHAR(100) NOT NULL,						-- 결제한 금액
	`an_sellerName`	VARCHAR(45) NOT NULL,			-- 판매자 닉네임
    `an_sellerEmail` VARCHAR(100) NOT NULL,			-- 판매자 이메일
    `an_sellerTel`	VARCHAR(45) NOT NULL,			-- 판매자 연락처
    `an_tradeSeq`	INT NOT NULL,								-- 거래중인 게시글 아이디
    `an_date`	date not null default (current_date),
    PRIMARY KEY(`an_seq`));

-- ----------------------------------------------insert-----------------------------------------------------------


insert into board(b_writer, b_title, b_views, b_recommed, b_commentcount, b_text, b_uploadimg, b_category) values("b_writer","b_title",35,15,2,"b_text","b_uploadimg","b_category");
insert into board(b_writer, b_title, b_views, b_recommed, b_commentcount, b_text, b_uploadimg, b_category) values("b_writer","b_title",22,99,5,"b_text","b_uploadimg","b_category");

insert into apply(a_productName, a_applyEmail, a_applyName, a_price, a_selectedEmail, a_selectedname, a_selectedTel) values("a_productName","a_applyEmail","a_applyName","a_price","a_selectedEmail", "a_selectedname","a_selectedTel");
insert into apply(a_productName, a_applyEmail, a_applyName, a_price, a_selectedEmail, a_selectedname, a_selectedTel) values("a_productName","a_applyEmail","a_applyName", "a_price","a_selectedEmail","a_selectedname","a_selectedTel");

insert into comments(c_writer, c_text, c_category, c_boardSeq) values("c_writer","c_text","c_category",10001);
insert into comments(c_writer, c_text, c_category, c_boardSeq) values("c_writer","c_text","c_category",10002);

insert into qna(q_title,q_writer,q_text, q_complete, q_writetype, q_uploadimg, q_boardseq) values("q_title","q_writer","q_text",0,0,"q_uploadimg",10001);
insert into qna(q_title,q_writer,q_text, q_complete, q_writetype, q_uploadimg, q_boardseq) values("q_title","q_writer","q_text",1,1,"q_uploadimg",10002);

insert into trade(t_writer, t_title, t_prodname, t_price, t_state, t_views, t_text, t_uploadimg, t_category) values("t_writer", "t_title", "t_prodname","t_price",0,0,"t_text","t_uploadimg","t_category");
insert into trade(t_writer, t_title, t_prodname, t_price, t_state, t_views, t_text, t_uploadimg, t_category) values("t_writer", "t_title", "t_prodname","t_price",1,1,"t_text","t_uploadimg","t_category");
insert into trade(t_writer, t_title, t_prodname, t_price, t_state, t_views, t_text, t_uploadimg, t_category) values("t_writer", "t_title", "t_prodname","t_price",2,2,"t_text","t_uploadimg","t_category");

insert into selllist(sl_buyerName, sl_sellBoardSeq, sl_sellProdName, sl_type, sl_sellPrice) values("sl_buyerName",1,"sl_selProdName", 0, "sl_selPrice");	-- 일반거래
insert into selllist(sl_buyerName, sl_sellBoardSeq, sl_sellProdName, sl_type, sl_sellPrice) values("sl_buyerName",2,"sl_selProdName", 1, "sl_selPrice");  -- 안심거래

insert into buylist(bl_sellerName, bl_buyBoardSeq, bl_state, bl_buyProdName, bl_type, bl_buyPrice) values("bl_sellerName",1,0,"bl_buyProdName",0,"bl_buyPrice"); -- 거래중, 일반거래
insert into buylist(bl_sellerName, bl_buyBoardSeq, bl_state, bl_buyProdName, bl_type, bl_buyPrice) values("bl_sellerName",2,1,"bl_buyProdName",1,"bl_buyPrice"); -- 취소된거래, 안심거래
insert into buylist(bl_sellerName, bl_buyBoardSeq, bl_state, bl_buyProdName, bl_type, bl_buyPrice) values("bl_sellerName",3,2,"bl_buyProdName",1,"bl_buyPrice"); -- 거래완료

insert into ansim values(0,"an_buyerName","an_buyerEmail","an_buyerTel","10000","an_sellerName","an_sellerEmail","an_sellerTel",1,current_date());
insert into ansim values(0,"an_buyerName","an_buyerEmail","an_buyerTel","500000","an_sellerName","an_sellerEmail","an_sellerTel",2,current_date());
