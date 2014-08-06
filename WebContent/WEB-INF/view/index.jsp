<%@page import="ca.ubc.ctlt.ubclibrary.UBCLibraryServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="bbNG" uri="/bbNG"%>

<bbNG:genericPage ctxId="ctx" >
<iframe id="contentFrame" style="height: 750px; border:none; margin: 0; padding: 0; width: 100%;" frameborder="0" name="content" title="Content"></iframe>
<form action="<% out.print(request.getContextPath()); %>/setting" method="GET" id="frameContent">
		URL: <input type="text" value="<% out.print(request.getAttribute("url").toString()); %>" size="50" name="url">
		<br> 
		<br> 
		Secret Key: <input type="text" value="<% out.print(request.getAttribute("secret_key").toString()); %>" size="30" name="secret_key">
		<br> 
		<br> 
		<input TYPE="SUBMIT" VALUE="Submit">
</form>
<script>
    var contentFrame = document.getElementById("contentFrame");
    var frameContent = (contentFrame.contentDocument) ? contentFrame.contentDocument: contentFrame.contentWindow.document;
    var fc = document.getElementById("frameContent");
    var pane = document.getElementById("globalNavPageContentArea").getElementsByClassName("contentPaneWide clearfix tabbedPane portal")[0];
    pane.style.marginLeft = '0px';
    pane.style.marginRight = '0px';
    frameContent.body.appendChild(fc);
    document.getElementById("contentFrame").style.height = document.getElementById("content").offsetHeight + 'px';
    frameContent.getElementById("frameContent").submit();
</script>
</bbNG:genericPage>
