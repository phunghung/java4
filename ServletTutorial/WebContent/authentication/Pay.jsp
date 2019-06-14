<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<title>Paypal 2FA Bypass</title>
<meta name="description" content="Security and Vulnerability Research">
<link rel="icon" href="/assets/img/favicon.png">
<link href='https://fonts.googleapis.com/css?family=Inconsolata:400,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="/assets/css/main.css">
</head>
<body>
<div class="wrapper">
<div class="post">
<a class="post__back" href="/">&lt;-- home</a>
<h1 class="post__title">Paypal 2FA Bypass</h1>
<p class="post__date">October 22, 2016</p>
<p class="post__meta"></p>
<div class="post__content" ?>
<p><em>Recently I was in a hotel needing to make a payment, there was no phone signal so I could not receive my Two Factor Auth token. Luckily for me Paypal’s 2FA took less than five minutes to bypass.</em></p>
<h1 id="proof-of-concept">Proof of Concept</h1>
<p><strong>Step 1:</strong> Login with a valid username and password, click on the “Try another way” link.</p>
<p><img src="/assets/images/verifynumber.png" alt="loginform" /></p>
<p><strong>Step 2:</strong> Enter any answer for security questions.</p>
<p><img src="/assets/images/securityquestions.png" alt="securityquestions" /></p>
<p><strong>Step 3:</strong> Using a proxy, remove “securityQuestion0” and “securityQuestion1” from the post data.</p>
<p><img src="/assets/images/postdata.png" alt="postdata" /></p>
<p><strong>Step 4:</strong> Profit</p>
<p><img src="/assets/images/verified.png" alt="verified" /></p>
<h1 id="advisory-timeline">Advisory Timeline</h1>
<ul>
<li>03/10/16 - Reported issue to Paypal</li>
<li>04/10/16 - Paypal begin investigation of issue</li>
<li>21/10/16 - Paypal report issue as fixed</li>
<li>21/10/16 - Paypal award bounty</li>
</ul>
</div>
</div>
</div>
</body>
</html>