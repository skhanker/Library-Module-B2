<%@page import="ca.ubc.ctlt.ubclibrary.UBCLibraryServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="bbNG" uri="/bbNG"%>

<bbNG:genericPage ctxId="ctx" >
<iframe id="contentFrame" style="height: 750px; border:none; margin: 0; padding: 0; width: 100%;" frameborder="0" name="content" title="Content"></iframe>
<div id="frameContent">
<h3>Error</h3>
<br><br>
You are not authorized to view this page.
</div>
<script>
    var contentFrame = document.getElementById("contentFrame");
    var frameContent = (contentFrame.contentDocument) ? contentFrame.contentDocument: contentFrame.contentWindow.document;
    var fc = document.getElementById("frameContent");
    var pane = document.getElementById("globalNavPageContentArea").getElementsByClassName("contentPaneWide clearfix tabbedPane portal")[0];
    pane.style.marginLeft = '0px';
    pane.style.marginRight = '0px';
    frameContent.body.appendChild(fc);
    document.getElementById("contentFrame").style.height = document.getElementById("content").offsetHeight + 'px';
</script>
</bbNG:genericPage>
