<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
html, body, div, header, section, article, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, samp, small, strike, strong, sub, sup, tt, var, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, hr, figure {
    margin: 0;
    padding: 0;
    font-size: 100%;
    box-sizing: border-box;
    -o-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
 }
*, :after, :before {
    box-sizing: border-box;
    outline: 0;
}
body * {
    outline: none;
    box-sizing: border-box;
}
* {
    line-height: 1.3;
    word-break: keep-all;
    /* -webkit-user-select: none; */
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}
div {
    display: block;
}
.content {
    display: table;
    margin: 0 auto;
    width: 1200px;
}

.content>h2 {
	text-align: center;
	margin-top: 40px;
	color: #000;
    font-family: Futura,"Trebuchet MS",Arial,sans-serif;
    font-size: 23px;
    font-weight: 500;
    text-transform: uppercase;
}
.content aside {
    padding-right: 20px;
    width: 230px;
}
.content aside, .content main {
    vertical-align: top;
    display: table-cell;
    position: relative;
}
.content aside .block {
    margin-bottom: 25px;
}

.content aside .block h4 {
    color: #000;
    font-size: 15px;
    font-family: Roboto,"Malgun Gothic",sans-serif;
    font-weight: 700;
    margin-bottom: 15px;
    text-align: left;
}

h1, h2, h3, h4, h5, h6 {
    font-weight: normal;
    margin: 0;
    padding: 0;
}

h4 {
    display: block;
    margin-block-start: 1.33em;
    margin-block-end: 1.33em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
.submenuLink{
	text-dect
}
.content aside .block h4.selected a {
    border-bottom: 1px solid #000;
    padding-bottom: 1px;
}

.content aside .block h4 a {
    color: #000;
}

a {
    color: #444;
    text-decoration: none;
}

a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: underline;
}

main {
    font-family: "Nanum Barun Gothic", sans-serif !important;
    display: block;
}

.content aside, .content main {
    vertical-align: top;
    display: table-cell;
    position: relative;
}

h3.line_header {
    border-bottom: 2px solid #000;
    font-size: 19px;
    line-height: 21px;
    padding-bottom: 10px;
    color: #000;
}

h3 {
    display: block;
    font-size: 1.17em;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}

#customer_support main .container_explanation {
    margin-bottom: 50px;
}

.container_explanation {
    margin-top: 50px;
    margin-bottom: 125px;
}

dl {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

dt {
    display: block;
}

dd {
    display: block;
    margin-inline-start: 40px;
}
#customer_support main .container_explanation dt, #customer_support main .container_explanation dd {
    font-family: "Nanum Barun Gothic", sans-serif !important;
}

.container_explanation dt {
    padding-bottom: 15px;
    font-size: 34px;
    color: #1691ce;
    font-family: 'Nanum Square';
    font-weight: bold;
    line-height: 1;
}

.container_explanation dd, p.normal_stl {
    font-size: 14px;
    line-height: 20px;
    color: #000;
    font-family: Roboto,"Malgun Gothic",sans-serif;
}

.container_explanation .navbar_clone {
    position: fixed;
    z-index: 9999;
    top: 0;
    margin-top: 0;
}

.container_explanation .nav {
    display: flex;
    justify-content: space-between;
    margin-top: 50px;
    width: 970px;
    background-color: #fff;
}

ol, ul, li {
    list-style: none;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
.topMenuLi > a{
	text-decoration: none;
	color: black;
}
li {
    display: list-item;
    text-align: -webkit-match-parent;
}
.container_explanation .nav li a {
    display: block;
    border: 1px solid #ccc;
    color: #999;
    font-size: 13px;
    font-family: Roboto,"Malgun Gothic",sans-serif;
    line-height: 50px;
    text-align: center;
    width: 188px;
}
#customer_support main h4.line_header {
    font-family: "Nanum Square", sans-serif;
}
h4.line_header {
    border-bottom: 1px solid #7f7f7f;
    font-size: 16px;
    line-height: 18px;
    padding-bottom: 10px;
    color: #000;
    font-family: Roboto,"Malgun Gothic",sans-serif;
    letter-spacing: -1px;
    position: relative;
}
h4.line_header .btn_blueLine .arrow {
    display: inline-block;
    padding-right: 15px;
    position: relative;
}
.container_explanation dd.deep_gep, p.normal_stl, h4.line_header + p.normal_stl {
    padding-top: 20px;
}

