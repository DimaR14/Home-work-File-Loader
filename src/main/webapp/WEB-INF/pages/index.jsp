<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>File Loader</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">

    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul id="fileList" class="nav navbar-nav">
                    <li><button type="button" id="add_file" class="btn btn-default navbar-btn">Add File</button></li>
                    <li><button type="button" id="delete_file" class="btn btn-default navbar-btn">Delete File</button></li>
                </ul>
            </div>

            <table class="table table-striped">
                <thead>
                <tr>
                    <td><b>Name</b></td>
                    <td><b>Size</b></td>
                </tr>
                </thead>
                <c:forEach items="${files}" var="file">
                    <tr>
                        <td>${file.name}</td>
                        <td>${file.size}</td>
                    </tr>
                </c:forEach>

            </table>

            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${allPages ne null}">
                        <c:forEach var="i" begin="1" end="${allPages}">
                            <li><a href="/?page=<c:out value="${i - 1}"/>"><c:out value="${i}"/></a></li>
                        </c:forEach>
                    </c:if>
                </ul>
            </nav>


            <script>
                $('.dropdown-toggle').dropdown();

                $('#add_file').click(function(){
                    window.location.href='/file_add_page';
                });

                $('#delete_file').click(function(){
                    window.location.href='/file_delete_page';
                });

                $('#reset').click(function(){
                    window.location.href='/reset';
                });

            </script>

        </div>
    </nav>
</div>
</body>
</html>