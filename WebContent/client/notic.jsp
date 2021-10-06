<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
        .case {
            position: absolute;
            width: 700px;
            height: 30px;
            overflow: hidden;
            left: 800px;
            top: 150px;
        }
        .case .part1 {
            float: left;
            width: 5%;
            height: 30px;
        }
        .case .part1 img {
            width: 20px;
            height: 20px;
            float: right;
            margin-top: 5px;
        }
        .case .part2 {
            float: left;
            width: 93%;
            height: 30px;
            text-indent: 1em;
            overflow: hidden;
        }
        #part2 ul {
            width: 100%;
            height: auto;
            list-style: none;
            padding: 0;
            margin: 0;
        }
        #part2 ul li {
            width: 100%;
            height: 30px;
            font-size: 16px;
            line-height: 30px;
            color: #575757;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
</style>


<div class="case">
      <div class="part1">
          <img src="${pageContext.request.contextPath }/client/images/notic.webp">
      </div>
      <div class="part2" id="part2">
          <div id="scrol1">
              <ul>
                  <li>特价玩偶<a href="${pageContext.request.contextPath }/findProductById?id=1">去购买</a></li>
                  <li>新店盛大开业，正品自营<a href="${pageContext.request.contextPath}/showProductByPage?category=自营">去看看</a></li>
                  <li>而我希望，自己也可以在别人看不见的地方不动声色的努力，在关键时刻出其不意的傲娇绽放。</li>
                  <li><a href="${pageContext.request.contextPath }/client/addProduct.jsp">用户可以自己上传商品了，快来体验新功能吧！</a></li>
              </ul>
          </div>
          <div id="scrol2"></div>
      </div>
</div>
<script type="text/javascript">
    var PartArea = document.getElementById('part2');
    var Scroll1 = document.getElementById('scrol1');
    var Scroll2 = document.getElementById('scrol2');
    Scroll2.innerHTML = Scroll1.innerHTML;
    
    function roll() {
        if(Scroll2.offsetHeight - PartArea.scrollTop <= 0) {
            PartArea.scrollTop -= Scroll1.offsetHeight;
        } else {
            PartArea.scrollTop++;
        }
    }

    var StopRoll = setInterval(roll, 60);

    PartArea.onmouseover = function () {
        clearInterval(StopRoll);
    }
    PartArea.onmouseout = function () {
        StopRoll = setInterval(roll, 60);
    }
</script>
