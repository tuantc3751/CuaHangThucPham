<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <title>DataTables Paging Client-Side</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
</head>
<body>
    <table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>

    <script>
        $(document).ready(function() {
            $.ajax({
                url: '/admin/product/data2',
                type: 'GET',
                dataType: 'json',
                success: function(response) {
                    $('#example').DataTable({
                        data: response.data,
                        columns: [
                            { data: 'id' },
                            { data: 'name' },
                            { data: 'email' }
                        ],
                        "paging": true,  // Kích hoạt phân trang
                        "pageLength": 10 // Số lượng bản ghi trên mỗi trang
                    });
                }
            });
        });
    </script>
</body>
</html>