.container_explanation dd, p.normal_stl {
    font-size: 14px;
    line-height: 20px;
    color: #000;
    font-family: Roboto,"Malgun Gothic",sans-serif;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

.bid_order {
    display: flex;
    justify-content: space-between;
    margin: 45px 0 48px 0;
}

.bid_order li {
    width: 182px;
    text-align: center;
    position: relative;
    padding-top: 136px;
    font-size: 15px;
    color: #0f7cb1;
    font-family: Roboto,"Malgun Gothic",sans-serif;
}

.bid_order li:after {
    position: absolute;
    display: block;
    content: "";
    width: 13px;
    height: 23px;
    right: -15px;
    top: 50px;
}

dl.box_gray {
    padding: 34px 220px 36px 33px;
}

.box_gray {
    background-color: #fafafa;
    border-bottom: 1px solid #eaeaea;
    margin-bottom: 125px;
}

dl.box_gray dt {
    font-size: 13px;
    line-height: 19px;
    color: #000;
    font-family: Roboto,"Malgun Gothic",sans-serif;
    font-weight: bold;
}

dl.box_gray dd {
    font-size: 13px;
    line-height: 19px;
    color: #000;
    font-family: Roboto,"Malgun Gothic",sans-serif;
}

div.box_gray {
    padding: 10px 25px 40px 25px;
    margin-top: 40px;
}

div.box_gray .blueTitle_list {
    padding: 0 0 0 50px;
    position: relative;
    margin-top: 20px;
}

.blueTitle_list dt {
    color: #1691ce;
    font-size: 22px;
    padding-top: 40px;
    line-height: 20px;
}

div.box_gray .blueTitle_list dd {
    padding-bottom: 110px;
}
div.box_gray .blueTitle_list dd p {
    position: absolute;
    left: 0;
    top: 10px;
}

div.box_gray .blueTitle_list dd + dt {
    padding-top: 55px;
    position: relative;
}

div.box_gray .blueTitle_list dd + dt:before {
    position: absolute;
    display: block;
    content: "";
    width: 920px;
    height: 1px;
    right: 0;
    top: 0;
}

div.box_gray .blueTitle_list dd .bid_auto {
    position: relative;
    text-indent: -9999px;
    color: transparent;
    height: 410px;
}

div.box_gray .blueTitle_list dd .bid_auto:after {
    position: absolute;
    display: block;
    content: "";
    width: 818px;
    height: 444px;
    left: -22px;
    top: 75px;
}

div.box_gray .blueTitle_list:after {
    position: absolute;
    display: block;
    content: "";
    width: 351px;
    height: 121px;
    right: 50px;
    top: 15px;
    background: url(../../img/bid_way01.png) no-repeat;
}
.indot_list li {
    padding-left: 10px;
    position: relative;
    font-size: 13px;
    line-height: 20px;
    color: #000;
    font-family: Roboto,"Malgun Gothic",sans-serif;
}
.indot_list li:before {
    position: absolute;
    display: block;
    content: "";
    width: 3px;
    height: 3px;
    left: 0;
    top: 50%;
    border-radius: 50%;
    background-color: #a4a4a4;
    margin-top: -2px;
}
h4.line_header .btn_blueLine {
    min-width: 191px;
    text-align: center;
    display: block;
    position: absolute;
    right: 0;
    top: -22px;
    border: 1px solid #9bd0eb;
    font-size: 12px;
    line-height: 40px;
    color: #1691ce;
    font-family: Roboto,"Malgun Gothic",sans-serif;
}
h4.line_header .btn_blueLine .arrow:after {
    position: absolute;
    display: block;
    content: "";
    width: 6px;
    height: 11px;
    right: 0;
    top: 50%;
    background: url(../../img/btn_arrow.png) no-repeat;
    -webkit-transform: translateY(-50%);
    -ms-transform: translateY(-50%);
    transform: translateY(-50%);
}
.blueTitle_list dd.strong {
    font-weight: bold;
}

.blueTitle_list dd {
    font-size: 13px;
    font-family: Roboto,"Malgun Gothic",sans-serif;
    position: relative;
    padding: 10px 0 0 22px;
    line-height: 20px;
}
.submenu > .submenuLink{
	color: gray;
	text-decoration : none;
}

</style>
</head>
<body id="customer_support" class="index">
	<div class="content">
	   <h2>경매 응찰</h2>
	   <aside>
	   		<div class="block">
	   			<h4 class="selected">
	   				
	   			</h4>
	   		</div>
	   		<div class="block">
	   			<h4 class="selected">
	   				
	   			</h4>
	   		</div>
	   </aside>
	   <main>
	   		<h3 class="line_header">경매 응찰</h3>
	   		<dl class="container_explanation">
	   			<dt>"온라인 경매"</dt>
	   			<dd>
                	옥션블루 서비스를 통해 보다 쉽게 온라인 경매에 참여하실 수 있습니다.<br/>
                    기존 경매보다 폭넓은 작가군과 트랜디한 아트 상품들을 합리적인  가격으로 만나 보실 수 있습니다.<br/>
                    별도의 이용료 없이 간단한 회원가입과 경매 전 본인인증만으로 참여 가능합니다.
                </dd>
                <dd>
                	<ul class="nav navbar_sticky">
                		<li>
                			<a href="#bid01" class="move_stitle">온라인 경매 참여 안내</a>
                		</li>
                		<li>
                			<a href="#bid02" class="move_stitle">응찰안내</a>
                		</li>
                		<li>
                			<a href="#bid03" class="move_stitle">낙찰안내</a>
                		</li>
                		<li>
                			<a href="#bid04" class="move_stitle">배송안내</a>
                		</li>
                		<li>
                			<a href="#bid05" class="move_stitle">결제</a>
                		</li>
                	</ul>
                </dd>
	   		</dl>
	   		<h4 class="line_header">
	   			<span id="bid01">온라인 경매 참여 안내</span>
	   		</h4>
	   		<p class="normal_stl">
                온라인 경매는 Auction blue(www.auctionbleu.com)사이트에서 참여 가능합니다.<br/>
                온라인 경매는 프리뷰 기간을 거쳐, 작품을 충분히 살펴 보신 후 경매에 참여하실 수 있습니다.<br/>
	   		</p>
	   		<ul class="bid_order">
	   			<li>
	   				<img src="resources/img/online_auction.PNG">
	   			</li>
	   		</ul>
	   		<dl class="box_gray">
	   			<dt>※ 프리뷰란?</dt>
	   			<dd>
                    프리뷰는 경매 출품작을 오프라인 전시장에서 미리 감상하고 작품의 상태를 확인할 수 있는 전시회입니다. 오프라인 현장에서 작품을 상세히 확인할 수 있고 자세한 설명을 들으실 수 있습니다. 당사는 경매물품을 있는 그대로 출품하며, 전시를 통해 작품의 실물을 확인하였음을 전제로 진행합니다. 따라서 경매 시작 전 프리뷰(PREVIEW) 기간 중 충분히 상태를 확인하신 후 응찰하시기 바랍니다.
	   				<br/>
                    프리뷰 일정은 해당 경매 서비스 페이지에서 별도로 공지합니다.
	   			</dd>
	   		</dl>
	   		<h4 class="line_header">
	   			<span id="bid02">응찰 방법 안내</span>
	   		</h4>
	   		<p class="normal_stl">
                응찰은 온라인 경매의 프리뷰 기간 부터 해당 경매 서비스 페이지에서 응찰 가능하며, 경매 마감 시간부터 ‘LOT’ 또는 ‘LOT 그룹별’ 순차적으로 마감됩니다. 
	   			<br/>
                경매 마감시간 30초 전에 응찰이 있을 경우, 자동으로 30초 연장됩니다. 
                <br/>
                ※ 온라인 경매 회자에 따라 마감 방법  및 위에 명시한  마감 시간이 다를 수 있으니 해당 경매의 서비스 안내를 참고하시기 바랍니다.)
	   		</p>
	   		<p class="normal_stl">
                ‘다음 응찰가’는 현재가를 기준으로 정해진 응찰 단위가  적용되어 보여집니다.(다음응찰가 = 현재가+응찰 단위)
                <br/>
                ‘응찰 단위’는 현재가를 기준으로 다르게 적용 됩니다.
                <br/>
                응찰은 ‘수동 응찰’과 ‘자동 응찰’ 중 선택하여 참여하실 수 있습니다.
	   		</p>
	   		<div class="box_gray">
	   			<dl class="blueTitle_list">
	   				<dt>1. 수동 응찰</dt>
	   				<dd>
	   					<p>
                            수동 응찰은 [응찰하기]를 클릭하여 다음 응찰가에 1회 응찰하게 됩니다.
	   					</p>
	   				</dd>
	   			</dl>
	   		</div>
	   		<h4 class="line_header">
	   			<span id="bid03">낙찰 안내</span>
	   		</h4>
	   		<p class="normal_stl">
                경매 시작 후 최고가를 응찰한 응찰자에게 경매작품이 낙찰되며, 동일한 금액의 응찰이 발생할 경우 서버시각에 따라 먼저 응찰금액을 입력하신 분에게 우선 순위가 주어집니다.
	   			<br/>
                응찰 시에는 응찰 단위 기준으로 금액이 상승하게 됩니다.
	   		</p>
	   		<p class="normal_stl">
                온라인 경매의 낙찰 우선순위는 1.자동응찰  2.수동응찰 순으로 순위가 주어집니다.
            </p>
            <dl class="blueTitle_list">
            	<dt>1. 낙찰 확인</dt>
            	<dd>
                    옥션블루 로그인 &gt; 마이페이지 &gt; 경매거래내역 &gt;낙찰내역에서 낙찰 금액 및 수수료를 확인 하실 수 있습니다. 
            		<em class="red_txt">낙찰자는 낙찰을 철회할 수 없습니다.</em>
            		<br/>
                    부득이 철회를 하는 경우에는 낙찰일로부터 7일 이내에 서면으로 철회의사를 통보하고, 위약벌로 낙찰가의 30%에 해당하는 금액을 낙찰일로부터 7일 이내에 납부하여야 합니다.
            	</dd>
            	<dt>2. 경매 구매 수수료</dt>
            	<dd>
            		구매 수수료는 기본 18%(부가세별도)이며, 각 경매의 특성 등에 따라 수수료는 변경될 수 있습니다. 
            		<br/>
                	자세한 내용은 각 경매별 안내 및 공지사항으로 알려드리오니 반드시 확인해 주시기 바랍니다.
            	</dd>
            	<dd>
            		<ul class="indot_list">
            			<li>낙찰가 :  경매시간이 종료되면서 최종 낙찰된 금액</li>
            			<li>구매가 :  낙찰가 + 구매수수료 + 부가가치세가 합산된 금액</li>
            		</ul>
            	</dd>
            </dl>
            <h4 class="line_header">
            	<span id="bid04">배송 안내</span>
            </h4>
            <p class="normal_stl">
                경매 후 7일 이내에 구매수수료 포함 최종결제금액을 입금하시면 무료로 배송해 드립니다.
                <br/>
                (도서산간지역 및 및 해외배송은 본인 부담입니다)
            </p>
            <p class="normal_stl">
                단 별도의 배송비 추가 안내가 있는 경우에는, 그 안내에 따라 배송비가 부과될 수도 있습니다.
            </p>
            <h4 class="line_header">
            	<span id="bid05">온라인 결제</span>
            	<a href="#" class="btn_blueLine">
            		<span class="arrow">낙찰 내역 바로가기</span>
            	</a>
            </h4>
            <p class="normal_stl">
                온라인 경매의 낙찰자는 로그인 후, 낙찰내역 확인과 결제(카드결제,무통장입금)를 진행해 주세요
            </p>
            <p class="normal_stl">
                낙찰자와 결제내역의 정확한 확인을 위해서  온라인 결제를 이용하시길 권장 합니다. 
                <br/>
                카드 결제 시 1회 당 300만원까지만 결제할 수 있습니다. 
                <br/>
                고가품에 대해서는 온라인 구매에 대한 카드사의 방침에 의해 불가능할 수도 있습니다.
            </p>
            <dl class="blueTitle_list">
            	<dt>1. 지정 은행 계정 송금</dt>
            	<dd>
                    옥션블루의 계좌로 별도 입금 가능합니다. 단 계좌입금시 입금 메모란에 실제 낙찰자의 이름을 명시해 주세요.
                    <br/>
                    입금자와 낙찰자의 이름이 일치하지 않을 경우, 입금확인이 어려울 수 있으며 이에 대한 불이익은 옥션블루에서 책임지지 않습니다.
            	</dd>
            	<dd class="strong">입금계좌 : 우리은행 1005-103-164201 ㈜서울옥션블루</dd>
            </dl>
	   </main>
	</div>
</body>
</html>
<%@ include file="footer.jsp" %>   