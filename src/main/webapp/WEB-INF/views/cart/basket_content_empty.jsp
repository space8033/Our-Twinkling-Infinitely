<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<colgroup>
	<col width="50">
	<col width="80">
	<col width="*">
	<col width="90">
	<col width="90">
</colgroup>
   <thead>
     <tr class="head">
       <th scope="col" background-color: lightgray;">
       	<label>
       		
       	</label>
       </th>
       <th scope="col"><span></span></th>
       <th scope="colgroup">상품정보</th>
       <th scope="col">상품금액</th>
       <th scope="col">배송비</th>
       <th scope="col"></th>
     </tr>
   </thead>
   
   <div id="spinner_container">
     	
   </div>
   <tbody id ="basket_tbody">
    <!-- Json으로 불러오는 곳 -->
     <tr class="t2">
     	<td></td>
     	<td></td>
     	<td>
     		<p class="t2_nonMessage">장바구니에 담은 상품이 없습니다.</p>
     	</td>
     	<td></td>
     	<td></td>
   </tr>	
   </tbody>
     <tr class="t3" colspan="5">
        <td></td>
        <td></td>
        <td class="t3_td">
        	<div class="t3_td_contents">
        		<span class="t3_td_contents text-muted">장바구니에서 선택할 옵션을 선택하시고,</span>
	    	<span class="t3_td_contents text-primary">구매하기</span>
	    	<span class="t3_td_contents text-muted">버튼을 눌러보세요!</span>
        	</div>
    	<div class="t3_td_contents text-muted">선택한 옵션을 모두 장바구니에 담을 수 있습니다</div>
    	<div class="t3_td_button">
    		<button class="btn btn-primary">오늘의 추천 상품보기 ></button>
    	</div>
      </td>
     <td></td>
     <td></td>
     <td></td>
    </tr>