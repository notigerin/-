<%--
  Created by IntelliJ IDEA.
  User: 164328
  Date: 2019/6/18
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="/lib/html5shiv.js"></script>
    <script type="text/javascript" src="/lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="/static/h-ui.admin/css/style.css" />
    <link rel="stylesheet" href="/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="/lib/layui/css/layui.css" media="all">
    <!--[if IE 6]>
    <script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>产品分类</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 资讯管理 <span class="c-gray en">&gt;</span> 分类管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<table class="table">
    <tr>
        <td width="200" class="va-t"><ul id="treeDemo" class="ztree"></ul></td>
        <td class="va-t"><iframe ID="testIframe" Name="testIframe" FRAMEBORDER=0 SCROLLING=AUTO width=100%  height=390px SRC="/page/article-category-add"></iframe></td>
    </tr>
</table>


<div class="layui-collapse" lay-accordion="">
    <div class="layui-colla-item">
<%--        <h2 class="">文豪</h2>--%>
        <div class="layui-tree-entry">
            <div class="layui-tree-main">
                <span class="layui-tree-iconClick layui-tree-icon layui-colla-title">
                    <i class="layui-icon layui-icon-rate"></i>
                </span>
                <input type="checkbox" name="authId" title="{{item.name}}" value="{{item.id}}">
                <div class="layui-unselect layui-form-checkbox">
                    <span>{{item.name}}</span>
                    <i class="layui-icon layui-icon-ok"></i>
                </div><br/>
            </div>
        </div>
        <div class="layui-colla-content layui-show">

            <div class="layui-collapse" lay-accordion="">
                <div class="layui-colla-item">
                    <h2 class="layui-colla-title">唐代</h2>
                    <div class="layui-colla-content layui-show">

                        <div class="layui-collapse" lay-accordion="">
                            <div class="layui-colla-item">
                                <h2 class="layui-colla-title">杜甫</h2>
                                <div class="layui-colla-content layui-show">
                                    伟大的诗人
                                </div>
                            </div>
                            <div class="layui-colla-item">
                                <h2 class="layui-colla-title">李白</h2>
                                <div class="layui-colla-content">
                                    <p>据说是韩国人</p>
                                </div>
                            </div>
                            <div class="layui-colla-item">
                                <h2 class="layui-colla-title">王勃</h2>
                                <div class="layui-colla-content">
                                    <p>千古绝唱《滕王阁序》</p>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="layui-colla-item">
                    <h2 class="layui-colla-title">宋代</h2>
                    <div class="layui-colla-content">
                        <p>比如苏轼、李清照</p>
                    </div>
                </div>
                <div class="layui-colla-item">
                    <h2 class="layui-colla-title">当代</h2>
                    <div class="layui-colla-content">
                        <p>比如贤心</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">科学家</h2>
        <div class="layui-colla-content">
            <p>伟大的科学家</p>
        </div>
    </div>
    <div class="layui-colla-item">
        <h2 class="layui-colla-title">艺术家</h2>
        <div class="layui-colla-content">
            <p>浑身散发着艺术细胞</p>
        </div>
    </div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    layui.use(['element', 'layer'], function(){
        var element = layui.element;
        var layer = layui.layer;

        //监听折叠
        element.on('collapse(test)', function(data){
            layer.msg('展开状态：'+ data.show);
        });
    });

    var setting = {
        view: {
            dblClickExpand: false,
            showLine: true,
            selectedMulti: false
        },
        data: {
            simpleData: {
                enable:true,
                idKey: "id",
                pIdKey: "pId",
                rootPId: ""
            }
        }
        // , callback: {
        //     beforeClick: function(treeId, treeNode) {
        //         var zTree = $.fn.zTree.getZTreeObj("tree");
        //         if (treeNode.isParent) {
        //             zTree.expandNode(treeNode);
        //             return false;
        //         } else {
        //             demoIframe.attr("src",treeNode.file + ".html");
        //             return true;
        //         }
        //     }
        // }
    };

    var zNodes =[
        { id:1, pId:0, name:"一级分类", open:true},
        { id:11, pId:1, name:"文章"},
        { id:111, pId:11, name:"三级分类"},
        { id:112, pId:11, name:"三级分类"},
        { id:113, pId:11, name:"三级分类"},
        { id:114, pId:11, name:"三级分类"},
        { id:115, pId:11, name:"三级分类"},
        { id:12, pId:1, name:"图片"},
        { id:121, pId:12, name:"三级分类 1-2-1"},
        { id:122, pId:12, name:"三级分类 1-2-2"},
    ];

    var code;

    function showCode(str) {
        if (!code) code = $("#code");
        code.empty();
        code.append("<li>"+str+"</li>");
    }

    function proJSON(oldArr, pid) {
        var newArr = [];
        var self = this;
        oldArr.map(function(item) {
            if(item.pId == pid) {
                var obj = {
                    id: item.id,
                    value: item.name
                }
                var childs = self.proJSON(oldArr, item.id);
                if(childs.length > 0) {
                    obj.childs = childs
                }
                newArr.push(obj)
            }

        })
        return newArr;
    };

    $(function(){

        $.ajax({
            "url": "/Categories/list",
            type: "post",
            dataType: "json",
            success: function (res) {
                var d = res.data;
                var testData = proJSON(d, 0);
                console.log(testData);

                $(document).ready(function() {
                    var t = $("#treeDemo");
                    t = $.fn.zTree.init(t, setting, d);
                    demoIframe = $("#testIframe");
                    var zTree = $.fn.zTree.getZTreeObj("tree");
                })
            }
        })
    })
</script>
</body>
</html>
