<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
    <base href="http://localhost:8082/Project/index.jsp">
    <style>html { font-size: 12px; font-family: Arial, Helvetica, sans-serif; }</style>
    <title></title>
    <link href="css/kendo.common.min.css" rel="stylesheet" />
    <link href="css/kendo.default.min.css" rel="stylesheet" />
    <link href="css/kendo.dataviz.min.css" rel="stylesheet" />
    <link href="css/kendo.dataviz.default.min.css" rel="stylesheet" />
    <script src="<c:url value='js/jquery.min.js'/>" ></script>
    <script src="<c:url value='js/kendo.all.min.js'/>" ></script>
</head>
<body>
    <div id="example">
    <script src="<c:url value='js/ucamp.js'/>"></script>
    <div class="demo-section">
        <div id="listView"></div>
        <div id="pager" class="k-pager-wrap"></div>
    </div>
    <script type="text/x-kendo-template" id="template">
        <div class="student">
            <img src="http://localhost:8082/teampro/img/UCAMP/#= StudentID #.PNG" alt="#: StudentName # image" />
            <h3>#:StudentName#</h3>
            <p>
				<br>
				#:kendo.toString(StuCode)#<br>
				#:kendo.toString(StuCompany)#<br>
				#:kendo.toString(StuEmail)#<br>
			</p>
        </div>
    </script>
    <script>
        $(function() {
            var dataSource = new kendo.data.DataSource({
                data: students,
                pageSize: 19
            });

            $("#pager").kendoPager({
                dataSource: dataSource
            });

            $("#listView").kendoListView({
                dataSource: dataSource,
                template: kendo.template($("#template").html())
            });
        });
    </script>

    <style scoped>
        .demo-section {
            width: 900px;
            margin: 20px auto;
            border: 0;
            background: none;
        }
        #listView {
            padding: 10px 5px;
            margin-bottom: -1px;
            min-height: 510px;
        }
        .student {
            float: left;
            position: relative;
            width: 131px;
            height: 170px;
            margin: 0 5px;
            padding: 0;
        }
        .student img {
            width: 140px;
            height: 140px;
        }
        .student h3 {
            margin: 0;
            padding: 3px 5px 0 0;
            max-width: 96px;
            overflow: hidden;
            line-height: 1.1em;
            font-size: .9em;
            font-weight: normal;
            text-transform: uppercase;
            color: #999;
        }
        .student p {
            visibility: hidden;
        }
        .student:hover p {
            visibility: visible;
            position: absolute;
            width: 140px;
            height: 140px;
            top: 0;
            margin: 0;
            padding: 0;
            line-height: 20px;
            vertical-align: middle;
            text-align: center;
            color: #fff;
            background-color: rgba(0,0,0,0.75);
            transition: background .2s linear, color .2s linear;
            -moz-transition: background .2s linear, color .2s linear;
            -webkit-transition: background .2s linear, color .2s linear;
            -o-transition: background .2s linear, color .2s linear;
        }
        .k-listview:after {
            content: ".";
            display: block;
            height: 0;
            clear: both;
            visibility: hidden;
        }
    </style>
</div>
</body>
</html>
