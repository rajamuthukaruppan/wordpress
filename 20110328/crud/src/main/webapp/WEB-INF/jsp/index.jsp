<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
 
 
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<title>DB Parameters</title>
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />
  
</head>
<body>
<h3><c:out  value="${message}"/></h3>
 
<h3>Items:</h3>
<table border="1">
<thead>
    <td>Id</td>
    <td>Name</td>
</thead>
<tbody>
<c:forEach items="${items}" var="item" >
    <tr>
    <td><c:out value="${item.itemId}"/></td>
    <td><c:out value="${item.name}"/></td>   
    </tr>
</c:forEach>
</tbody>
</table>
 
    <form method="post">     
        <label>Operation: </label>
        <select name="operation">
            <option value="C">Create</option>
            <option value="R">Read</option>
            <option value="U">Update</option>
            <option value="D">Delete</option>
        </select>
        <br/>
        <label>ID: </label><input type="text" name="id"/><br/>
        <input type="submit" value="submit"/><br/>
    </form>
 
This page saves data to an HyperSQL database located in the src/main/webapp/WEB-INF/db folder.
</body>
</html>
