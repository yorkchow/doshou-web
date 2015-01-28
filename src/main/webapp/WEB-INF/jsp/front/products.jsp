<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="doshou" tagdir="/WEB-INF/tags" %>
<doshou:frontHeader title="${title}" keywords="${keywords}"/>

<div id="mobile-header">
    <nav id="sidr" role="mobile">
        <h3>Menu </h3><div class="responsive-trig uptop" id="simple-close" href="#sidr"></div>

        <div class="menu-primary-container">
            <ul id="menu-primary" class="cbp-spmenu">
                <li class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home">
                    <a href="/">发现</a>
                </li>
                <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children">
                    <a href="#">精品频道 <b class="caret"></b></a>
                    <!-- Category List -->
                    <ul class="sub-menu">
                        <li class="menu-item menu-item-type-custom menu-item-object-custom">
                            <a href="/all">全部</a>
                        </li>
                        <c:forEach var="cat" items="${cats}">
                            <li class="menu-item menu-item-type-custom menu-item-object-custom">
                                <a href="${ctx}/cat/${cat.id}">${cat.name}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </li>
                <li class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home">
                    <a href="/store">店铺促销</a>
                </li>
            </ul>
        </div>
    </nav>
</div>

<div class="entire-site-wrap">
    <div class="site-margin">
        <div class="site-wrap-shadow">
            <header class="header-wrap">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="logo">
                                <a href="/" title="剁手么">
                                    <img src="${ctx}/static/front/images/logonormal3.png" data-at2x="${ctx}/static/front/images/logo2x3.png"/>
                                </a>
                            </div><!--end logo-->
                        </div>

                        <div class="col-md-9 rel">
                            <div class="responsive-trig" id="simple-menu" href="#sidr"></div>
                            <nav class="menuwrap" role="main">
                                <div class="menu-primary-container">
                                    <ul id="menu-primary-1" class="sf-menu-primary">
                                        <li class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home">
                                            <a href="/all">全部</a>
                                        </li>
                                        <li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-165">
                                            <a href="#">精品频道 <b class="caret"></b></a>
                                            <!-- Category List -->
                                            <ul class="sub-menu">
                                                <li class="menu-item menu-item-type-custom menu-item-object-custom">
                                                    <a href="/all">全部</a>
                                                </li>
                                                <c:forEach var="cat" items="${cats}">
                                                    <li class="menu-item menu-item-type-custom menu-item-object-custom">
                                                        <a href="${ctx}/cat/${cat.id}">${cat.name}</a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                        <li class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home">
                                            <a href="/store">店铺促销</a>
                                        </li>
                                    </ul>
                                </div>
                            </nav><!--end navbar primary-->
                        </div>
                    </div><!--end row-->
                </div><!--end container-->
            </header><!-- end of menu and logo section -->

            <section class="section-wrap">
                <div class="container">
                    <div class="row">
                        <div id="mainmasonry">
                            <!-- Product List -->
                            <c:forEach var="product" items="${products}">
                                <div class="col-xs-12 col-sm-6 col-md-4 bump">
                                    <div class="colored nopbump rel">
                                        <div class="post type-post status-publish format-image has-post-thumbnail hentry category-photography tag-animals tag-doggy"></div>
                                        <div class="singlecp bumpsm dark">
                                            <a href="${product.url}" target="_blank">
                                                <img src="${ctx}/static/front/images/pixel.jpg" data-url="${product.imgUrl}" class="loadingImg img-responsive opac"/>
                                            </a>
                                        </div>

                                        <div class="post-text-grip topbtmbumpmin">
                                            <p><a class="read-more" href="${product.url}" target="_blank">${product.brief}</a></p>
                                            <p style="margin-top:15px">
                                                <a href="${product.url}" class="btn btn-danger" role="button" target="_blank" style="float: right;">去抢购</a>
                                                <span style="font-size: 2em;">
                                                    ¥<fmt:formatNumber value="${product.shopPrice/100}" maxFractionDigits="1"/>
                                                </span>
                                                <del>
                                                    ¥<fmt:formatNumber value="${product.marketPrice/100}" maxFractionDigits="1"/>
                                                </del>
                                                <span class="glyphicon glyphicon-tag" style="padding: 10px;color: #d9534f;">
                                                    <fmt:formatNumber value="${product.shopPrice*10.0/product.marketPrice}" maxFractionDigits="1"/>折
                                                </span>
                                            </p>
                                        </div>

                                        <div class="post-text-grip linetop-pads">
                                            <div class="infodiv accent pull-left bumpright">${product.addDate}</div>
                                            <div class="infodiv fa fa-comments pull-right">${product.comments}</div>
                                            <div class="infodiv fa fa-shopping-cart pull-right">${product.sales}</div>
                                        </div>

                                    </div><!--colored-->
                                </div><!--four col-->
                            </c:forEach>

                        </div><!--end masonry grid-->
                        <!--
                        <div class="col-md-4 col-md-offset-4">
                            <div class="pagination-load-more">
                                <div class="pagination-me centertext">
                                    <a href="http://aonethemes.com/infinitygrid/page/2/" >加载更多...</a>
                                </div>

                                <span class="pagination-span-load"></span>
                            </div>
                        </div>
                        -->
                    </div>
                </div>

                <ul class="list-group back-top">
                    <li class="list-group-item">
                        <a href="#"><span class="glyphicon glyphicon-chevron-up"></span></a>
                    </li>
                </ul>
            </section>

            <doshou:frontFooter/>


        </div><!--shadow-->
    </div><!--margin-->
</div><!--end entiresite wrap-->

<script>
    $(function(){
        $(".loadingImg").scrollLoading();
    });
</script>
</body>
</html>
