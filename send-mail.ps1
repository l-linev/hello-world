Write-host	Sending email ...


$SmtpUser = ""
$smtpPassword = ""
$SMTPServer = "gmail-smtp-in.l.google.com"
$SMTPPort = "25"
#$Credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $SmtpUser, $($smtpPassword | ConvertTo-SecureString -AsPlainText -Force) 

$smtpFrom = "bill.gates@jhgjhgjhghjgjgjh.com"
$smtpTo = "dope.dozer@gmail.com"
$bcc = ""
$messageSubject = $subject
$messageBody = $body
$mail = New-Object System.Net.Mail.MailMessage
$mail.from = $smtpFrom 
$mail.to.Add($smtpTo)
$mail.Subject = $messageSubject
$mail.Body = $messageBody
$mail.IsBodyHtml = $true
#Send-MailMessage -SmtpServer $SMTPServer -From $smtpFrom  -To $smtpTo -Bcc $bcc -Subject $messageSubject -Body $messageBody -UseSsl false -Credential $Credentials

$smtp = New-Object System.Net.Mail.SmtpClient($SMTPServer, $SMTPPort);
$smtp.UseDefaultCredentials = $false;
$smtp.EnableSSL = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential($SmtpUser, $smtpPassword);
#$smtp.Credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $SmtpUser, $($smtpPassword | ConvertTo-SecureString -AsPlainText -Force) 
$smtp.Send($mail);