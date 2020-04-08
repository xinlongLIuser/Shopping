<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>唯品会</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/frontindex.css">
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/popup.css">
    <script type="text/javascript" src="<%=path%>/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#wenzi").html("${SessionUser.username}");
            //购物车跳转
            $(".right_gouwu").click(function () {
                $(location).attr("href","<%=path%>/jsp/front/shopcart.jsp");
            })
            //购物袋数量
            $(".productItems").html("${fn:length(cartList.cartItems)}");

        })
    </script>
</head>
<input type="hidden" id="path" value="<%=path%>">
<body>
    <!-- 右侧列表 -->
    <div class="big_right">
        <div class="right_gouwu">
        </div>
        <div class="right_d1"><a href="#">¤</a>
            <div class="d1_erji1">
                <h2>我的资产</h2>
            </div>
        </div>
        <div class="right_d2">
            <a href="#">♡</a>
            <div class="d1_erji1">
                <h2>我的收藏</h2>
            </div>
        </div>
        <div class="right_d3">
            <a href="#">☺</a>
            <div class="d1_erji1">
                <h2>我喜欢的</h2>
            </div>
        </div>
        <div class="right_d4">
            <a href="#">۞</a>
            <div class="d1_erji1">
                <h2>我要充值</h2>
            </div>
        </div>
        <div class="right_d5">
            <a href="#">✉</a>
            <div class="d1_erji1">
                <h2>用户反馈</h2>
            </div>
        </div>
        <div class="right_d6">
            <a href="#">㊤</a>
            <div class="d1_erji1">
                <h2>返回顶部</h2>
            </div>
        </div>
    </div>
    <header>

        <div class="weizhi" id="wenzi">
            请您登录
            <div class="shou">☟</div>
            <div class="erji1">
                <div class="erji1_tu">
                    <img src="<%=path%>/images/front/20.jpg">
                </div>
                <div class="hai">hai!@我是唯品会
                </div>
                <form action="<%=path%>/UserLogin">
                    <input type="text" class="i1" name="username" id ="username" placeholder="请输入您的账号">
                    <input type="text" class="i3" name="password" id="password" placeholder="请输入您的密码">
                    <input type="button" id="login"
                           class="i2" name="" value="登录">
                </form>
            </div>
        </div>
        <!-- 导航 -->
        <div class="daohang">
            <ul>
                <c:choose>
                    <c:when test="${empty SessionUser}">
                        <li><a href="${path}/jsp/front/login.jsp">登录</a></li>
                        <li><a href="${path}/jsp/front/register.jsp">注册</a></li>
                        <li><a href="${path}/jsp/front/shopcart.jsp">购物车</a></li>
                    </c:when>
                    <c:otherwise>
                        你好,${SessionUser.username},<a href="${pageContext.request.contextPath }/user/logout.action">退出</a>
                        <li><a href="${pageContext.request.contextPath}/orders/myOrder.action">我的订单</a></li>
                    </c:otherwise>
                </c:choose>
                <li class="l2"><a href="#"><img src="<%=path%>/images/front/gift.gif"> 签到有礼</a>
                    <div class="erji2">
                        <div class="erji2_1">
                            <img src="<%=path%>/images/front/days.png">
                        </div>

                        <div class="qiandao">
                            <a href="#">
                                每天签到送惊喜，连续签到更享优惠礼品
                            </a>
                        </div>
                        <form>
                            <input type="submit" name="" value="签到">
                        </form>
                    </div>
                </li>
                <li class="l3"><a href="#">我的订单&nbsp;&nbsp; /</a></li>
                <li class="l4"><a href="#">我的特卖▼</a>
                    <div class="erji3">
                        <div class="erji3_div1">
                            <a href="#">品牌收藏(0)</a></div>
                        <div class="erji3_div2"><a href="#">商品收藏(0)</a></div>
                        <div class="erji3_div3"><a href="#">我的足迹(0)</a></div>

                    </div>
                </li>
                <li class="l5"><a href="#">会员俱乐部▼</a>
                    <div class="erji4">
                        <div class="erji4_div1">
                            <a href="#">俱乐部首页</a></div>
                        <div class="erji4_div2"><a href="#">唯品会兑换</a></div>
                        <div class="erji4_div3"><a href="#">免费抽大奖</a></div>
                    </div>
                </li>
                <li class="l6"><a href="#">客户服务&nbsp;&nbsp;▼</a>
                    <div class="erji5">
                        <div class="erji5_div1">
                            <a href="#">联系客服</a></div>
                        <div class="erji5_div2"><a href="#">帮助中心</a></div>
                        <div class="erji5_div3"><a href="#">服务中心</a></div>
                        <div class="erji5_div4"><a href="#">知识产权</a></div>
                    </div>
                </li>
                <li class="l7"><a href="#">手机版&nbsp;&nbsp;&nbsp;&nbsp;<span> ☎</span></a>
                    <div class="erji6">
                        <img src="<%=path%>/images/front/ercode.jpg">
                    </div>
                </li>
                <li class="l8"><a href="#">更多&nbsp;&nbsp;▼
                    <div class="erji7">
                        <h2>合作专区</h2>
                        <div class="erji7_div1"><a href="#">联名卡申请</a></div>
                        <div class="erji7_div1"><a href="#">唯品卡</a></div>
                        <div class="erji7_div1"><a href="#">支付专区</a></div>
                        <hr>
                        <h3>关于我们</h3>
                        <div class="erji7_div1"><a href="#">联名卡申请</a></div>
                        <div class="erji7_div1"><a href="#">唯品卡</a></div>
                        <div class="erji7_div1"><a href="#">支付专区</a></div>
                    </div>
                </a></li>
            </ul>
        </div>
    </header>
    <section>
        <div classs="section_header">
            <div class="header_div1">
                <img src="<%=path%>/images/front/3.png">
            </div>
            <div class="header_div2">
                <img src="<%=path%>/images/front/2.png" class="c-service-img">
            </div>
            <!-- 搜索框 -->
            <div class="c-search-form">
                <input class="c-search-input "  placeholder="大家都在搜：瑞士双肩包"   type="text">
                <a class="c-search-button" href="###">
                    <span class="c-search-icon"></span>
                </a>
            </div>
            <!-- 购物袋 -->
            <div  class="head-cart">
                <a href="<%=path%>/jsp/front/shopcart.jsp ">
                    <span class="ico-bag"></span>
                    <span class="mycarttext-default">购物袋</span>
                    <span class="productItems">0</span>
                </a>
            </div>
        </div>
        <!-- 分类 -->
        <div class="section_headerder">
            <ul>
                <li><a href="<%=path%>/index/IndexAction.action">首页</a></li>
                <c:forEach var="category" items="${categoryList}">
                    <li><a href="${path}/product/productfindByCid.action?cid=${category.cid}">${category.cname}</a> </li>
                </c:forEach>
            </ul>
        </div>

    </section>
</body>
</html>