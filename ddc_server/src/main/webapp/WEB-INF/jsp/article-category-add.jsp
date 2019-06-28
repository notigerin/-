<%--
  Created by IntelliJ IDEA.
  User: 164328
  Date: 2019/6/18
  Time: 14:59
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
    <link rel="stylesheet" type="text/css" href="/static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>添加产品分类</title>
</head>
<body>
<div class="page-container">
    <form action="" method="post" class="form form-horizontal" id="form-user-add">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">
                <span class="c-red">*</span>
                分类名称：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <input type="text" class="input-text" value="" placeholder="" id="name" name="product-category-name">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">上级分类</label>
            <div class="formControls col-xs-6 col-sm-6">
                <select name="pId" id="parentId" lay-filter="aihao">
                    <option value="0" name="pId">无</option>
                </select>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">备注：</label>
            <div class="formControls col-xs-6 col-sm-6">
                <textarea name="" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" onKeyUp="$.Huitextarealength(this,100)"></textarea>
                <p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" type="button" id="addCategory" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
    $(function () {
        $.ajax({
            "url": "/Categories/list",
            type: "post",
            dataType: "json",
            success: function (res) {
                for (var i = 0; i <res.data.length; i++) {
                    var d = res.data[i];
                    if(d.level == 1) {
                        var li = "<option value=\"" + d.id + "\" name=\"pId\">" + d.name + "</option>";
                        $("#parentId").append(li);
                    }else{
                        for (var j = 0; j <res.data.length; j++) {
                            var dj = res.data[j];
                            if(dj.id == d.pId){
                                var lj = "<option value=\"" + d.id + "\" name=\"pId\">" + dj.name +"---"+ d.name + "</option>";
                                $("#parentId").append(lj);
                            }
                        }
                    }
                }
            }
        });

        $("#addCategory").click(function () {
            //获取值
            var name = $("#name").val();
            var pId = $("#parentId").val();
            var remark = $('textarea').val();
            $.ajax({
                url: "/Categories/add",
                type: "post",
                //注意序列化的值一定要放在最前面,并且不需要头部变量,不然获取的值得格式会有问题
                data: {
                    "name": name,
                    "pId": pId,
                    "remark": remark
                },
                dataType: "json",
                success: function (data) {
                    // alert(data.result);
                }
            })
            parent.location.reload();
        })
        $(function () {

        });
    })
</script>
</body>
</html>
