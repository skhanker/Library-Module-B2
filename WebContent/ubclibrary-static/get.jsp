<%@page import="ca.ubc.ctlt.ubclibrary.UBCLibrarySigService"%>
<%@page import="ca.ubc.ctlt.ubclibrary.UBCLibraryServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.Date" %>
<%@ page import = "blackboard.platform.BbServiceManager" %>
<%@ page import = "blackboard.platform.session.BbSession" %>
<%@ taglib prefix="bbNG" uri="/bbNG"%>
<bbNG:genericPage ctxId="ctx" >

<% 
  UBCLibrarySigService sigService = new UBCLibrarySigService();
  String consumerKey = "ubclibrary";
  String signatureMethod = "HMAC-SHA1";
  String version = "1.0";
  String timestamp = String.valueOf(new Date().getTime()); 
  String nonce = String.valueOf(Math.random() * 100000000);
  String user_id = ctx.getUser().getBatchUid();
  String signature = sigService.generateSig(consumerKey, signatureMethod, version, user_id, timestamp, nonce);
%>
<iframe id="contentFrame" style="height: 750px; border:none; margin: 0; padding: 0" frameborder="0" name="content" title="Content"></iframe>
<form method="POST" action="<%= new UBCLibraryServlet().getParam("url") %>" id="frameContent">
  <input type="hidden" value="<%= consumerKey %>" name="oauth_consumer_key" id="oauth_consumer_key">
  <input type="hidden" value="<%= signatureMethod %>" name="oauth_signature_method" id="oauth_signature_method">
  <input type="hidden" value="<%= timestamp %>" name="oauth_timestamp" id="oauth_timestamp">
  <input type="hidden" value="<%= nonce %>" name="oauth_nonce" id="oauth_nonce">
  <input type="hidden" value="<%= version %>" name="oauth_version" id="oauth_version">
  <input type="hidden" value="<%= signature %>" name="oauth_signature" id="oauth_signature">
  <input type="hidden" value="<%= user_id %>" name="user_id" id="user_id">
  <input type="hidden" value="<%= request.getParameter("hash") %>" name="hash" id="hash">
</form>

<script>
    var contentFrame = document.getElementById("contentFrame");
    var frameContent = (contentFrame.contentDocument) ? contentFrame.contentDocument: contentFrame.contentWindow.document;
    var fc = document.getElementById("frameContent");
    frameContent.body.appendChild(fc);
    document.getElementById("contentFrame").style.height = document.getElementById("content").offsetHeight + 'px';
    frameContent.getElementById("frameContent").submit();
</script>
</bbNG:genericPage>
